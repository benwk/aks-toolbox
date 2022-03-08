FROM mcr.microsoft.com/azure-cli

LABEL maintainer="benwk<z@benwk.com>"

ARG LOGIN_METHOD ${LOGIN_METHOD}
ENV LOCAL_PORT 8080

RUN mkdir -p /work
COPY entrypoints/${LOGIN_METHOD}/port-forward.sh /work/port-forward.sh
RUN chmod +x /work/port-forward.sh
RUN az aks install-cli

EXPOSE ${LOCAL_PORT}

ENTRYPOINT ["/bin/bash","-c","/work/port-forward.sh"]