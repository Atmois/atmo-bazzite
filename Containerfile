# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

# Base Image - KDE variant
FROM ghcr.io/ublue-os/bazzite-dx-nvidia:stable@sha256:56cfb7bfad7c3f2c48ff3310ff7f4c68d7fe6ea56f56b6dd5a8016f6be6f1dd8

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh && \
    ostree container commit

RUN bootc container lint
