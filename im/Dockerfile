FROM bestwu/wine:amd64

ADD im/deepin.com.qq.im_9.1.8deepin0_i386.deb /
ADD im/sources.list /etc/apt/sources.list
ADD im/winetricks /usr/bin/winetricks
# ADD im/wine_gecko-2.47-x86.msi /


RUN apt-get update && \
    apt-get install -y --no-install-recommends procps firefox-esr cabextract wget vim


RUN dpkg -i deepin.com.qq.im_9.1.8deepin0_i386.deb && \
    rm deepin.com.qq.im_9.1.8deepin0_i386.deb

RUN apt-get -y autoremove --purge && apt-get autoclean -y && apt-get clean -y && \
    find /var/lib/apt/lists -type f -delete && \
    find /var/cache -type f -delete && \
    find /var/log -type f -delete && \
    find /usr/share/doc -type f -delete && \
    find /usr/share/man -type f -delete
#    dpkg -i deepin.com.qq.im_9.1.8deepin0_i386.deb && \
#    rm deepin.com.qq.im_9.1.8deepin0_i386.deb && \

# RUN WINEPREFIX=/home/qq/.deepinwine/Deepin-QQ/ WINE=/home/qq/.deepinwine/deepin-wine5/bin/wine WINESERVER=/usr/lib/i386-linux-gnu/deepin-wine/wineserver deepin-wine msiexec /i wine_gecko-2.47-x86.msi

# WINEPREFIX=/home/qq/.deepinwine/Deepin-QQ/ WINE=/home/qq/.deepinwine/deepin-wine5/bin/wine WINESERVER=/home/qq/.deepinwine/deepin-wine5/bin/wineserver winetricks riched20 riched30 ie6 vcrun6 vcrun2005sp1 gdiplus cjkfonts corefonts

# WINEPREFIX=/home/qq/.deepinwine/Deepin-QQ/ WINE=`which deepin-wine` WINESERVER=/usr/lib/i386-linux-gnu/deepin-wine/wineserver winetricks

# ADD im/wine_gecko-2.47-x86_64.msi /
ENV APP=QQ \
    AUDIO_GID=63 \
    VIDEO_GID=39 \
    GID=1000 \
    UID=1000

RUN groupadd -o -g $GID qq && \
    groupmod -o -g $AUDIO_GID audio && \
    groupmod -o -g $VIDEO_GID video && \
    useradd -d "/home/qq" -m -o -u $UID -g qq -G audio,video qq && \
    mkdir /TencentFiles && \
    chown -R qq:qq /TencentFiles && \
    ln -s "/TencentFiles" "/home/qq/Tencent Files" && \
    sed -i 's/QQ.exe" &/QQ.exe"/g' "/opt/deepinwine/tools/run.sh"

VOLUME ["/TencentFiles"]

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
