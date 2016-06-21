FROM fedora:23
MAINTAINER Gerard Braad <me@gbraad.nl>

# Use a script to configure the container. This way we can
# split up the operations and do it all in a single layer.
ADD run_container.sh /tmp/
RUN /tmp/run_container.sh

RUN mkdir /workspace
VOLUME /workspace

EXPOSE 8181

ADD run_usercommand.sh /tmp/
CMD ["/tmp/run_usercommand.sh"]