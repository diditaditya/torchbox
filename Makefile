build:
	docker build -t torchbox .

build-no-cache:
	docker build --no-cache -t torchbox .

run:
	docker run --runtime=nvidia -p 8888:8888 -v $(PWD)/nb:/torchbox/nb  -v $(PWD)/data:/torchbox/data -i -d --shm-size 8G --name "torchbox" torchbox

start:
	docker start torchbox

bash:
	docker exec -it torchbox bash

jupyter:
	docker exec -it torchbox bash -c "jupyter notebook --ip=0.0.0.0 --allow-root --no-browser"

password: 
	docker exec -it torchbox jupyter notebook password

jupyter-bg:
	docker exec -dit torchbox bash -c "jupyter notebook --ip=0.0.0.0 --allow-root --no-browser"

stop:
	docker stop torchbox

down: stop
	docker rm torchbox
