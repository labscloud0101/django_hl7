FROM python:3.9

RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
		postgresql-client \
	&& rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /tmp
RUN ["chmod", "+x", "/tmp/entrypoint.sh"]

ENV MYSQL_HOST="DB_Server"
ENV MYSQL_USER="operations"
ENV MYSQL_PASSWORD="5TTnvuTDJJSq6"

WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . .

EXPOSE 8080
ENTRYPOINT [ "/tmp/entrypoint.sh" ]
