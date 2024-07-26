FROM ghcr.io/typst/typst:v0.11.1

COPY ./packages /opt/typst/packages
COPY ./assets /opt/typst/assets
