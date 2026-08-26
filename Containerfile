# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

# Base Image - KDE variant
FROM ghcr.io/ublue-os/bazzite-dx-nvidia:stable@sha256:00c9b71ba3742893962a7cad89c435c0e376354fe820759b9b8e220d6e418ea2

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build.sh && \
    ostree container commit

RUN bootc container lint
