#!/bin/bash
echo "Please enter the Date in this format dd/Mon/YYYY Ex:-- 01-Jan-2014"
read d1
echo "Please enter start time Ex: 1 for 1AM and 13 for 1PM"
read start
echo "Please enter end time Ex: 1 for 1AM and 13 for 1PM"
read end 
presdate=$(date -d $d1 "+%d_%m_%Y")
presdate="access_log.$presdate*"
prevdate=$(date -d "$d1 1 day ago" +'%d_%m_%Y')
prevdate="access_log.$prevdate*"
date=$(date -d $d1 '+%d/%h/%Y')
cd /prdws/webprod/wbs13_1/opt/jboss/httpd/httpd/logs
echo -e "                    Access log Details                                     "
echo -e "---- Total Login Attempts  ----"
cat $presdate $prevdate |grep $date |  awk -v s=$start -v e=$end -F':' '$2>=s && $2<e {print}' | grep 'login'|wc -l
echo -e "---- Total Uniq IP Hits for \e[7;31m wbs13_1 \e[0m ----"
cat $presdate $prevdate|grep $date |awk -v s=$start -v e=$end -F':' '$2>=s && $2<e {print}' | awk '{print $1}' | sort | uniq -c|wc -l
echo -e "---- Total 50X errors for \e[7;31m wbs13_1 \e[0m ----"
cat $presdate $prevdate |grep $date | awk -v s=$start -v e=$end -F':' '$2>=s && $2<e {print}' |grep 'HTTP/1.1" 50' |awk '{print $1,$2,$3,$4,$5}'|uniq |wc -l
echo -e "---- Total 40X errors for \e[7;31m wbs13_1 \e[0m ----"
cat $presdate $prevdate |grep $date| awk -v s=$start -v e=$end -F':' '$2>=s && $2<e {print}' |grep 'HTTP/1.1" 40' |awk '{print $1,$2,$3,$4,$5}'|uniq |wc -l


