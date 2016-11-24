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

ADD run_usercommand.sh /tmp/

USER user
CMD ["/tmp/run_usercommand.sh"]
