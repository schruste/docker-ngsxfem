FROM schruste/ngsolve:latest

USER root
        
WORKDIR /home/app        
RUN git clone https://github.com/ngsxfem/ngsxfem.git
WORKDIR /home/app/ngsxfem
RUN git checkout master
RUN git submodule update --init --recursive  
RUN mkdir /home/app/ngsxfem/build
WORKDIR /home/app/ngsxfem/build
RUN cmake -DBUILD_NGSOLVE=OFF ..     
RUN make -j3
RUN make install
                
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}
        
WORKDIR /home/${NB_USER}
                
