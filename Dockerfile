FROM continuumio/miniconda3:22.11.1

RUN apt -qyy update && apt -qyy upgrade
RUN apt -qyy install cmake libgmp-dev libmpfr-dev libmpc-dev build-essential

RUN git clone https://github.com/wadeschulz/MuSIC.git
WORKDIR /MuSIC

RUN conda create -y -n music python=3.6.2
ENV PATH /opt/conda/envs/music/bin:$PATH
RUN pip install -r installation/requirements.txt

RUN ./installation/install.sh
