FROM rakgenius/cloudstack-simulator

COPY . /root/

WORKDIR /root

RUN mvn -Pdeveloper -Dsimulator -DskipTests install -pl client,tools/apidoc/,tools/marvin,engine/schema,engine/api,engine/components-api,engine/orchestration,server,framework/cluster,framework/db,api,core,

COPY load_start_supervisor.sh /root/load_start_supervisor.sh

RUN chmod +x /root/load_start_supervisor.sh

CMD "/root/load_start_supervisor.sh"
