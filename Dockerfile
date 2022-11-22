FROM ubuntu
RUN apt-get update -y && \
    apt-get update -y python-pip python-dev

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT ["python"]

CMD ["pyapp_tatum.py"]
testabcd
last
cool
