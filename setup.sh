
DRIVER="docker"
if [ "$1" = "virtualbox" ]
then
	DRIVER="virtualbox"
fi
printf "Deleting old minikube...                      "
minikube delete > /dev/null 2>&1
echo OK
printf "Starting minikube with driver %-13s   " "$DRIVER..."
minikube start --vm-driver=$DRIVER > /dev/null
echo OK
printf "Setting up ip adresse from minikube subnet... "
srcs/switch_ip.sh
eval $(minikube -p minikube docker-env)

printf "Making dashboards from template...            "
cat srcs/grafana/srcs/template_dashboard.json | sed "s/|name|/influxdb/" > srcs/grafana/srcs/dashboards/influxdb_dashboard.json
cat srcs/grafana/srcs/template_dashboard.json | sed "s/|name|/mysql/" > srcs/grafana/srcs/dashboards/mysql_dashboard.json
cat srcs/grafana/srcs/template_dashboard.json | sed "s/|name|/wordpress/" > srcs/grafana/srcs/dashboards/wordpress_dashboard.json
cat srcs/grafana/srcs/template_dashboard.json | sed "s/|name|/phpmyadmin/" > srcs/grafana/srcs/dashboards/phpmyadmin_dashboard.json
cat srcs/grafana/srcs/template_dashboard.json | sed "s/|name|/grafana/" > srcs/grafana/srcs/dashboards/grafana_dashboard.json
cat srcs/grafana/srcs/template_dashboard.json | sed "s/|name|/ftps/" > srcs/grafana/srcs/dashboards/ftps_dashboard.json
cat srcs/grafana/srcs/template_dashboard.json | sed "s/|name|/nginx/" > srcs/grafana/srcs/dashboards/nginx_dashboard.json
echo OK

echo "\n================Building images================="
printf "Wordpress...                                  "
docker build -t ft_wordpress srcs/wordpress/. > /dev/null
echo OK
printf "phpmyadmin...                                 "
docker build -t ft_phpmyadmin srcs/phpmyadmin/. > /dev/null
echo OK
printf "Nginx...                                      "
docker build -t ft_nginx srcs/nginx/. > /dev/null
echo OK
printf "Mysql...                                      "
docker build -t ft_mysql srcs/mysql/. > /dev/null
echo OK
printf "Influxdb...                                   "
docker build -t ft_influxdb srcs/influxdb/. > /dev/null
echo OK
printf "Grafana...                                    "
docker build -t ft_grafana srcs/grafana/. > /dev/null
echo OK
printf "Ftps...                                       "
docker build -t ft_ftps srcs/ftps/. > /dev/null
echo "OK\n"

printf "Applying configuration...                     "
sh srcs/kubernetes-config/setup_metallb.sh > /dev/null
for file in `ls -1 srcs/kubernetes-config/*.yaml`; do
   kubectl apply -f $file > /dev/null
done
echo OK

printf "Starting dashboard...                         "
minikube dashboard > /dev/null & > /dev/null
echo OK
