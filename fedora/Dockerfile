FROM fedora:25
MAINTAINER Gerard Braad <me@gbraad.nl>

# Use a script to configure the container. This way we can
# split up the operations and do it all in a single layer.
ADD run_container.sh /tmp/
RUN /tmp/run_container.sh

# RUN mkdir -p /workspace # created in run_container.sh
VOLUME /workspace
WORKDIR /workspace

EXPOSE 8181

ENV USERNAME ""
ENV PASSWORD ""
ENV HOME "/home/user/"

# RUN echo "userme" | passwd user --stdin
# RUN echo "rootme" | passwd root --stdin

ADD passwd_template /tmp/
ADD run_usercommand.sh /tmp/

USER 1000
CMD ["/tmp/run_usercommand.sh"]
