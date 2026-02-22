# Sky1 development environment

arm64 docker container that helps to build sky1 artifacts.

## Build docker image and run


	docker run --rm --privileged tonistiigi/binfmt --install all
	docker buildx build --platform linux/arm64 -t myimage:arm64 --load .
	docker run -v .:/workspace --rm -it --platform linux/arm64 myimage:arm64

## Instruction

1. Clone repositories


	git clone https://github.com/Sky1-Linux/sky1-firmware
	git clone https://github.com/Sky1-Linux/sky1-linux-build
	git clone https://github.com/Sky1-Linux/sky1-image-build
	git clone https://github.com/Sky1-Linux/linux-sky1
	git clone https://github.com/Sky1-Linux

2. Build and install firmware


	sky1-firmware> dpkg-buildpackage -us -uc -b
	sky1-firmware> sudo dpkg -i ../sky1-firmware_*.deb

3. Build a kernel


	sky1-linux-build> ./scripts/prepare-source.sh 6.18.9
	sky1-linux-build> ./scripts/build-debs.sh 6.18.9 1 sky1


