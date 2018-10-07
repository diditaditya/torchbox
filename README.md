## fast torchbox

Basically a cuda9.2-based docker with pytorch set up for fast.ai courses, which i have been running on my pc with gpu, ssh-ed from a laptop.

### quirks

As we all know setting up the gpu to work is still sometimes a painful process.
This is based on cuda9.2 which requires nvdia-driver-396 or higher.
In case other cuda version is desired, please by all means change the Dockerfile as you see fit.
Make sure the driver, nvidia-docker, and nvidia-container-runtime are properly set.
Don't forget to set the driver path as nvidia runtime in docker's daemon.json.

### what you get

Just a container which successfully runs the lesson 1 of the course no problem. lol.
The Makefile is provided to add some convenience,
* make build to build the container
* make run to run the container
* make bash to access the container's bash
* make jupyter to run the jupyter notebook, change localhost with the server's ip

### kaggle

The course uses kaggle datasets here and there, and thankfully kaggle-api is available. Please provide your own kaggle.json api-key. If not, please comment the line where kaggle.json is copied to the container.

### note

This might not work as it is not yet tested to be rebuilt from scratch. lol.

### disclaimer

This is made by noob trying to have some fun, so expect nothing more than that.. ;)
