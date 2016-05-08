CONTAINER=client9/nickg-dev

build:
	docker build -t $(CONTAINER) .

# https://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/
console:
	docker run --rm -it \
		-v ~/.ssh:/root/.ssh \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v $(PWD):/work \
		-w /root \
		$(CONTAINER) sh

clean:
	rm *~
	git gc --aggressive

