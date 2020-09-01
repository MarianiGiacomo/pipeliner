A shell script that builds a docker container from a git repository and pushed it to Docker Hub.

Run the scriot with the `-r`, `-a` and `-u` flags:  
- [ -h ] Display this help guide 
- [ -r ] The repository to build
- [ -a ] The app name, will be used to tag the image
- [ -u ] The Docker Hub username"


## Run in a container
Once you have build the container run it with:

`docker run -v /var/run/docker.sock:/var/run/docker.sock -it builder -r https://github.com/docker-hy/docker-hy.github.io.git -a test -u jamomani`
