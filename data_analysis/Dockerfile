FROM ubuntu:bionic

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV PATH /opt/conda/bin:$PATH
ENV SHELL /bin/bash

RUN apt-get update --fix-missing && \
    apt-get install -y groff wget unzip bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 git curl vim htop tmux less && \
    apt-get clean

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-4.7.12-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh && \
    /opt/conda/bin/conda clean -tipsy && \
    ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    find /opt/conda/ -follow -type f -name '*.a' -delete && \
    find /opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /opt/conda/bin/conda clean -afy

RUN conda update -n base -c defaults conda
COPY environment.yml environment.yml
RUN conda env create -f environment.yml
RUN sed -i -e 's/conda activate base/conda activate ds/g' ~/.bashrc
ADD entrypoint.sh /bin/entrypoint
ENTRYPOINT [ "/bin/entrypoint" ]