FROM rocker/shiny:3.6.1
LABEL maintainer="Jens Preussner <jens.preussner@mpi-bn.mpg.de>"

RUN \
    # Install package dependencies
    sudo -u shiny Rscript -e 'source("https://gitlab.gwdg.de/jens.preussner/container/raw/master/i2dash.deployment/setup.R")' && \
    # Set the time zone
    sh -c "echo 'Europe/Berlin' > /etc/timezone" && \
    dpkg-reconfigure -f noninteractive tzdata && \
    # Clean /tmp (downloaded packages)
    rm -r /tmp/* && \
    # Generate an ssh key
    sudo -u rstudio ssh-keygen -t ed25519 -N "" -f /home/rstudio/.ssh/id_ed25519

CMD ["R", "-e rmarkdown::run(dir = \"/srv/shiny-server/\", shiny_args = list(port = \"3838\"))"]