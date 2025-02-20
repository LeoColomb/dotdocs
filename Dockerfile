FROM ghcr.io/typst/typst:v0.13.0

ENV XDG_DATA_HOME=/opt
ENV TYPST_FONT_PATHS=/opt/typst/assets/fonts

COPY ./packages /opt/typst/packages
COPY ./assets /opt/typst/assets

ENTRYPOINT [ "/bin/typst" ]
