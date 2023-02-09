# PROJECT_NAME = backstage

#install: yarn install -g
install: yarn install --frozen-lockfile
tsc : yarn tsc
build: yarn build:all
.PHONY: install tsc build


docker-build: @DOCKER_BUILDKIT=1 docker build --tag ${{ secrets.DOCKER_USERNAME }}/backstage:v1.0.2 .
.PHONY: docker-build

docker-push: @docker push ${{ secrets.DOCKER_USERNAME }}/backstage:v1.0.2
.PHONY: docker-push
# # docker-registry:
# 	@printf "727224480698.dkr.ecr.us-east-1.amazonaws.com/$(OMD_SERVICE)/$(OMD_MICROSERVICE)"
# .PHONY: docker-registry

# docker-tag-build:
# 	@printf "$(CONTAINER_IMAGE) -> $(REPO_IMAGE)"
# 	@docker tag $(CONTAINER_IMAGE) $(REPO_IMAGE)
# .PHONY: docker-registry
