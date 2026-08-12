FROM registry.access.redhat.com/ubi9/nginx-122

USER 0

COPY entrypoint.sh /opt/app-root/src/entrypoint.sh
COPY lib/ /opt/app-root/src/lib/
COPY nginx-health.conf /opt/app-root/etc/nginx.d/health.conf

RUN chmod +x /opt/app-root/src/entrypoint.sh /opt/app-root/src/lib/*.sh && \
    chown -R 1001:0 /opt/app-root/src /opt/app-root/etc/nginx.d && \
    chmod -R g=u /opt/app-root/src /opt/app-root/etc/nginx.d

ENV BG_COLOR="steelblue" \
    MESSAGE="GitOps Demo" \
    APP_VERSION="1.0.0"

EXPOSE 8080

USER 1001

ENTRYPOINT ["/opt/app-root/src/entrypoint.sh"]
