FROM continuumio/miniconda3

WORKDIR /workspace/:/usr/src/workspace/
COPY workspace/environment.yml .

RUN conda env create -f environment.yml 
RUN conda init bash
