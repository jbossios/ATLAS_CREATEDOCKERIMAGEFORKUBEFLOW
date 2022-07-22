# Select a base image from which to extend
FROM registry.cern.ch/ml/kf-14-pytorch-jupyter-kale:v1

USER root

# Install required packages
COPY requirements.txt /requirements.txt
RUN apt-get -yq update
RUN apt-get -yq install openssh-client
RUN apt-get -yq install vim
RUN pip3 install -r /requirements.txt

ARG ROOT_BIN=root_v6.26.04.Linux-ubuntu22-x86_64-gcc11.2.tar.gz

WORKDIR /opt

RUN apt-get update -qq \
 #&& ln -sf /usr/share/zoneinfo/UTC /etc/localtime \
 #&& apt-get -y install $(cat packages) wget\
 #&& rm -rf /var/lib/apt/lists/*\
 && wget https://root.cern/download/${ROOT_BIN} \
 && tar -xzvf ${ROOT_BIN} \
 && rm -f ${ROOT_BIN} \
 && echo /opt/root/lib >> /etc/ld.so.conf \
 && ldconfig
RUN yes | unminimize

ENV ROOTSYS /opt/root
ENV PATH $ROOTSYS/bin:$PATH
ENV PYTHONPATH $ROOTSYS/lib:$PYTHONPATH
ENV CLING_STANDARD_PCH none

USER jovyan

# The following line is mandatory:
CMD ["sh", "-c", \
     "jupyter lab --notebook-dir=/home/jovyan --ip=0.0.0.0 --no-browser \
      --allow-root --port=8888 --LabApp.token='' --LabApp.password='' \
      --LabApp.allow_origin='*' --LabApp.base_url=${NB_PREFIX}"]
