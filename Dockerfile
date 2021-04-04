FROM continuumio/miniconda3

WORKDIR /workspace/:/usr/src/workspace/
COPY workspace/environment.yml .

RUN conda env create -f environment.yml 
# RUN . /opt/conda/etc/profile.d/conda.sh
# SHELL ["conda","run","-n","cling-jupyter","/bin/bash","-c"]
# SHELL ["/bin/bash"]
ENTRYPOINT [ "conda","run","--no-capture-output","-n","cling-jupyter"]