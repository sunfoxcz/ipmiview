NAME = sunfoxcz/ipmiview

.PHONY: all build

all: build

build:
	docker build -t $(NAME):latest --rm -f Dockerfile .
