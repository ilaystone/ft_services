FROM grafana/grafana:latest
MAINTAINER ikhadem<ikhadem@student.1337.ma>

COPY dashboards /var/lib/grafana/dashboards
COPY datasources /etc/grafana/provisioning/datasources
COPY sample.yaml /etc/grafana/provisioning/dashboards

EXPOSE 3000