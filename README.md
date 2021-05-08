# docker-http

A docker image for [httpie](https://httpie.io)

## Usage with Docker run

Use this Docker image from the command line in the same way you would with [httpie](https://httpie.io).

First build the image:

```sh
docker build -t http .
```

Now use the image to call http with `docker run -it --rm http`:

Run http without arguments:

```sh
docker run -it --rm http
```

Usage:

```sh
docker run -it --rm http --help
```

Version info:

```sh
docker run -it --rm http --version
```

Inspect headers:

```sh
docker run -it --rm http --headers https://horrell.ca
```

## Make it easier with an alias

Add this to your `.bashrc` or `.zshrc` file:

```bash
alias http='docker run -i --rm http'
```

## Using the Docker Hub image

The lateset version of this image is published to the Docker Hub. You can use it like this:

```sh
docker pull chorrell/http:latest

docker run -i --rm chorrell/http:latest
```

And setup an alias like this:

```bash
alias http='docker run -i --rm ghcr.io/chorrell/http:latest'
```

## Using the GitHub Container Registry image

The lateset version of this image is published to the GitHub Container Registry. You can use it like this:

```sh
docker pull ghcr.io/chorrell/http:latest

docker run -i --rm ghcr.io/chorrell/http:latest
```

And setup an alias like this:

```bash
alias http='docker run -i --rm ghcr.io/chorrell/http:latest'
```
