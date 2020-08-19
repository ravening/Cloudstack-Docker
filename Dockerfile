FROM rakgenius/cloudstack

WORKDIR /root

COPY load_start_supervisor.sh /root/load_start_supervisor.sh

RUN chmod +x /root/load_start_supervisor.sh

CMD "/root/load_start_supervisor.sh"
