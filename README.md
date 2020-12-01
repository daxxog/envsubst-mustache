envsubst-mustache
=================
GNU envsubst-like tool with a [mustache templating](https://mustache.github.io/) system.


### Simple Example
```
envsubst-mustache < etc/template-example.txt
```

### Advanced Example In Dockerfile
This replaces envsubst in a debian-based docker image with envsubst-mustace (e.g. in nginx)
```
# upgrade debian packages
ENV DEBIAN_FRONTEND="noninteractive"
RUN apt-get update
RUN apt-get install apt-utils -y
RUN apt-get upgrade -y

# install pyenv
RUN apt-get install -y build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
RUN curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/dd3f7d0914c5b4a416ca71ffabdf2954f2021596/bin/pyenv-installer | bash
ENV PYENV_VIRTUALENV_INIT=1
ENV PYENV_SHELL=sh
ENV PATH=/root/.pyenv/plugins/pyenv-virtualenv/shims:/root/.pyenv/shims:/root/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# install and use python 3.9.0
RUN pyenv install 3.9.0 -s
RUN pyenv global 3.9.0

# upgrade pip
RUN python3 -m pip install --upgrade pip setuptools wheel

# install envsubst-mustache
RUN pip install --user envsubst-mustache
RUN curl -L https://raw.githubusercontent.com/daxxog/envsubst-mustache/master/scripts/replace-envsubst-debian-docker.sh | bash
```
