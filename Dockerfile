FROM ubuntu:trusty
MAINTAINER Alex Johnson <ajohnson@micropact.com>

RUN apt-get update && \
    apt-get install -y ruby ruby-dev build-essential sqlite3 libsqlite3-dev

RUN gem install mailcatcher --no-ri --no-rdoc

RUN apt-get remove -y libsqlite3-dev ruby-dev build-essential && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 1025
EXPOSE 1080
CMD ["mailcatcher", "--smtp-port=25", "-f", "--ip=0.0.0.0"]