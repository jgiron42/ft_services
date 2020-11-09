if [ $1 ]
then
	docker kill $1; docker rm $1; docker build -t $1 . $2 && docker run -d -p 8080:80 -p 443:443 --name $1 $1
fi
