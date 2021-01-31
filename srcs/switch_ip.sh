#!/bin/bash

NEW_IP="$(minikube ip | cut -d. -f 1,2,3 ).$(expr $(minikube ip | cut -d. -f4) + 1)"
CURRENT_IP=$(cat srcs/ftps/srcs/vsftpd/vsftpd.conf| grep pasv_address | cut -d\= -f2)
echo $NEW_IP
echo $CURRENT_IP
sed "s/$CURRENT_IP/$NEW_IP/g" srcs/ftps/srcs/vsftpd/vsftpd.conf > tmp 
mv tmp srcs/ftps/srcs/vsftpd/vsftpd.conf 
sed "s/$CURRENT_IP/$NEW_IP/g" srcs/kubernetes-config/metallb.yaml > tmp
mv tmp srcs/kubernetes-config/metallb.yaml 
sed "s/$CURRENT_IP/$NEW_IP/g" srcs/mysql/srcs/wordpress_dump.sql > tmp
mv tmp srcs/mysql/srcs/wordpress_dump.sql
echo $NEW_IP > srcs/current_ip
