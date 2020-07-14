FROM continuumio/miniconda3:latest

LABEL authors="Angelos Tzotsos,Markus Neteler"
LABEL maintainer="neteler@mundialis.de"

# update conda and install arcsi using conda package manager and clean up (rm tar packages to save space)
RUN conda update -n base conda
RUN conda config --add channels conda-forge && \
conda update --yes conda && \
conda install --yes python=3.7 arcsi && \
conda clean --yes -t

# set gdal paths
ENV GDAL_DRIVER_PATH /opt/conda/lib/gdalplugins:$GDAL_DRIVER_PATH
ENV GDAL_DATA /opt/conda/share/gdal
ENV PROJ_LIB=/opt/conda/share/proj
