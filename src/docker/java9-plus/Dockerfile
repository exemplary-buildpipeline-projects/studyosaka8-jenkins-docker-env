#
# Oracle Java 9 (+ common tools) environment
#
# Base image by https://github.com/cogniteev/docker-oracle-java/blob/master/oracle-java9/Dockerfile
#

FROM cogniteev/oracle-java:java9

RUN \
  apt-get update && \
  apt-get install -y git && \
  rm -rf /var/lib/apt/lists/*

# Define default command.
CMD ["bash"]
