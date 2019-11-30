FROM palmoreck/jupyterlab-c-kernel-binder:1.1.0
ARG NB_USER=miuser
ARG NB_UID=1000
ENV USER ${NB_USER}
ENV NB_UID ${NB_UID}
ENV HOME /home/${NB_USER}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}


RUN pip install --user git+https://github.com/brendan-rius/jupyter-c-kernel.git && sudo python3.7 /home/miuser/.local/lib/python3.7/site-packages/jupyter_c_kernel/install_c_kernel
