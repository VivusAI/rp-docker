# For more information, please refer to https://aka.ms/vscode-docker-python
FROM continuumio/miniconda3

WORKDIR /app

RUN adduser appuser && chown -R appuser /app
USER appuser

COPY environment.yml /app

RUN conda env create -f environment.yml

RUN echo "conda activate textgen" >> ~/.bashrc
SHELL ["/bin/bash", "--login", "-c"]

COPY . /app
COPY entrypoint.sh /app


ENV COMMANDLINE_ARGS="--listen --xformers --api --gpu 20 20"
ENV API_STREAMING_PORT='5080'
ENV LISTEN_PORT='7880'

ENTRYPOINT ["/bin/bash","/app/entrypoint.sh"]
