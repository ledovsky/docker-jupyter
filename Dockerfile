FROM continuumio/anaconda

RUN apt-get update && apt-get install -y git build-essential g++ && \
        apt-get clean
RUN apt-get install -y libfreetype6-dev && \
    apt-get install -y libglib2.0-0 libxext6 libsm6 libxrender1 libfontconfig1 --fix-missing

# Install XGBoost
RUN cd /usr/local/src && git clone --recursive https://github.com/dmlc/xgboost.git && cd xgboost && sh build.sh && cd python-package && python setup.py install

# Vowpal Rabbit
RUN apt-get install -y libboost-program-options-dev zlib1g-dev libboost-python-dev && \
    cd /usr/lib/x86_64-linux-gnu/ && rm -f libboost_python.a && rm -f libboost_python.so && \
    ln -sf libboost_python-py34.so libboost_python.so && ln -sf libboost_python-py34.a libboost_python.a && \
    pip install vowpalwabbit

# Tensorflow
RUN conda install tensorflow && pip install keras && KERAS_BACKEND=tensorflow

RUN pip install pymongo joblib gensim spacy

RUN pip install tqdm

RUN mkdir /data

WORKDIR "/data"

EXPOSE 8888

CMD ["jupyter", "notebook"]
