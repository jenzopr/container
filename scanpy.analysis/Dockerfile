FROM jupyter/base-notebook:python-3.7.3
LABEL maintainer="Jens Preussner <jens.preussner@mpi-bn.mpg.de>"

ENV CONDA_DIR=/opt/conda

RUN \
    # Add bioconda & conda-forge channel
    $CONDA_DIR/bin/conda config --system --prepend channels bioconda && \
    $CONDA_DIR/bin/conda config --system --prepend channels conda-forge && \
    # Install scanpy via conda
    conda install --quiet --yes 'scanpy' 'opentsne' && \
    conda clean --all -f -y
