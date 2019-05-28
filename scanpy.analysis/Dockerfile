FROM jupyter/base-notebook:python-3.7.3
LABEL maintainer="Jens Preussner <jens.preussner@mpi-bn.mpg.de>"

ENV CONDA_DIR=/opt/conda

RUN \
    # Add bioconda & conda-forge channel
    $CONDA_DIR/bin/conda config --system --prepend channels bioconda && \
    $CONDA_DIR/bin/conda config --system --prepend channels conda-forge && \
    # Install scanpy via conda
    conda install --quiet --yes cython python-annoy 'numpy >=1.13' scikit-learn scanpy opentsne && \
    conda clean --all -f -y && \
    # Install bbknn
    pip install bbknn

USER root
RUN \
    # Don't generate a token, just log in
    echo "c.NotebookApp.token = ''" >> /etc/jupyter/jupyter_notebook_config.py && \
    fix-permissions /etc/jupyter/
USER $NB_UID
