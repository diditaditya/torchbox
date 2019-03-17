build:
	docker build -t torchbox .

run:
	docker run --runtime=nvidia -p 8080:8080 -v $(PWD)/nb:/torchbox/nb  -i -d --shm-size 8G --name "torchbox" torchbox

start:
	docker start torchbox

bash:
	docker exec -it torchbox bash

jupyter:
	docker exec -it torchbox bash -c "jupyter notebook --ip=0.0.0.0 --port=8080 --allow-root --no-browser"

stop:
	docker stop torchbox
