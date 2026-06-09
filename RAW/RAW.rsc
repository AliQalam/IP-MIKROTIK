/ip firewall raw
add action=add-dst-to-address-list address-list=Games address-list-timeout=\
    none-dynamic chain=prerouting comment=Super-Cell-Games disabled=yes \
    dst-address-list=!NON-LIST dst-address-type=!local dst-port=9330-9340 \
    in-interface=all-ppp protocol=tcp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=\
    none-dynamic chain=prerouting disabled=yes dst-address-list=!NON-LIST \
    dst-address-type=!local dst-port=9330-9340 in-interface=all-ppp protocol=\
    udp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting content=.appsflyersdk. disabled=yes dst-address-list=\
    !NON-LIST dst-address-type=!local in-interface=all-ppp src-address-list=\
    "LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting content=.haydaygame. disabled=yes dst-address-list=\
    !NON-LIST dst-address-type=!local in-interface=all-ppp src-address-list=\
    "LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting content=.supercell. disabled=yes dst-address-list=\
    !NON-LIST dst-address-type=!local in-interface=all-ppp src-address-list=\
    "LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting content=.clashroyaleapp. disabled=yes dst-address-list=\
    !NON-LIST dst-address-type=!local in-interface=all-ppp src-address-list=\
    "LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting content=.clashofclans. disabled=yes dst-address-list=\
    !NON-LIST dst-address-type=!local in-interface=all-ppp src-address-list=\
    "LOCAL IP"
add action=add-dst-to-address-list address-list=PUBG address-list-timeout=\
    none-static chain=prerouting comment=Pubg disabled=yes dst-address-list=\
    !NON-LIST dst-address-type=!local dst-port=\
    10000-10099,17500-17599,25000-25099,8700 in-interface=all-ppp protocol=\
    udp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=PUBG address-list-timeout=\
    none-static chain=prerouting comment=Pubg disabled=yes dst-address-list=\
    !NON-LIST dst-address-type=!local dst-port=\
    7086-7995,10309,11455,12070-12460,13894,13972,41182-41192 in-interface=\
    all-ppp protocol=udp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=PUBG address-list-timeout=\
    none-static chain=prerouting comment=Pubg disabled=yes dst-address-list=\
    !NON-LIST dst-address-type=!local dst-port=\
    8030,50872,17000,17500,15669,8700,20000,10544 in-interface=all-ppp \
    protocol=udp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=PUBG address-list-timeout=\
    none-static chain=prerouting comment=Pubg disabled=yes dst-address-list=\
    !NON-LIST dst-address-type=!local dst-port="10010,10013,10039,10096,10491,\
    10612,11455,12235,13748,13894,13972,20000,20002" in-interface=all-ppp \
    protocol=udp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=PUBG address-list-timeout=\
    none-static chain=prerouting comment=Pubg disabled=yes dst-address-list=\
    !NON-LIST dst-address-type=!local dst-port=10000-10099,17500-17599,7002 \
    in-interface=all-ppp protocol=udp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=PUBG address-list-timeout=\
    none-static chain=prerouting comment=Pubg disabled=yes dst-address-list=\
    !NON-LIST dst-address-type=!local dst-port="8011,9030,10010-10650,11000-14\
    000,17000,20000,20001,20002,8030,17500,11139" in-interface=all-ppp \
    protocol=udp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=PUBG address-list-timeout=\
    none-static chain=prerouting comment=Pubg disabled=yes dst-address-list=\
    !NON-LIST dst-address-type=!local dst-port=7889,10012,17500,18081 \
    in-interface=all-ppp protocol=udp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=PUBG address-list-timeout=\
    none-static chain=prerouting comment=Pubg disabled=yes dst-address-list=\
    !NON-LIST dst-address-type=!local dst-port=9015,9026,9003,8443 \
    in-interface=all-ppp protocol=tcp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=PUBG address-list-timeout=\
    none-static chain=prerouting comment=Pubg disabled=yes dst-address-list=\
    !NON-LIST dst-address-type=!local dst-port=10012,17500 in-interface=\
    all-ppp protocol=tcp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting comment=GAMES disabled=yes dst-address-list=!NON-LIST \
    dst-address-type=!local dst-port=27015-27030 in-interface=all-ppp \
    protocol=tcp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting disabled=yes dst-address-list=!NON-LIST \
    dst-address-type=!local dst-port=25000-25099 in-interface=all-ppp \
    protocol=tcp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting disabled=yes dst-address-list=!NON-LIST \
    dst-address-type=!local dst-port=25000-25099 in-interface=all-ppp \
    protocol=tcp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting disabled=yes dst-address-list=!NON-LIST \
    dst-address-type=!local dst-port=17500-17599 in-interface=all-ppp \
    protocol=tcp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting disabled=yes dst-address-list=!NON-LIST \
    dst-address-type=!local dst-port=17500-17599 in-interface=all-ppp \
    protocol=udp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting disabled=yes dst-address-list=!NON-LIST \
    dst-address-type=!local dst-port=15000-15099 in-interface=all-ppp \
    protocol=udp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting disabled=yes dst-address-list=!NON-LIST \
    dst-address-type=!local dst-port=18081,15692,20371 in-interface=all-ppp \
    protocol=tcp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting disabled=yes dst-address-list=!NON-LIST \
    dst-address-type=!local dst-port=10000-10099 in-interface=all-ppp \
    protocol=udp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting disabled=yes dst-address-list=!NON-LIST \
    dst-address-type=!local dst-port=4380,27000-27031,27036,10891,20000-20002 \
    in-interface=all-ppp protocol=udp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting disabled=yes dst-address-list=!NON-LIST \
    dst-address-type=!local dst-port=27036-27037 in-interface=all-ppp \
    protocol=tcp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting comment=CLASH disabled=yes dst-address-list=!NON-LIST \
    dst-address-type=!local dst-port=9330-9340 in-interface=all-ppp protocol=\
    tcp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting disabled=yes dst-address-list=!NON-LIST \
    dst-address-type=!local dst-port=9330-9340 in-interface=all-ppp protocol=\
    udp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting comment="Call of Duty" disabled=yes dst-address-list=\
    !NON-LIST dst-address-type=!local dst-port=16300-16350 in-interface=\
    all-ppp protocol=tcp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting disabled=yes dst-address-list=!NON-LIST \
    dst-address-type=!local dst-port=3013,18082,65010,65050 in-interface=\
    all-ppp protocol=udp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting comment=cloudfront content=.cloudfront. disabled=yes \
    dst-address-list=!NON-LIST dst-address-type=!local in-interface=all-ppp \
    src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting comment=Ludo content=.yallaludo. disabled=yes \
    dst-address-list=!NON-LIST dst-address-type=!local in-interface=all-ppp \
    src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting content=.ludoking. disabled=yes dst-address-list=\
    !NON-LIST dst-address-type=!local in-interface=all-ppp src-address-list=\
    "LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting content=.yallaludo. disabled=yes dst-address-list=\
    !NON-LIST dst-address-type=!local in-interface=all-ppp src-address-list=\
    "LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting content=.ludogame. disabled=yes dst-address-list=\
    !NON-LIST dst-address-type=!local in-interface=all-ppp src-address-list=\
    "LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting comment=.fastly. content=.fastly. disabled=yes \
    dst-address-list=!NON-LIST dst-address-type=!local in-interface=all-ppp \
    src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting comment=FIFA-MOBILE disabled=yes dst-address-list=\
    !NON-LIST dst-address-type=!local dst-port=7770-7790 in-interface=all-ppp \
    protocol=tcp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Games address-list-timeout=3d \
    chain=prerouting disabled=yes dst-address-list=!NON-LIST \
    dst-address-type=!local dst-port=7500-7650 in-interface=all-ppp protocol=\
    udp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Akamai-CDN \
    address-list-timeout=none-static chain=prerouting comment=Akamai content=\
    .akamai. dst-address-list=!NON-LIST dst-address-type=!local in-interface=\
    all-ppp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Akamai-CDN \
    address-list-timeout=none-static chain=prerouting content=akamaized. \
    dst-address-list=!NON-LIST dst-address-type=!local in-interface=all-ppp \
    src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Akamai-CDN \
    address-list-timeout=none-static chain=prerouting content=\
    .akamaitechnologies. dst-address-list=!NON-LIST dst-address-type=!local \
    in-interface=all-ppp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Akamai-CDN \
    address-list-timeout=none-static chain=prerouting comment=CDN77 content=\
    .cdn77. dst-address-list=!NON-LIST dst-address-type=!local in-interface=\
    all-ppp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Akamai-CDN \
    address-list-timeout=none-static chain=prerouting comment=CDN content=\
    .cloudfront. dst-address-list=!NON-LIST dst-address-type=!local \
    in-interface=all-ppp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Akamai-CDN \
    address-list-timeout=none-static chain=prerouting content=.fastly. \
    dst-address-list=!NON-LIST dst-address-type=!local in-interface=all-ppp \
    src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=TikTok address-list-timeout=\
    none-static chain=prerouting comment=TikTok content=.tiktok. \
    dst-address-list=!NON-LIST dst-address-type=!local in-interface=all-ppp \
    src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=TikTok address-list-timeout=\
    none-static chain=prerouting content=.tiktokw. dst-address-list=!NON-LIST \
    dst-address-type=!local in-interface=all-ppp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=TikTok address-list-timeout=\
    none-static chain=prerouting content=.tiktokv. dst-address-list=!NON-LIST \
    dst-address-type=!local in-interface=all-ppp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=TikTok address-list-timeout=\
    none-static chain=prerouting content=.tiktokcdn. dst-address-list=\
    !NON-LIST dst-address-type=!local in-interface=all-ppp src-address-list=\
    "LOCAL IP"
add action=add-dst-to-address-list address-list=TikTok address-list-timeout=\
    none-static chain=prerouting content=.ttwstatic. dst-address-list=\
    !NON-LIST dst-address-type=!local in-interface=all-ppp src-address-list=\
    "LOCAL IP"
add action=add-dst-to-address-list address-list=GCC address-list-timeout=\
    none-static chain=prerouting comment=GCC content=.googlevideo.com \
    dst-address-list=!NON-LIST dst-address-type=!local in-interface=all-ppp \
    src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Meta address-list-timeout=\
    none-static chain=prerouting comment=FNA content=.fna.fbcdn.net \
    dst-address-list=!NON-LIST dst-address-type=!local in-interface=all-ppp \
    src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Meta address-list-timeout=\
    none-static chain=prerouting content=.cdn.whatsapp.net dst-address-list=\
    !NON-LIST dst-address-type=!local in-interface=all-ppp src-address-list=\
    "LOCAL IP"
add action=add-dst-to-address-list address-list=Meta address-list-timeout=\
    none-static chain=prerouting content=.cdninstagram. dst-address-list=\
    !NON-LIST dst-address-type=!local in-interface=all-ppp src-address-list=\
    "LOCAL IP"
add action=add-dst-to-address-list address-list=Meta address-list-timeout=\
    none-static chain=prerouting content=web.whatsapp.com dst-address-list=\
    !NON-LIST dst-address-type=!local in-interface=all-ppp src-address-list=\
    "LOCAL IP"
add action=add-dst-to-address-list address-list=Meta address-list-timeout=\
    none-static chain=prerouting content=.scdn. dst-address-list=!NON-LIST \
    dst-address-type=!local in-interface=all-ppp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Meta address-list-timeout=\
    none-static chain=prerouting content=whatsapp.net dst-address-list=\
    !NON-LIST dst-address-type=!local in-interface=all-ppp src-address-list=\
    "LOCAL IP"
add action=add-dst-to-address-list address-list=Meta address-list-timeout=\
    none-static chain=prerouting content=fna.whatsapp.net dst-address-list=\
    !NON-LIST dst-address-type=!local in-interface=all-ppp src-address-list=\
    "LOCAL IP"
add action=add-dst-to-address-list address-list=Meta address-list-timeout=\
    none-static chain=prerouting content=.fna.whatsapp.net dst-address-list=\
    !NON-LIST dst-address-type=!local in-interface=all-ppp src-address-list=\
    "LOCAL IP"
add action=add-dst-to-address-list address-list=Meta address-list-timeout=\
    none-static chain=prerouting content=.xx.fbcdn.net dst-address-list=\
    !NON-LIST dst-address-type=!local in-interface=all-ppp src-address-list=\
    "LOCAL IP"
add action=add-dst-to-address-list address-list=Meta address-list-timeout=\
    none-static chain=prerouting content=.whatsapp. dst-address-list=\
    !NON-LIST dst-address-type=!local in-interface=all-ppp src-address-list=\
    "LOCAL IP"
add action=add-dst-to-address-list address-list=Meta address-list-timeout=\
    none-static chain=prerouting content=graph.instagram.com \
    dst-address-list=!NON-LIST dst-address-type=!local in-interface=all-ppp \
    src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Meta address-list-timeout=\
    none-static chain=prerouting content=.fbcdn. dst-address-list=!NON-LIST \
    dst-address-type=!local in-interface=all-ppp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Meta address-list-timeout=\
    none-static chain=prerouting content=media-ist1-1.cdn.whatsapp.net \
    dst-address-list=!NON-LIST dst-address-type=!local in-interface=all-ppp \
    src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Meta address-list-timeout=\
    none-static chain=prerouting content=media.fbgw41-4.fna.whatsapp.net \
    dst-address-list=!NON-LIST dst-address-type=!local in-interface=all-ppp \
    src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Meta address-list-timeout=\
    none-static chain=prerouting content=media.fbgw41-1.fna.whatsapp.net \
    dst-address-list=!NON-LIST dst-address-type=!local in-interface=all-ppp \
    src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Meta address-list-timeout=\
    none-static chain=prerouting content=media.fbgw41-3.fna.whatsapp.net \
    dst-address-list=!NON-LIST dst-address-type=!local in-interface=all-ppp \
    src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Meta address-list-timeout=\
    none-static chain=prerouting content=media.fbgw41-2.fna.whatsapp.net \
    dst-address-list=!NON-LIST dst-address-type=!local in-interface=all-ppp \
    src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=SnapChat \
    address-list-timeout=none-static chain=prerouting comment=Snapchat \
    content=.snapchat. disabled=yes dst-address-list=!NON-LIST \
    dst-address-type=!local in-interface=all-ppp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=SnapChat \
    address-list-timeout=none-static chain=prerouting content=.sc-static.net. \
    disabled=yes dst-address-list=!NON-LIST dst-address-type=!local \
    in-interface=all-ppp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=SnapChat \
    address-list-timeout=none-static chain=prerouting content=.snapkit. \
    disabled=yes dst-address-list=!NON-LIST dst-address-type=!local \
    in-interface=all-ppp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=SnapChat \
    address-list-timeout=none-static chain=prerouting content=.scdn. \
    disabled=yes dst-address-list=!NON-LIST dst-address-type=!local \
    in-interface=all-ppp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Google address-list-timeout=\
    none-static chain=prerouting comment=Google content=.google.com \
    dst-address-list=!NON-LIST dst-address-type=!local in-interface=all-ppp \
    src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Google address-list-timeout=\
    none-static chain=prerouting content=.googleleapis.com dst-address-list=\
    !NON-LIST dst-address-type=!local in-interface=all-ppp src-address-list=\
    "LOCAL IP"
add action=add-dst-to-address-list address-list=Google address-list-timeout=\
    none-static chain=prerouting content=.googleadservices.com \
    dst-address-list=!NON-LIST dst-address-type=!local in-interface=all-ppp \
    src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Google address-list-timeout=\
    none-static chain=prerouting content=.google. dst-address-list=!NON-LIST \
    dst-address-type=!local in-interface=all-ppp src-address-list="LOCAL IP"
add action=add-dst-to-address-list address-list=Google address-list-timeout=\
    none-static chain=prerouting content=.youtube.com dst-address-list=\
    !NON-LIST dst-address-type=!local in-interface=all-ppp src-address-list=\
    "LOCAL IP"
