#STAGE: 1

#Using an official ubuntu runtime as the base image
FROM ubuntu:latest as git

#Installing the requirements
RUN apt-get update && apt-get install -y git

#Set the working directory inside the container
WORKDIR /usr/git

# Cloning the git repo
RUN git clone https://github.com/chaitanya-0799/simple-python.git


#STAGE: 2

# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /usr/app

# Copy the current directory contents into the container at /app
COPY --from=git /usr/git/simple-python/requirements.txt /usr/git/simple-python/app.py /usr/app/

# Install the Python dependencies from the requirements.txt file
RUN pip install --no-cache-dir -r requirements.txt

# Expose port 5000 to the host machine
EXPOSE 5000

# Define the command to run the Flask app
CMD ["python", "app.py"]
