all: run-docker

build-docker:
	docker build --no-cache -t dboy/julia-env .

run-docker:
	docker run -it -d --rm \
	--name julia-env \
	-v $$(pwd)/home:/root \
	-w /workspace \
	dboy/julia-env