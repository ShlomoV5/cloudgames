FROM ubuntu:latest
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    net-tools \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    netcat \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get  install -y \
    python3 \
    python3-pip \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
RUN pip install --trusted-host pypi.org --trusted-host files.pythonhosted.org --trusted-host pypi.python.org psycopg2-binary

# Create App Directory for scripts to monitor and update database
RUN mkdir /app
COPY app /app/

#CMD ["nc", "-l", "-p", "80"]
