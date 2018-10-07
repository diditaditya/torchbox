FROM nvidia/cuda:9.2-cudnn7-devel-ubuntu18.04

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,video,utility

RUN apt-get -yyq update && apt-get -yyq upgrade
RUN apt-get -yyq install software-properties-common ubuntu-drivers-common
RUN apt-get -yyq install python3.6 python3-pip python3-dev
RUN apt-get -yyq install libsm6 libxext6 libxrender-dev

RUN pip3 install numpy scipy pandas matplotlib jupyter \
  bcolz opencv-python seaborn graphviz sklearn_pandas isoweek tqdm kaggle
RUN pip3 install https://github.com/pytorch/text/archive/master.zip
RUN pip3 install jupyter_contrib_nbextensions jupyter_nbextensions_configurator
RUN pip3 install http://download.pytorch.org/whl/cu92/torch-0.4.1-cp36-cp36m-linux_x86_64.whl
RUN pip3 install torchvision

# uncomment the following if kaggle.json is provided
# COPY ./kaggle.json ~/.kaggle/

WORKDIR /torchbox

EXPOSE 8080
