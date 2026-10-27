# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

# Base Image - KDE variant
FROM ghcr.io/ublue-os/bazzite-dx-nvidia:latest@sha256:a2463b511b43525f3a7e11768f91ce94e99aa25acd1213043a7981dbcd3898a3

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh && \
    ostree container commit

RUN bootc container lint
