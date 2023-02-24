FROM debian:bookworm-slim
WORKDIR /root


RUN apt-get update && \
    apt-get upgrade --yes && \
    apt-get install --yes --no-install-recommends \
        # sshd
        openssh-server \
        # To manage and restart the sshd process
        supervisor && \
    # Don't persist APT lists to the Docker image layer
    rm -rf /var/lib/apt/lists/* && \
    # Add directory needed by sshd to run
    mkdir /var/run/sshd

COPY ./src /

RUN echo && \
    # Disable the root user
    usermod -s /usr/sbin/nologin root && \
    # Add users so they can SSH into the box
    ./add-users.sh

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
