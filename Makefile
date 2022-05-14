NUM_JOBS?=5

all: run-docker

build-docker:
	docker build --no-cache \
	-t dboy/julia-env docker/

run-docker:
	if [ ! -d home ]; then \
		mkdir home; \
	fi; \
	docker run -it -d --rm \
	--name julia-env \
	-v $$(pwd)/home:/root \
	-v $$(pwd):/workspace/project \
	-w /workspace/project \
	dboy/julia-env