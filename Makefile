NAME = sunfoxcz/ipmiview

.PHONY: all build

all: build

build:
	docker build --ulimit "nofile=1024:524288" -t $(NAME):latest --rm -f Dockerfile .
