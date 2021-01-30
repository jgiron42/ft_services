minikube delete
minikube start --vm-driver=docker
srcs/switch_ip.sh
eval $(minikube -p minikube docker-env)
docker build -t ft_wordpress srcs/wordpress/.
docker build -t ft_phpmyadmin srcs/phpmyadmin/.
docker build -t ft_nginx srcs/nginx/.
docker build -t ft_mysql srcs/mysql/.
docker build -t ft_influxdb srcs/influxdb/.
docker build -t ft_grafana srcs/grafana/.
docker build -t ft_ftps srcs/ftps/.
docker build -t ft_wordpress srcs/wordpress/.

sh srcs/kubernetes-config/setup_metallb.sh
for file in `ls -1 srcs/kubernetes-config/*.yaml`; do
   kubectl apply -f $file
done
minikube dashboard &
