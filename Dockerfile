# For more information, please refer to https://aka.ms/vscode-docker-python
FROM continuumio/miniconda3

WORKDIR /app

#RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
#USER appuser

COPY environment.yml /app

RUN conda init bash
RUN conda env create -f environment.yml

RUN echo "conda activate textgen" >> ~/.bashrc
SHELL ["/bin/bash", "--login", "-c"]

COPY . /app
COPY entrypoint.sh /app


ENV COMMANDLINE_ARGS="--listen --xformers --api --gpu 20 20"

ENTRYPOINT ["/bin/bash","/app/entrypoint.sh"]
