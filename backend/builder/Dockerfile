FROM maven:3-openjdk-11
LABEL maintainer="clap-and-whistle <kimita@clap-and-whistle.page>"
SHELL ["/bin/bash", "-oeux", "pipefail", "-c"]

# ホスト側のユーザIDとシェルログイン時のユーザIDを一致させる (target/配下の生成物等がrootの所有とならないように)
ARG OWNER_USER_ID
ARG OWNER_GROUP_ID

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
  apt-get update && \
  apt-get install -y nodejs && \
  apt-get clean && \
  groupadd -g $OWNER_USER_ID webapp && \
  useradd -u $OWNER_USER_ID -g $OWNER_GROUP_ID webapp && \
  mkdir -p /home/webapp/.m2 && \
  chown -R webapp:webapp /home/webapp && \
  mkdir -p /work/maven && \
  chown -R webapp:webapp /work/maven

WORKDIR /work/maven

ENTRYPOINT [ "/bin/bash", "-c" ]
CMD [ "jshell" ]


