---
title: C++ Jupyter Kernel Setup
date: 04/04/2021 
author:
 - Bhawick Jain
or: 20210404105248
version: 0.1.0
---

Having a Notebook to build, run _and_ discuss algorithm in C++ would be great. This docker setup aims to do just that.

## TODO
`[x]` Figure out a way to export, import and install the C++ conda environment to supper `docker-compose up / down` command  
`[x]` Write some C++ code and try out each Kernel that is available.  
`[?]` Is C++ 20 available or coming soon in CLing?   
`[?]` Why does `ENTRYPOINT [ "conda","run","--no-capture-output","-n","cling-jupyter"]` but `conda activate`?
`[?]` Why use an `env` folder, use [[2019-Sarmiento](https://towardsdatascience.com/a-guide-to-conda-environments-bc6180fc533)]  
`[ ]` Annotate and explain each step of the `Dockerfile` and `docker-compose.yaml` file.  
`[ ]` Create a vanilla Conda-Jupyter Docker setup  


## Usage

start up container, everything within `/workspace` is mounted into the container which also has a `workspace` folder.
```
docker-compose up --build
```

shutdown container
```
docker-compose down --rmi all -v
```

entering container shell with `cpp-jupyter` conda environment
```
docker-compose exec nb /bin/bash
conda activate cling-jupyter
```
Alternatively just use Jupyter Terminal within their web-app.


conda environment info
```
docker-compose exec nb /bin/bash
conda activate cling-jupyter
conda info
```

result should be
```
     active environment : cling-jupyter
    active env location : /opt/conda/envs/cling-jupyter
            shell level : 2
       user config file : /root/.condarc
 populated config files : 


          conda version : 4.9.2
    conda-build version : not installed
         python version : 3.8.5.final.0
       virtual packages : __glibc=2.28=0
                          __unix=0=0
                          __archspec=1=x86_64
       base environment : /opt/conda  (writable)
           channel URLs : https://repo.anaconda.com/pkgs/main/linux-64
                          https://repo.anaconda.com/pkgs/main/noarch
                          https://repo.anaconda.com/pkgs/r/linux-64
                          https://repo.anaconda.com/pkgs/r/noarch
          package cache : /opt/conda/pkgs
                          /root/.conda/pkgs
       envs directories : /opt/conda/envs
                          /root/.conda/envs
               platform : linux-64
             user-agent : conda/4.9.2 requests/2.24.0 CPython/3.8.5 Linux/4.19.121-linuxkit debian/10 glibc/2.28
                UID:GID : 0:0
             netrc file : None
           offline mode : False


```

export conda environment changes, only the ones you installed, let conda handle the dependencies. Remove `--from-history` if you want all package that are installed in the environment, dependencies or not. 
```
conda env export --from-history > environment.yml
```

## References

[[2019-Sarmiento](https://towardsdatascience.com/a-guide-to-conda-environments-bc6180fc533)] The Definitive Guide to Conda Environments

[[2021-Turner-Tauring](https://pythonspeed.com/articles/activate-conda-dockerfile/)] Activating a Conda environment in your Dockerfile

[[2018-Conda-Issue-7980](https://github.com/conda/conda/issues/7980)]

[[xues-cling-github](https://github.com/jupyter-xeus/xeus-cling)]

[[cling-cern](https://root.cern/cling/)]
