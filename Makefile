REPO ?= hasankhan
IMG   = $(REPO)/sql-cli
SRC   = $(wildcard lib/*.js) $(wildcard lib/commands/*.js) $(wildcard bin/*) $(wildcard external/*.js)

image: .image
.image: Dockerfile $(SRC)
	@docker build -t $(IMG) .
	@touch $@

push: .image
	@docker push $(IMG)

clean:
	@rm -rf .image

.PHONY: clean image push
