set -e
export SHELLOPTS

echo "Installing base dependencies..."
apk add --no-cache \
  ansible \
  bash \
  binutils \
  ca-certificates \
  coreutils \
  curl \
  docker-cli \
  gettext \
  grep \
  jq \
  make \
  openssl \
  openssh-client \
  openvpn \
  sudo

# modules not needed
#  gcc \
#  g++ \
#  python \
#  py-pip \
#  wget \
#  vim \
#  tmux \
#  unzip \
#  util-linux \
#  libgcc \
#  make \
#  ncurses \
#  findutils \
#  figlet \
#  zip
# pip install virtualenv

echo "TFSwitch"
wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
apk add glibc-2.32-r0.apk
curl -L https://raw.githubusercontent.com/warrensbox/terraform-switcher/release/install.sh | bash

# Kubernetes
echo ">> kubectl"
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl --retry 10 --retry-delay 5 -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
mv kubectl /usr/local/bin/kubectl
chmod +x /usr/local/bin/kubectl

# Helm
echo ">> helm"
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | bash

# MC for S3
echo ">> minio"
wget -O /usr/local/bin/mc https://dl.min.io/client/mc/release/linux-amd64/mc
chmod +x /usr/local/bin/mc

# NVM for Node.JS
# apk add nodejs npm
# npm config delete prefix
# curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.4/install.sh | bash
# source /root/.nvm/nvm.sh
# nvm install 6.9.1 || true
# nvm use --delete-prefix v6.9.1
# npm install -g nodemon
# apk del nodejs

# Yarn
# echo "Yarn"
# apk add yarn
