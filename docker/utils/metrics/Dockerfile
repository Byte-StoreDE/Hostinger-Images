FROM debian:latest

MAINTAINER Jan Heil (www.byte-store.de)
ENV DEBIAN_FRONTEND=noninteractive

# Add Author Notice.
LABEL author="Jan Heil" maintainer="jan.heil@byte-store.de"


# Update repo cache.
RUN /bin/sh -c apt-get update

# Install python.
RUN /bin/sh -c apt-get -y -q install     python     python-dev     python-distribute     python-pip

# Clean System.
RUN /bin/sh -c apt-get clean

# Remove Lists.
RUN /bin/sh -c rm -rf /var/lib/apt/lists/* # buildkit

RUN pip install pyCLI==2.0.3 psutil==4.2.0 requests==2.10.0 python-json-logger==0.1.5

# Copy Script.
COPY ./host-stats-logger.py /host-stats-logger.py

ENTRYPOINT ["python -u /host-stats-logger.py"]

# Default Log Loop every 1 Second.
CMD ["-f", "1", "-cmdn"]