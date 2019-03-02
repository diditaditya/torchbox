FROM nvidia/cuda:9.2-cudnn7-devel-ubuntu18.04

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,video,utility

RUN apt-get -y update 
RUN apt-get -y install software-properties-common ubuntu-drivers-common
RUN apt-get -y install python3.6 python3-pip python3-dev
RUN apt-get -y install libsm6 libxext6 libxrender-dev

RUN pip3 install numpy scipy pandas matplotlib jupyter \
  bcolz opencv-python seaborn graphviz sklearn_pandas \
  isoweek tqdm kaggle spacy fastai
# there is web socket problem if jupyter notebook is served by tornado 6.0, hence downgraded
RUN pip3 install tornado==5.1.1 jupyter_contrib_nbextensions jupyter_nbextensions_configurator
RUN pip3 install torch torchvision torchtext
RUN python3 -m spacy download en

# uncomment the following if kaggle.json is provided
COPY ./kaggle.json ~/.kaggle/

WORKDIR /torchbox

EXPOSE 8080
