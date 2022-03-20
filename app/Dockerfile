FROM ubuntu:18.04
WORKDIR /app
COPY . /app
RUN apt-get update -y && \
	apt-get install -y python3-pip python-pip python3-dev software-properties-common
RUN pip install  -r requirements.txt 
CMD [ "python", "eg_phonebook.py" ]


