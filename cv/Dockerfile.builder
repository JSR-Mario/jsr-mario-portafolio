FROM alpine:latest
RUN apk update && apk add --no-cache \
    texlive \
    texlive-latexextra \
    texlive-xetex \
    fontconfig \
    freetype \
    curl \
    unzip && \
    curl -sL https://mirrors.ctan.org/fonts/fontawesome5.zip -o /tmp/fa5.zip && \
    unzip -q /tmp/fa5.zip -d /tmp && \
    mkdir -p /root/texmf/tex/latex/fontawesome5 \
             /root/texmf/fonts/enc/dvips/fontawesome5 \
             /root/texmf/fonts/map/dvips/fontawesome5 \
             /root/texmf/fonts/opentype/public/fontawesome5 \
             /root/texmf/fonts/tfm/public/fontawesome5 \
             /root/texmf/fonts/type1/public/fontawesome5 && \
    cp -r /tmp/fontawesome5/tex/* /root/texmf/tex/latex/fontawesome5/ && \
    cp -r /tmp/fontawesome5/enc/* /root/texmf/fonts/enc/dvips/fontawesome5/ && \
    cp -r /tmp/fontawesome5/map/* /root/texmf/fonts/map/dvips/fontawesome5/ && \
    cp -r /tmp/fontawesome5/opentype/* /root/texmf/fonts/opentype/public/fontawesome5/ && \
    cp -r /tmp/fontawesome5/tfm/* /root/texmf/fonts/tfm/public/fontawesome5/ && \
    cp -r /tmp/fontawesome5/type1/* /root/texmf/fonts/type1/public/fontawesome5/ && \
    rm -rf /tmp/fa5.zip /tmp/fontawesome5 && \
    mktexlsr && \
    updmap-sys --enable Map=fontawesome5.map
WORKDIR /work
