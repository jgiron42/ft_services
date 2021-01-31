#starting minikube
minikube delete
minikube start --vm-driver=docker

#setting ips from minikube subnet
srcs/switch_ip.sh

eval $(minikube -p minikube docker-env)

# making dashboards from template
cat srcs/grafana/srcs/template_dashboard.json | sed "s/|name|/influxdb/" > srcs/grafana/srcs/dashboards/influxdb_dashboard.json
cat srcs/grafana/srcs/template_dashboard.json | sed "s/|name|/mysql/" > srcs/grafana/srcs/dashboards/mysql_dashboard.json
cat srcs/grafana/srcs/template_dashboard.json | sed "s/|name|/wordpress/" > srcs/grafana/srcs/dashboards/wordpress_dashboard.json
cat srcs/grafana/srcs/template_dashboard.json | sed "s/|name|/phpmyadmin/" > srcs/grafana/srcs/dashboards/phpmyadmin_dashboard.json
cat srcs/grafana/srcs/template_dashboard.json | sed "s/|name|/grafana/" > srcs/grafana/srcs/dashboards/grafana_dashboard.json
cat srcs/grafana/srcs/template_dashboard.json | sed "s/|name|/ftps/" > srcs/grafana/srcs/dashboards/ftps_dashboard.json
cat srcs/grafana/srcs/template_dashboard.json | sed "s/|name|/nginx/" > srcs/grafana/srcs/dashboards/nginx_dashboard.json

#building images
docker build -t ft_wordpress srcs/wordpress/.
docker build -t ft_phpmyadmin srcs/phpmyadmin/.
docker build -t ft_nginx srcs/nginx/.
docker build -t ft_mysql srcs/mysql/.
docker build -t ft_influxdb srcs/influxdb/.
docker build -t ft_grafana srcs/grafana/.
docker build -t ft_ftps srcs/ftps/.
docker build -t ft_wordpress srcs/wordpress/.

#applying configuration
sh srcs/kubernetes-config/setup_metallb.sh
for file in `ls -1 srcs/kubernetes-config/*.yaml`; do
   kubectl apply -f $file
done

#starting dashboard
minikube dashboard &
