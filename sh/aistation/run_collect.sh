/bin/bash

nohup /bin/bash /root/sh/mu01/collect_docker_service_log.sh &
sleep2
nohup /bin/bash /root/sh/mu01/collect_kubelet_service_log.sh &
sleep2
nohup /bin/bash /root/sh/mu01/collect_mu01_k8s_gateway_log.sh &
sleep2
nohup /bin/bash /root/sh/mu01/collect_mu01_k8s_iauth_log.sh &
sleep2
nohup /bin/bash /root/sh/mu01/collect_mu01_k8s_ibase_log.sh &
sleep2
nohup /bin/bash /root/sh/mu01/collect_mu01_k8s_iresource_log.sh &
sleep2
nohup /bin/bash /root/sh/mu01/collect_mu01_k8s_ivision_log.sh &