ARG FEDORA_MAJOR_VERSION=37

FROM quay.io/fedora-ostree-desktops/silverblue:${FEDORA_MAJOR_VERSION}

COPY etc /etc
COPY firstboot /usr/bin

RUN rpm-ostree override remove firefox firefox-langpacks \
  && rpm --import https://packages.microsoft.com/keys/microsoft.asc \
  && rpm-ostree install code fish podman-compose \
  && sed -i 's/#AutomaticUpdatePolicy.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf \
  && systemctl enable rpm-ostreed-automatic.timer \
  && systemctl enable flatpak-automatic.timer \
  && rm -rf \
    /tmp/* \
    /var/* \
  && ostree container commit
