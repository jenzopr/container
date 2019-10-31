# Lock Bioc version
bioc_version = "3.9"

# Retrieve/provide tools --------------------------------------------------
# Provide the convenient "pacman" package management kit
if (!require(pacman, quietly = TRUE)) install.packages("pacman",
                                                       suppressUpdates = TRUE, type = "source") 

# Remove potential old Bioconductor version (ignored if not present)
pacman::p_delete(char = c("BioInstaller", "BiocManager"), quiet = TRUE)

# Fetch tools required here
pacman::p_load(char = c("BiocManager", "git2r", "magrittr", "remotes", "flexdashboard", "rprojroot", "tidyr", "assertive"),
               update = FALSE)

# Update everything (already present) -------------------------------------
BiocManager::install(checkBuilt = TRUE, ask = FALSE, version = bioc_version)

# Install github dependencies ------------------------------------------------
remotes::install_github("rstudio/gt", repos = BiocManager::repositories())
remotes::install_git(url = "https://gitlab.gwdg.de/loosolab/software/i2dash.git", repos = BiocManager::repositories())
# remotes::install_git(url = "https://gitlab.gwdg.de/loosolab/software/i2dash.scrnaseq.git", repos = BiocManager::repositories())
