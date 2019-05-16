# Run like so:
#  podman pull rocker/rstudio && podman build --squash -t scRNAseq.analysis:latest https://gitlab.gwdg.de/jens.preussner/container.git#:scRNAseq.analysis

FROM rocker/rstudio:latest
MAINTAINER Jens Preussner (jens.preussner@mpi-bn.mpg.de)

# Place an '.Renviron' file that must contain a github access token line
# (see `usethis::browse_github_pat(); usethis::edit_r_environ()`) to
# prevent interference by github rate limiting.
# The file must reside in the same directory as the docker file
# COPY ./Renviron /root/.Renviron
# COPY ./Renviron /home/rstudio/.Renviron

RUN \
    # Install additional tools
    ## git-lfs in current base image requires backports
    echo 'deb http://http.debian.net/debian stretch-backports main' > /etc/apt/sources.list.d/stretch-backports-main.list && \
    ## Assure up-to-date package lists
    apt-get update && \
    ## Assure up-to-date environment
    apt-get dist-upgrade --assume-yes && \
    apt-get install --assume-yes --no-install-recommends \
      ## Fetch the additional tools
      git-lfs gnupg ssh-client \
      # Install libraries needed for compilation of the autonomics toolkit
      ## Dependencies of rgl
      libx11-dev libglu1-mesa-dev \
      ## Dependencies of roxygen2
      libxml2-dev zlib1g-dev \
      ## Dependencies of multipanelfigure (etc.)
      libmagick++-dev && \
    # Clean the cache(s)
    apt-get clean && \
    rm -r /var/lib/apt/lists/* && \
    # Set the time zone
    sh -c "echo 'Europe/Berlin' > /etc/timezone" && \
    dpkg-reconfigure -f noninteractive tzdata && \
    # Clean /tmp (downloaded packages)
    rm -r /tmp/* && \
    # Generate an ssh key
    sudo -u rstudio ssh-keygen -t ed25519 -N "" -f /home/rstudio/.ssh/id_ed25519

ENV \
    ROOT=TRUE \
    DISABLE_AUTH=TRUE
