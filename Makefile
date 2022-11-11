VENDORNAME=returnnull
PROJECTNAME=hellogba
CONTAINERNAME=dkp_compiler
USER=$(shell whoami)
UID=$(shell id -u $(USER))

# build the docker image
.PHONY: build_image
build_image: clean_docker
	DOCKER_BUILDKIT=1 docker build -f docker/Dockerfile . \
	-t $(VENDORNAME)/$(PROJECTNAME)/$(CONTAINERNAME):dev --build-arg uid=$(UID) --build-arg user=$(USER)

# deletes the docker images
.PHONY: clean_docker
clean_docker:
	docker image rm -f $(VENDORNAME)/$(PROJECTNAME)/$(CONTAINERNAME):dev


# compile the .gba file and run in in your emulator
.PHONY: run
run: compile
	mgba-qt -4 $$(pwd)/out/game.gba

# compiles the code into a .gba files, found in the /out folder
.PHONY: compile
compile: clean_out clean_sound
	docker run \
		-v $$(pwd)/code:/${USER} \
		-v $$(pwd)/out:/out \
		$(VENDORNAME)/$(PROJECTNAME)/$(CONTAINERNAME):dev
