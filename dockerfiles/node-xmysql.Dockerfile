FROM node:16

LABEL maintainer="benwk<z@benwk.com>"

ARG LOGIN_METHOD ${LOGIN_METHOD}
ENV LOCAL_PORT 8080

RUN mkdir -p /work
COPY entrypoints/${LOGIN_METHOD}/node-xmysql.sh /work/node-xmysql.sh
COPY kubernetes/mysql-external.yaml /work/mysql-external.yaml
RUN chmod +x /work/node-xmysql.sh
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
RUN az aks install-cli
RUN npm install -g xmysql

EXPOSE ${LOCAL_PORT}

ENTRYPOINT ["/bin/bash","-c","/work/node-xmysql.sh"]