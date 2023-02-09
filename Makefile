# PROJECT_NAME = backstage
test:
	yarn install -g
	yarn install --frozen-lockfile
	yarn tsc
	yarn build:backend
#$(shell yarn install --frozen-lockfile & yarn tsc & yarn build:backend)
# build: $(shell yarn install --frozen-lockfile & yarn tsc & yarn build:backend)
# .PHONY: install build

docker-build:
	@DOCKER_BUILDKIT=1 docker build --tag kartikeyagarg/backstage:v1.0.2 .
.PHONY:	docker-build

# docker-push: @docker push ${{ secrets.DOCKER_USERNAME }}/backstage:v1.0.2
# .PHONY: docker-push
# # docker-registry:
# 	@printf "727224480698.dkr.ecr.us-east-1.amazonaws.com/$(OMD_SERVICE)/$(OMD_MICROSERVICE)"
# .PHONY: docker-registry

# docker-tag-build:
# 	@printf "$(CONTAINER_IMAGE) -> $(REPO_IMAGE)"
# 	@docker tag $(CONTAINER_IMAGE) $(REPO_IMAGE)
# .PHONY: docker-registry
