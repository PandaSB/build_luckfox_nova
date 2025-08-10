FROM ubuntu:22.04

# install app dependencies
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC  apt-get install -y git ssh make gcc libssl-dev \
liblz4-tool expect expect-dev g++ patchelf chrpath gawk texinfo chrpath \
diffstat binfmt-support qemu-user-static live-build bison flex fakeroot \
cmake gcc-multilib g++-multilib unzip device-tree-compiler ncurses-dev \
libgucharmap-2-90-dev bzip2 expat gpgv2 cpp-aarch64-linux-gnu libgmp-dev \
libmpc-dev bc python-is-python3 python2 curl repo rsync nano sudo file bsdmainutils \
automake autotools-dev libgpm2 libpython3.10 libsodium23 libtext-charwidth-perl libtext-wrapi18n-perl vim-common vim-runtime xxd gperf
RUN groupadd -g 1000 rk_compiler
RUN useradd -m -u 1000 -g rk_compiler rk_compiler
RUN echo "rk_compiler:rk_compiler" | chpasswd
RUN echo "rk_compiler ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/custom_sudoers && \
    chmod 0440 /etc/sudoers.d/custom_sudoers

RUN rm -f /usr/bin/python && ln -s /usr/bin/python2 /usr/bin/python 
# Switch to the custom user
USER rk_compiler
 
# Set the workdir
WORKDIR /home/rk_compiler
 
# Print the UID and GID
CMD sh -c "echo 'Inside Container:' && echo 'User: $(whoami) UID: $(id -u) GID: $(id -g)'"


