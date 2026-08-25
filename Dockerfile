FROM debian AS packages

ENV XDG_DATA_HOME=/opt/dist
ENV TYPST_FONT_PATHS=$XDG_DATA_HOME/typst/assets/fonts

WORKDIR /opt

COPY ./scripts /opt/scripts
COPY ./packages /opt/packages
RUN /opt/scripts/package @local
RUN /opt/scripts/fonts

FROM ghcr.io/typst/typst:0.15.1

ENV XDG_DATA_HOME=/opt
ENV TYPST_FONT_PATHS=$XDG_DATA_HOME/typst/assets/fonts

COPY --from=packages /opt/dist /opt

ENTRYPOINT [ "/bin/typst" ]
