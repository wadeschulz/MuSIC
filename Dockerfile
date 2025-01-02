FROM continuumio/miniconda3:22.11.1

RUN apt -qyy update && apt -qyy upgrade
RUN apt -qyy install cmake libgmp-dev libmpfr-dev libmpc-dev build-essential

RUN git clone https://github.com/idekerlab/MuSIC.git
WORKDIR /MuSIC

RUN conda create -y -n music python=3.6.2
RUN conda activate music
RUN pip install -r installation/requirements.txt

RUN ./installation/install.sh