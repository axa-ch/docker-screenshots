FROM node:boron

# Install required dependencies for cairo and phantomjs
RUN apt-get update \
    && apt-get install -y libcairo2-dev libjpeg-dev libpango1.0-dev libgif-dev build-essential g++ chrpath libssl-dev libxft-dev \
    && apt-get install -y libfreetype6 libfreetype6-dev \
    && apt-get install -y libfontconfig1 libfontconfig1-dev

# Download phantomjs - extract - move - create symlink
ADD https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 /var/tmp/
RUN tar xvjf /var/tmp/phantomjs-2.1.1-linux-x86_64.tar.bz2 -C /var/tmp/
RUN mv /var/tmp/phantomjs-2.1.1-linux-x86_64 /usr/local/share
RUN ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin

# Print phantomjs version
RUN phantomjs --version