#!/bin/bash

/bin/bash /root/sh/mu01/restart_mu01_k8s_gateway_log.sh &> /root/sh/mu01/gateway_nohup.txt
sleep 2

/bin/bash /root/sh/mu01/restart_mu01_k8s_iauth_log.sh &> /root/sh/mu01/iauth_nohup.txt
sleep 2

/bin/bash /root/sh/mu01/restart_mu01_k8s_ibase_log.sh &> /root/sh/mu01/ibase_nohup.txt
sleep 2

/bin/bash /root/sh/mu01/restart_mu01_k8s_iresource_log.sh &> /root/sh/mu01/iresource_nohup.txt
sleep 2

/bin/bash /root/sh/mu01/restart_mu01_k8s_ivision_log.sh &> /root/sh/mu01/ivision_nohup.txt