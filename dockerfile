# use an official python runtime as a parent image
FROM python:3.12.3-slim-bullseye

# set the working directory in the container\
WORKDIR /app

# copy the current directory content into the container at /app
COPY . /app

# Update system packages to reduce vulnerabilities
RUN apt-get update && apt-get upgrade -y && apt-get clean

# install any needed packages specified in the requirement file
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# make port 5000 available to the world outside this container
EXPOSE 5000

# DEFINE ENV VARIABLE
ENV FLASK_APP=app.py

# run the flask app
CMD [ "flask","run","--host=0.0.0.0"]