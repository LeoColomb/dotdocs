FROM pandoc/latex:latest

RUN tlmgr update --self \
 && tlmgr install numprint \
                  moreverb \
                  lastpage \
                  footmisc \
                  spreadtab \
                  xstring \
                  titlesec \
                  arydshln \
                  enumitem \
                  xltxtra

COPY ./src /opt
COPY ./assets /opt/assets
