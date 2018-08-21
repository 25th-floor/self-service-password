include .stub/*.mk

# Define variables, export them and include them usage-documentation
$(eval $(call defw,NS,25thfloor))
$(eval $(call defw,REPO,ltb-self-service-password))
$(eval $(call defw,VERSION,latest))
$(eval $(call defw,NAME,$(REPO)))

# -----------------------------------------------------------------------------
# Build and ship
# -----------------------------------------------------------------------------
.PHONY: build
build:: ##@Docker Build an image
	@echo "$(TURQUOISE)Building image for application"
	@echo "--------------------------------------------------------------------------------$(RESET)"
	docker build \
		-t $(NS)/$(REPO):$(VERSION) \
		--pull \
		.

.PHONY: ship
ship:: ##@Docker Ship the image
	docker push $(NS)/$(REPO):$(VERSION)

.PHONY: release
release:: ##@Docker Build and Ship
release:: build ship


# -----------------------------------------------------------------------------
# Local runtime
# -----------------------------------------------------------------------------
.PHONY: run
run:: ##@Docker Run a container locally
	docker run \
		--name $(NAME) \
		--rm \
		-p 8080:80 \
		$(NS)/$(REPO):$(VERSION)
