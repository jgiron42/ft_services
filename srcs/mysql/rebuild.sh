if [ $1 ]
then
	docker stop $1; docker rm $1; docker build -t $1 . $2 && docker run -d -p 3306:3306 --name $1 $1
fi
