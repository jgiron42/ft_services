if [ $1 ]
then
	docker stop $1; docker rm $1; docker build -t $1 . $2 && docker run -d --name $1 --network host -p 8080:80 -p 443:443 -p 8022:22 $1
fi
