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


ENTRYPOINT ["/bin/bash","/app/entrypoint.sh"]
