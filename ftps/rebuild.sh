if [ $1 ]
then
	docker stop $1; docker rm $1; docker build -t $1 . $2 && docker run -d --name $1 -p 8021:21 $1
fi
