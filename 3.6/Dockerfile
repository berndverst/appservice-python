FROM python:3.6
MAINTAINER Azure App Services Container Images <appsvc-images@microsoft.com>

COPY startup /opt/startup
COPY hostingstart.html /home/site/wwwroot/hostingstart.html
COPY sshd_config /etc/ssh/
COPY internal-requirements.txt /opt/startup/internal-requirements.txt

RUN mkdir -p /home/LogFiles \
     && echo "root:Docker!" | chpasswd \
     && apt update \
     && apt install -y --no-install-recommends openssh-server vim curl wget tcptraceroute \
     && cd /opt/startup \
     && pip install --no-cache-dir -r /opt/startup/internal-requirements.txt \
     && chmod 755 /opt/startup/init_container.sh

EXPOSE 2222 5000

ENV PORT 5000
ENV WEBSITE_ROLE_INSTANCE_ID localRoleInstance
ENV WEBSITE_INSTANCE_ID localInstance
ENV PATH ${PATH}:/home/site/wwwroot

WORKDIR /home/site/wwwroot

ENTRYPOINT ["/opt/startup/init_container.sh"]
