FROM rakgenius/cloudstack-simulator

COPY . /root/

WORKDIR /root

RUN mvn -DskipTests -P developer,systemvm clean install -pl client,tools/apidoc/,tools/marvin,engine/schema,server,framework/cluster,api,core,engine/components-api

COPY load_start_supervisor.sh /root/load_start_supervisor.sh

RUN chmod +x /root/load_start_supervisor.sh

CMD "/root/load_start_supervisor.sh"
