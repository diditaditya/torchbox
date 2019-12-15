## fast torchbox

Basically a cuda10.1-based docker with pytorch 1.3 set up for fast.ai courses, which i have been running on my pc with gpu, ssh-ed from a laptop.

### install nvidia-driver

pytorch 1.3 is compatible with cuda 10.1, and cuda 10.1 is compatible with nvidia driver version 418.xx

```sh
$ sudo apt install nvidia-driver-418
```

Reboot the pc.

### install nvidia-docker

Follow the instruction [here](https://github.com/NVIDIA/nvidia-docker).


### set nvidia runtime

Set the runtime in `/etc/docker/daemon.json`.

```json
{
    "runtimes": {
        "nvidia": {
            "path": "nvidia-container-runtime",
            "runtimeArgs": []
        }
    }
}
```

### what you get

Just a container which successfully runs the lesson 1 of the course no problem. lol.
The Makefile is provided to add some convenience,
* `make build` to build the container
* `make run` to run the container
* `make bash` to access the container's bash
* `make jupyter` to run the jupyter notebook, change localhost with the server's ip

The `docker-compose.yml` is also provided, and it is meant to be used with `traefik`. So if you want to use the `docker-compose` without `traefik`, just delete the `labels` and the `networks`. With `docker-compose` you can use its command-line interface, such as:
* `docker-compose build` to build the image
* `docker-compose up -d` to run the container
* `docker-compose logs torchbox` to see the logs which you can also find the token

### kaggle

The course uses kaggle datasets here and there, and thankfully kaggle-api is available. Please provide your own kaggle.json api-key and uncomment the line where kaggle.json is copied to the container.

### note

In case other cuda version is desired, please by all means change the Dockerfile as you see fit.
Make sure the `nvidia-driver`, `nvidia-docker`, and `nvidia-container-runtime` are properly set.
Don't forget to set the driver path as nvidia runtime in docker's daemon.json.

This was tested in ubuntu 18.04 with nvidia gtx 1070.

### disclaimer

This is made by noob trying to have some fun, so expect nothing more than that.. ;)
