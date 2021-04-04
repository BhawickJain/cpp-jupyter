FROM continuumio/miniconda3

WORKDIR /workspace/:/usr/src/workspace/
# COPY workspace/requirements.txt .

RUN conda install jupyter -y --quiet
RUN conda install -c conda-forge jupytext
