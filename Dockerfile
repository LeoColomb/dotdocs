FROM debian AS packages

ENV XDG_DATA_HOME=/opt/dist

COPY ./scripts /opt/scripts
COPY ./packages /opt/packages
RUN scripts/package @local

FROM ghcr.io/typst/typst:0.15.1

ENV XDG_DATA_HOME=/opt
ENV TYPST_FONT_PATHS=/opt/typst/assets/fonts

COPY --from=packages /opt/dist /opt
COPY ./assets /opt/typst/assets

ENTRYPOINT [ "/bin/typst" ]
