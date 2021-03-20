# base image to run python
FROM python:3.9.1-alpine

# change timezone and clean cache
ENV TZ=America/Sao_Paulo
RUN rm -rf /var/cache/apk/*

# copy app folder and install requirements
COPY ./app /app
RUN pip3 install -r app/requirements.txt --upgrade

# goes to app folder and run it
WORKDIR /app


CMD ["python", "/app/soma.py"]
