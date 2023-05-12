FROM python:3.8

# Install dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        unixodbc-dev \
        python3-dev \
        libgssapi-krb5-2 \
        libsasl2-2 \
        libsasl2-modules-gssapi-mit \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
 

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/20.04/prod.list > /etc/apt/sources.list.d/mssql-release.list
RUN apt-get update && ACCEPT_EULA=Y apt-get install -y msodbcsql17

COPY requirements.txt /app/
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . /app/

# Expose port 8000
EXPOSE 8000

# Start Django application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]



