#!/bin/sh
####################################
####################################
OUTPUT1="$(/usr/bin/pdweb status | grep tfim | awk '{print $3}')"
        if [ "$OUTPUT1" == "no" ]; then
                ps -ef|grep ivmgr* | grep tfim_webseal |awk '{print $2}'>killprocess.txt
                        while read line; do
                        kill -9 $line
                        done <killprocess.txt
                rm -f killprocess.txt
                /usr/bin/pdweb start tfim_webseal
        echo "Webseal Demo Instance was stopped at  `date`  . Started Webseal Demo..." >> /root/scripts/log/status-check.log
        fi


#############################################
#############################################

OUTPUT2="$(/usr/bin/pdweb status | grep ngp | awk '{print $3}')"
        if [ "$OUTPUT2" == "no" ]; then
                ps -ef|grep ivmgr*| grep ngp_portal | awk '{print $2}'>killprocess.txt
                        while read line; do
                        kill -9 $line
                         done <killprocess.txt
                rm -f killprocess.txt
                /usr/bin/pdweb start ngp_portal
        echo "Webseal UAT Instance was stopped at  `date`  . Started Webseal UAT..." >> /root/scripts/log/status-check.log
        fi

#######################.........EOF.......###################