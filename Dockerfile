FROM openlabs/docker-wkhtmltopdf:latest
MAINTAINER Sharoon Thomas <sharoon.thomas@openlabs.co.in>

# Copy local code to the container image.
ENV APP_HOME /app
WORKDIR $APP_HOME
COPY . .


# Install dependencies for running web service
RUN apt-get update
RUN apt-get install -y python-pip
RUN pip install werkzeug executor gunicorn

# Show the extended help
CMD exec gunicorn --bind :$PORT  --workers 1 --threads 8 app:application
