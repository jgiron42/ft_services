if [ $1 ]
then
	docker stop $1; docker rm $1; docker build -t $1 . $2 && docker run -d --name $1 -p 8021:21  -p 8022:22 -p 8990:990 -p 64000-64321:64000-64321 $1
fi
