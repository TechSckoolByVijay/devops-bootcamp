# Use an official Python runtime as a parent image
FROM ubuntu:20.04

# Install system dependencies
RUN apt-get update && \
    apt-get install -y python3 python3-pip unixodbc-dev libgssapi-krb5-2 && \
    rm -rf /var/lib/apt/lists/*

# Set the working directory to /app
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt /app

# Install any needed packages specified in requirements.txt
RUN pip3 install -r requirements.txt

# Copy the rest of the application code into the container at /app
COPY . /app

# Set environment variables for SQL Server
ENV SQL_SERVER_HOST=techsckool.database.windows.net
ENV SQL_SERVER_PORT=1433
ENV SQL_SERVER_DATABASE=sqlwebapp
ENV SQL_SERVER_USER=testuser
ENV SQL_SERVER_PASSWORD=P@ssword2023

# Expose port 8000 for the Django application
EXPOSE 8000

# Start the Django application
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
