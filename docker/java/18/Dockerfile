FROM        --platform=$TARGETOS/$TARGETARCH eclipse-temurin:18-jdk-jammy

# Add Author Notice.
LABEL       author="Jan Heil" maintainer="jan.heil@byte-store.de" java-version="18"

# Update System Packages and install required Packages.
RUN 		apt-get update -y \
 			&& apt-get install -y curl ca-certificates libfreetype6 openssl git tar lsof fontconfig tzdata iproute2 libstdc++6 sqlite3 \
 			&& useradd -d /home/process -m process

# Use Process as Default User.
USER        process

# Define Enviroment for User.
ENV         USER=process HOME=/home/process

# Define Workdir.
WORKDIR     /home/process

# Define Default Volume.
VOLUME /home/process

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]