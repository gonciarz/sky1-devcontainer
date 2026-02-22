# Sky1 development environment

arm64 docker container that helps to build sky1 artifacts.

## Build docker image and run

```shell
docker run --rm --privileged tonistiigi/binfmt --install all
docker buildx build --platform linux/arm64 -t myimage:arm64 --load .
docker run -v .:/workspace --rm -it --platform linux/arm64 myimage:arm64
```

## Instruction

1. Clone repositories

	```shell
	git clone https://github.com/Sky1-Linux/sky1-firmware
	git clone https://github.com/Sky1-Linux/sky1-linux-build
	git clone https://github.com/Sky1-Linux/sky1-image-build
	git clone https://github.com/Sky1-Linux/linux-sky1
	```

2. Build and install firmware

	```shell
	sky1-firmware> dpkg-buildpackage -us -uc -b
	sky1-firmware> sudo dpkg -i ../sky1-firmware_*.deb
	```

3. Build a kernel

	```shell
	sky1-linux-build> ./scripts/prepare-source.sh 6.18.13
	sky1-linux-build> ./scripts/build-debs.sh 6.18.13 1 sky1
	```



4. Build an image

Currently in order to create an image a container must be run in privileged mode.

	```shell
	docker run -v .:/workspace --rm -it --privileged --platform linux/arm64 myimage:arm64
	```

	```shell
	sky1-image-build> sudo ./scripts/build.sh gnome desktop iso
	sky1-image-build> sudo ./scripts/build.sh kde developer iso latest
	sky1-image-build> sudo ./scripts/build.sh none server image
	```




