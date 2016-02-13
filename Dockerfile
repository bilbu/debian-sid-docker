FROM debian:sid

MAINTAINER Ivan Torres Fally <ivantf@gmail.com>

RUN apt-get update && \
    apt-get -y install \
        file \
        less \
        locate \
        manpages \
        # kill
        procps \
        vim

RUN apt-get clean && \
    apt-get remove && \
    apt-get autoremove

RUN rm -rf \
        /var/cache/apt/* \
        /var/lib/apt/lists/* \
        /var/lib/dpkg/info \
        /tmp/* \
        /var/tmp/* \
        # less is more
        /bin/more

RUN find / -path "*doc*/*" -delete
RUN find / -type d -iname "*doc*" -delete

CMD ["bash"]
