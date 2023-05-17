FROM quay.io/centos/centos:stream9

RUN --mount=type=cache,target=/var/cache/dnf \
	dnf install -y git openssl openssl-devel libcurl-devel pcre-devel \
	&& dnf group install -y "Development Tools"
#	&& dnf clean all && rm -rf /var/cache/yum

RUN curl -o go.tar.gz https://dl.google.com/go/go1.20.4.linux-amd64.tar.gz && rm -rf /usr/local/go && tar -C /usr/local -xzf go.tar.gz
ENV PATH="$PATH:/usr/local/go/bin"
ADD src/* .

RUN mkdir /publish
VOLUME /publish

CMD [ "/bin/bash", "-c", "./run.sh"]
