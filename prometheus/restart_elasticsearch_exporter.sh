#!  /bin/bash
service_name=elasticsearch_exporter

service_ip=`ip r  |grep 'src' |awk '{print $9}'`
service_pid=$(ps aux |grep ${service_name}|grep -v grep |awk '{print $2}')
service_num=`ps aux |grep ${service_name}|grep -v grep |awk '{print $2}'|wc -l`
echo ${service_pid}  ${service_num}
if [ ${service_num} != 0 ] 
then 
    echo "服务已经存在,服务进程号"  ${service_pid}  
    kill ${service_pid}
    [ $? -eq 0 ]   && cd  /usr/local/src/elasticsearch_exporter-1.1.0.linux-amd64
   nohup  ./elasticsearch_exporter --es.uri=http://prometheus:SExCoxFnJ7ddYKMAfvcz@${service_ip}:9200 --web.listen-address=${service_ip}:9114 --es.all --es.cluster_settings --es.indices 
--es.indices_settings --es.shards --es.snapshots   &
else
   echo "服务不存在启动服务"
   cd  /usr/local/src/elasticsearch_exporter-1.1.0.linux-amd64
   nohup  ./elasticsearch_exporter --es.uri=http://prometheus:SExCoxFnJ7ddYKMAfvcz@${service_ip}:9200 --web.listen-address=${service_ip}:9114 --es.all --es.cluster_settings --es.indices 
--es.indices_settings --es.shards --es.snapshots   &
fi
