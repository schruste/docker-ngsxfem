FROM schruste/ngsolve:v6.2.2101

ARG NB_USER=jovyan
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}

USER ${NB_USER}
        
WORKDIR ${HOME}
        
RUN git clone -b v1.3.2101 --single-branch https://github.com/ngsxfem/ngsxfem.git ngsxfem
        
RUN pip3 install git+https://github.com/ngsxfem/ngsxfem.git@v1.3.2101 --user --upgrade --verbose

RUN python3 -c "import ngsolve; import xfem"        
                
