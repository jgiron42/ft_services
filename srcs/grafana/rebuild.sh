if [ $1 ]
then
	docker kill $1; docker rm $1; docker build -t $1 . $2 && docker run -d -p 3000:3000 --name $1 $1
fi
