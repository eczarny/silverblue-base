# silverblue-base

[![build-silverblue-base](https://github.com/eczarny/silverblue-base/actions/workflows/build.yml/badge.svg)](https://github.com/eczarny/silverblue-base/actions/workflows/build.yml)

A personalized [OSTree native container](https://fedoraproject.org/wiki/Changes/OstreeNativeContainerStable) image for use with [Fedora Silverblue](https://silverblue.fedoraproject.org/).

This image is based entirely on the [uBlue](https://ublue.it/) main image found [here](https://github.com/ublue-os/main). If you want to learn a bit more check out [this article](https://www.ypsidanger.com/building-your-own-fedora-silverblue-image/) from the uBlue author.

## Usage

> **Warning:** _This is an experimental feature and should not be used in production (yet), however it's pretty close) Depending on the version of rpm-ostree on your system you might need to pass an additional `--experimental` flag_

To rebase an existing Silverblue installation to the latest release (37):

    sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/eczarny/silverblue-base:37

The `latest` tag will automatically point to the latest build. Note that when a new version of Fedora is released that the `latest` tag will get updated to that latest release automatically.

## Verification

These images are signed with Sigstore's [Cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading `cosign.pub` and running the following command:

    cosign verify --key cosign.pub ghcr.io/eczarny/silverblue-base
