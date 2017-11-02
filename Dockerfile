## Emacs, make this -*- mode: sh; -*-

FROM r-base:latest

MAINTAINER "Joshua N. Pritikin" jpritikin@pobox.com

RUN apt-get update && apt-get install -y --no-install-suggests \
			      git \
			      libcurl4-gnutls-dev \
			      libssl-dev \
			      libxml2-dev

WORKDIR /opt/github.org/

RUN git clone -b master --depth 1 https://github.com/OpenMx/OpenMx.git && \
    cd OpenMx && \
    R --no-save -f util/update-dependencies.R --args ./DESCRIPTION.in && \
    make cran-install && \
    rm -rf /opt/github.org/

CMD ["R"]
