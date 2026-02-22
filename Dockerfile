FROM debian:sid

ARG UID=1000
ARG GID=1000

RUN groupadd -g $GID dev \
 && useradd -m -u $UID -g $GID dev

RUN apt update && apt install -y \
	build-essential \
	live-build \
	bc \
	bison \
	flex \
	libelf-dev \
	libssl-dev \
    	debhelper \
	dh-exec \
	rsync \
	cpio \
	kmod \
	libdw-dev:native \
	python3:native \
	git \
	vim \
	sudo \
	mc
#	&& rm -rf /var/lib/apt/lists/*

RUN usermod -aG sudo dev \
 && echo "dev ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/dev \
 && chmod 0440 /etc/sudoers.d/dev

USER dev

WORKDIR /workspace

CMD ["bash"]

