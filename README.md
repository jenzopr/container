# container

Dockerfiles for important containers

## RStudio for single-cell RNA-seq analysis

### Building the container

```
docker build --squash -t scrnaseq.analysis:r6.1_bioc3.9 https://gitlab.gwdg.de/jens.preussner/container.git#:scRNAseq.analysis
```

### Running the container

```
docker run -d -p 172.16.12.92:8787:8787 -e USERID=$UID -v /path/to/workspace:/home/rstudio/path/to/workspace scrnaseq.analysis:r6.1_bioc3.9
```

## Jupyter for scanpy and stream analysis

```
docker run -d -p 172.16.12.92:8888:8888 -v /workspace:/home/jovyan/work -e NB_UID=xxxx -e NB_GID=xxxx --user root scanpy.analysis:py3.7.3
```