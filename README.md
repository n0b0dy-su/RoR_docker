# RoR: dev environment with container

[`n0b0dy-su`](https://github.com/n0b0dy-su)

## Before use

The [app folder](./app) is the directory linked in the volume of the container and the **WORKDIR**, in the deafult setting (my settings), the [Dockerfile](./Dockerfile) exposes port 3000 for Ruby server, with the build yarn and node are installed also the gems bundle and rails.

This conatiner are based on official [Ruby image](https://hub.docker.com/_/ruby) and use the last release (default settings).

 **NOTE:** If you change the conatiner name in [docker-compose file](./docker-compose.yml) change **ror_dev** int the Run command for the new container name.





## Build and Run

Build the container with the follow command

```bash
sudo docker-compose build
```

Run the container with the follow command

```bash
sudo docker-compose run --rm --service-ports ror_dev
```



> ### Dockerfile
>
> [file](./Dockerfile)
>
> ```dockerfile
> FROM ruby
> 
> WORKDIR /home/app
> 
> ENV PORT 3000
> 
> EXPOSE $PORT
> 
> RUN gem install bundler
> RUN gem install rails
> RUN apt-get update -qq && apt-get install -y nodejs
> RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
> RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
> RUN apt-get update && apt-get install -y yarn
> RUN apt-get update && apt-get install -y --no-install-recommends yarn
> 
> ENTRYPOINT ["/bin/bash"]
> ```
>
> ### docker-compose
>
> [file](./docker-compose.yml)
>
> ```yaml
> version: "3.7"
> services:
>   ror_dev:
>     build: .
>     container_name: ror_dev
>     ports:
>       - "3000:3000"
>     volumes:
>       - ./app:/home/app
> ```
>
> 

