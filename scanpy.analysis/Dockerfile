FROM jupyter/base-notebook:python-3.7.3
LABEL maintainer="Jens Preussner <jens.preussner@mpi-bn.mpg.de>"

ENV CONDA_DIR=/opt/conda

COPY ./requirements.txt /tmp/requirements.txt

RUN \
    # Add bioconda & conda-forge channel
    $CONDA_DIR/bin/conda config --system --prepend channels bioconda && \
    $CONDA_DIR/bin/conda config --system --prepend channels conda-forge && \
    # Install scanpy via conda
    conda install --quiet --yes --file /tmp/requirements.txt && \
    conda clean --all -f -y && \
    rm -rf /tmp/requirements.txt

USER root
RUN \
    # Don't generate a token, just log in
    echo -e "\n\nc.NotebookApp.token = ''" >> /etc/jupyter/jupyter_notebook_config.py && \
    fix-permissions /etc/jupyter/
USER $NB_UID
