# Retrieve/provide tools --------------------------------------------------
# Provide the convenient "pacman" package management kit
if (!require(pacman, quietly = TRUE)) install.packages("pacman",
                                                       suppressUpdates = TRUE)

# Remove potential old Bioconductor version (ignored if not present)
pacman::p_delete(char = c("BioInstaller", "BiocManager"), quiet = TRUE)

# Fetch tools required here
pacman::p_load(char = c("BiocManager", "git2r", "magrittr", "remotes", "rmarkdown", "rprojroot"),
               update = FALSE)

# Update everything (already present) -------------------------------------
BiocManager::install(checkBuilt = TRUE, ask = FALSE)

# Install packages ------------------------------------------------------
BiocManager::install(c("scater", "ComplexHeatmap", "biomaRt", "multipanelfigure", "reticulate", "BiocStyle"))

# Install github dependencies ------------------------------------------------
remotes::install_github("jenzopr/singlecellutils", repos = BiocManager::repositories())
# remotes::install_github("rstudio/gt", repos = BiocManager::repositories())

# Install i2dash ----------------------------------------------------------
# install_git(url = "https://gitlab.gwdg.de/loosolab/software/i2dash.git", repos = BiocManager::repositories())

# Setup/configure TinyTeX
if (pacman::p_exists("tinytex")) {
  ## Update or install depending presence of the actual TinyTeX
  if (tinytex:::is_tinytex()) tinytex::tlmgr_update()
  if (!tinytex:::is_tinytex()) tinytex::install_tinytex()
  if (!"koma-script" %in% tinytex::tl_pkgs()) tinytex::tlmgr_install(
    "koma-script")
}
