port: 7890
socks-port: 7891
mixed-port: 7892  #HTTP+SOCKS
redir-port: 7893     # 重定向     TCP Linux+MAC
tproxy-port: 7894  # 透明代理 TCP+UDP   Linux
ipv6: true
log-level: warning
allow-lan: true 
bind-address: "*" #'表示所有地址
authentication:
  - "wcnmm:1145141919810"
skip-auth-prefixes:
  - 127.0.0.1/8
  - ::1/128
secret: 123456
mode: rule
global-ua: clash.meta
tcp-concurrent: true
unified-delay: false
disable-keep-alive: false
keep-alive-idle: 1680 #首次发送探测包 28min
keep-alive-interval: 15 #无响应重发探测包间隔 共9次
find-process-mode: off
global-client-fingerprint: random
external-controller: 0.0.0.0:9090
external-ui: ui
external-ui-name: metacubexd
external-ui-url: https://github.com/MetaCubeX/metacubexd/archive/refs/heads/gh-pages.zip
geodata-mode: false #true为dat false为mmdb 默认false
geo-auto-update: true
geo-update-interval: 24 #小时
geodata-loader: standard #小内存模式 memconservative
geox-url:
  geoip: https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geoip-lite.dat
  geosite: https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geosite.dat
  mmdb: https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/country-lite.mmdb
  asn: https://github.com/xishang0128/geoip/releases/download/latest/GeoLite2-ASN.mmdb
profile:
  store-selected: true
  store-fake-ip: true
ntp:
  enable: true
  write-to-system: false
  server: ntp.aliyun.com
  port: 123
  interval: 60 #min
sniffer: 
  enable: true
  force-dns-mapping: false  # 对redir-host 的流量启用
  parse-pure-ip: true # 对无域名的流量启用
  override-destination: true #开启后会使用节点DNS重新解析域名，可以DNS解锁，DNS测试也会出现节点的上游DNS服务器  适用于被提前解析且被污染的域名
  force-domain:
     - +.v2ex.com
  skip-domain: 
     - +.Mijia Cloud
     - +.dlg.io.mi.com
  sniff:
    HTTP: 
      ports: [80, 8080-8880]
    TLS:
      ports: [443, 8443]
    QUIC:
      ports: [443, 8443]
tun:
  enable: true
  stack: mixed #system 原生响应快 mixed模式 tcp 使用 system栈,udp 使用 gvisor栈
  mtu: 9000
  auto-route: true
  auto-detect-interface: true
  strict_route: true #严格路由,防止地址泄漏并进行DNS劫持，但设备将无法其他设备被访问
  dns-hijack:
    - any:53
    - tcp://any:53
dns: #Fake-ip下仅当匹配直连规则或者ip规则(未加no-resolve时)触发ip查询
  enable: true
  ipv6: true
  listen: 127.0.0.1:1053
  use-hosts: true
  use-system-hosts: true
  respect-rules: true #需配置 proxy-server-nameserver: 
  prefer-h3: true
  enhanced-mode: fake-ip
  fake-ip-range: 198.18.0.1/16
  fake-ip-filter-mode: blacklist
  fake-ip-filter:
    - geosite:CN
    - +.msftconnecttest.com
    - +.msftncsi.com
  proxy-server-nameserver: 
      - system
      - quic://223.5.5.5:853
      - quic://223.6.6.6:853
  default-nameserver: #用于解析nameserver的域名,必须为 IP
      - system
      - quic://223.5.5.5:853
      - quic://223.6.6.6:853
  nameserver-policy: #指定域名查询,可用 geosite, 优先于 nameserver/fallback，组外顺序查询，组内并发查询
    geosite:Private,CN:
      - system
#      - https://223.5.5.5/dns-query#h3=true&ecs=121.237.248.0/24
 #     - https://223.6.6.6/dns-query#h3=true&ecs=121.237.248.0/24
    geosite:!CN:
      - https://8..8.8.8/dns-query#🚀 节点选择&ecs=121.237.248.0/24
      - https://8.8.4.4/dns-query#🚀 节点选择&ecs=121.237.248.0/24
      - https://9.9.9.11/dns-query#🚀 节点选择&ecs=121.237.248.0/24
      - https://149.112.112.11/dns-query#🚀 节点选择&ecs=121.237.248.0/24



#208.67.222.222
#208.67.220.220

  nameserver:
      - system

proxy-groups:
#exclude-type: Shadowsocks|ShadowsocksR|vmess|vless|Trojan
  - name: 🚀 节点选择
    type: url-test
    url: https://www.gstatic.com/generate_204
    interval: 20
    proxies:
      - ⚡ 自动选择
      - 🏳️‍⚧️ ChromeGo
      - 🇭🇰 香港节点
      - 🇹🇼 台湾节点
      - 🇯🇵 日本节点
      - 🇸🇬 新加坡节点
      - 🇺🇸 美国节点
      - 订阅1
      - 订阅2
      - 订阅3
      - 订阅4
      
  - name: ⚡ 自动选择
    type: url-test
    url: https://www.gstatic.com/generate_204
    interval: 600
    include-all-providers: true
    filter: (?i)(🇭🇰|港|hk|hongkong|hong kong|🇹🇼|台|tw|taiwan|新北|彰化|桃园)

  - name: 🤖 Ai
    type: url-test
    url: https://www.gstatic.com/generate_204
    interval: 300
    proxies:
      - 🇹🇼 台湾节点
      - 🇯🇵 日本节点
      - 🇸🇬 新加坡节点
      - 🇺🇸 美国节点
      
  - name: 🗽 视频流
    type: url-test
    url: https://www.gstatic.com/generate_204
    interval: 60
    proxies:
      - ⚡ 自动选择
      - 🏳️‍⚧️ ChromeGo
      - 订阅1
      - 订阅3
      
  - name: 🎮 游戏
    type: url-test
    url: https://www.gstatic.com/generate_204
    interval: 60
    proxies:
      - 🚀 节点选择
      - ⚡ 自动选择
      - 🏳️‍⚧️ ChromeGo
      - 订阅1
      - 订阅2
      - 订阅3
      - 订阅4
      
      
  - name: ⚔ CDN下载
    type: select
    proxies:
      - 🇨🇳 国内直连      
      - 🚀 节点选择
      - ⚡ 自动选择
      - 🏳️‍⚧️ ChroeGo
      - 订阅1
      - 订阅2
      - 订阅3
      - 订阅4

  - name: 🤩 TG
    type: url-test
    url: https://www.gstatic.com/generate_204
    interval: 150
    proxies:
      - 🚀 节点选择
      - ⚡ 自动选择
      - 🏳️‍⚧️ ChromeGo
      - ⚖ 负载均衡
      - 订阅1
      - 订阅2
      - 订阅3
      - 订阅4
      
  - name: 📺 哔哩哔哩
    type: select
    proxies:
      - 😎 社交媒体
      - 🇨🇳 国内直连      
      
  - name: 😎 社交媒体
    type: url-test
    url: https://www.gstatic.com/generate_204
    interval: 30
    proxies:
      - 🇹🇼 台湾节点
      - 🇭🇰 香港节点
      - 订阅1
      - 订阅3

  - name: 🏳️‍⚧️ ChromeGo
    type: load-balance
    strategy: round-robin
    url: https://www.gstatic.com/generate_204
    interval: 600
    use:
      - ChromeGo
      
  - name: 订阅1
    type: url-test
    url: https://www.gstatic.com/generate_204
    interval: 300
    use:
      - subscription
    
  - name: 订阅2
    type: load-balance
    strategy: round-robin
    url: https://www.gstatic.com/generate_204
    interval: 300
    use:
      - 备用

  - name: 订阅3
    type: url-test
    url: https://www.gstatic.com/generate_204
    interval: 300
    use:
      - 蛋黄
      
  - name: 订阅4
    type: load-balance
    strategy: round-robin
    url: https://www.gstatic.com/generate_204
    interval: 900
    use:
      - vless
      
  - name: 🇭🇰 香港节点
    type: url-test
    url: https://www.gstatic.com/generate_204
    lazy: false
    include-all-providers: true
    interval: 600
    filter: (?i)(🇭🇰|港|hk|hongkong|hong kong)  
    
  - name: 🇹🇼 台湾节点
    type: url-test
    url: https://www.gstatic.com/generate_204
    lazy: false
    include-all-providers: true
    interval: 300
    filter: (?i)(🇹🇼|台|tw|taiwan|新北|彰化|桃园) 
    exclude-filter: (?i)network

  - name: 🇯🇵 日本节点
    type: url-test
    url: https://www.gstatic.com/generate_204
    include-all-providers: true
    interval: 600
    filter: (?i)(🇯🇵|日|jp|japan|日本|川日|东京|大阪|泉日|埼玉|沪日|深日)  
    exclude-filter: (?i)每日
    
  - name: 🇸🇬 新加坡节点
    type: url-test
    url: https://www.gstatic.com/generate_204
    include-all-providers: true
    interval: 600
    filter: (?i)(🇸🇬|新|sg|singapore|新加坡|狮城)
    exclude-filter: (?i)更新
    
  - name: 🇺🇸 美国节点
    type: url-test
    url: https://www.gstatic.com/generate_204
    include-all-providers: true
    interval: 900
    filter: (?i)(🇺🇸|美|us|unitedstates|united states|波特兰|达拉斯|俄勒冈|凤凰城|费利蒙|硅谷|拉斯维加斯|洛杉矶|圣何塞|圣克拉拉|西雅图|芝加哥) 
    exclude-filter: (?i)use
    
  - name: 🇰🇷 韩国节点
    type: select
    include-all-providers: true
    filter: (?i)(kr|korea|kor|首尔|韩|韓)

  - name: 🌏 其它地区
    type: select
    include-all-providers: true
    exclude-filter: (?i)(🇭🇰|🇹🇼|🇯🇵|🇸🇬|🇺🇸|港|hk|hongkong|hong kong|台|tw|taiwan|新北|彰化|桃园|日|jp|japan|日本|川日|东京|大阪|泉日|埼玉|沪日|深日|新|sg|singapore|狮城|美|us|unitedstates|United States|波特兰|达拉斯|俄勒冈|凤凰城|费利蒙|硅谷|拉斯维加斯|洛杉矶|圣何塞|圣克拉拉|西雅图|芝加哥|kr|korea|kor|首尔|韩|韓)
    
  - name: 🛑 广告拦截
    hidden: true
    type: select
    proxies:
      - REJECT
      - 🇨🇳 国内直连
      
  - name: 🇨🇳 国内直连
    type: select
    proxies:
      - DIRECT
      - 🚀 节点选择    

  - name: 🐟 漏网之鱼
    type: select
    proxies:
      - 🚀 节点选择
      - 🇨🇳 国内直连

proxy-providers:
#订阅转换 https://url.v1.mk/sub?target=clash&url= 
#换行符%7c   AN运算符%26    等于号%3D  冒号%3A  左斜杠%2F   例 &flag=clash.meta  %26flag%3Dclash.meta     
#可选 &emoji=true&xudp=true&udp=true&tfo=true&fdn=true&scv=false&new_name=true
#exclude-filter: 群|邀请|返利|循环|官网|客服|网站|网址|获取|订阅|流量|到期|机场|下次|版本|官址|备用|过期|已用|联系|邮箱|工单|贩卖|通知|倒卖|防止|国内|地址|频道|无法|说明|使用|提示|特别|访问|支持|教程|关注|更新|作者|加入

  ChromeGo:
    type: http
    path: ./proxy_providers/subscription1.yaml
    url: https://raw.githubusercontent.com/yaney01/chromego_merge/main/sub/merged_proxies_new.yaml
    interval: 21600
#    exclude-type: 
    override:
      up: 100
      down: 100
      udp: true
      skip-cert-verify: false
      tfo: true
      mptcp: true
#    filter:
#    exclude-filter: 
    health-check:
      enable: true
      lazy: false
      url: https://www.gstatic.com/generate_204
      interval: 600
      timeout: 1000
      
  蛋黄:
    type: http
    path: ./proxy_providers/subscription2.yaml
    url: https://paste.gg/p/TG@FProxies/214f373d00fd448fb365c1871fd03c3b/files/99f61e9aa2234ed18a357e5e06fd5079/raw
    interval: 21600
    filter: (?i)(🇭🇰|🇹🇼|🇯🇵|🇸🇬|港|hk|hongkong|hong kong|台|tw|taiwan|新北|彰化|桃园|日|jp|japan|日本|川日|东京|大阪|泉日|埼玉|沪日|深日|新|sg|singapore|狮城|美|us|unitedstates|United States|波特兰|达拉斯|俄勒冈|凤凰城|费利蒙|硅谷|拉斯维加斯|洛杉矶|圣何塞|圣克拉拉|西雅图|芝加哥)
    override:
      udp: true
      skip-cert-verify: false
      tfo: true
      mptcp: true
    health-check:
      enable: true
      lazy: false
      url: https://www.gstatic.com/generate_204
      interval: 300
      timeout: 1000

  subscription:    # %7chttps://raw.githubusercontent.com/0xJins/x.sub/main/trial.yaml
    type: http
    path: ./proxy_providers/subscription3.yaml
    url: https://sub.d1.mk/sub?target=clash&url=https://raw.githubusercontent.com/mfbpn/tg_mfbpn_sub/main/trial.yaml%7chttps://raw.githubusercontent.com/imyaoxp/x.sub/main/trial.yaml&emoji=true&xudp=true&udp=true&tfo=true&fdn=true&new_name=true
    interval: 21600
    filter: (?i)(🇭🇰|🇹🇼|🇯🇵|🇸🇬|🇺🇸|港|hk|hongkong|hong kong|台|tw|taiwan|新北|彰化|桃园|日|jp|japan|日本|川日|东京|大阪|泉日|埼玉|沪日|深日|新|sg|singapore|狮城|美|us|unitedstates|United States|波特兰|达拉斯|俄勒冈|凤凰城|费利蒙|硅谷|拉斯维加斯|洛杉矶|圣何塞|圣克拉拉|西雅图|芝加哥)
    override:
      udp: true
      skip-cert-verify: false
      tfo: true
      mptcp: true
    health-check:
      enable: true
      lazy: false
      url: https://www.gstatic.com/generate_204
      interval: 300
      timeout: 1000
  
  备用:
    type: http
    path: ./proxy_providers/subscription4.yaml
    url: https://raw.githubusercontent.com/go4sharing/sub/main/sub.yaml
    interval: 21600
    override:
      udp: true
      skip-cert-verify: false
      tfo: true
      mptcp: true      
    health-check:
      enable: true
      lazy: false
      url: https://www.gstatic.com/generate_204
      interval: 300
      timeout: 1000
    
#  日更:
#    type: http
#    path: ./proxy_providers/subscription5.yaml
#    url: https://sub.d1.mk/sub?target=clash&url=https://raw.githubusercontent.com/ripaojiedian/freenode/main/clash%7chttps://raw.githubusercontent.com/gitbigg/dy/main/jd%7chttps://raw.githubusercontent.com/hkaa0/permalink/main/proxy/clash.yaml%7chttps://raw.githubusercontent.com/blngxj/ASCII/master/subs&emoji=true&xudp=true&udp=true&tfo=true&fdn=true&new_name=true    
#    interval: 21600
#    override:
#      udp: true
#      skip-cert-verify: false
#      tfo: true
#      mptcp: true
#    health-check:
#      enable: true
#      lazy: false
#      url: https://www.gstatic.com/generate_204
#      interval: 150
#      timeout: 1000
      
  vless: 
    type: http
    path: ./proxy_providers/subscription7.yaml
    url: https://url.v1.mk/sub?target=clash&url=https%3A%2F%2Flinks.bocchi2b.top%2Fclash%7Chttps%3A%2F%2Falvless.comorg.us.kg%2FTCorg%7Chttps%3A%2F%2Fmoistr.freenods.sbs%2Fmianfeicf%7Chttps%3A%2F%2Furl.happyhour.lol%2FHappyhour%7Chttps%3A%2F%2Fvless.fxxk.dedyn.io%2Fauto%7Chttps%3A%2F%2F3K.fxxk.dedyn.io%2Fauto%7Chttps%3A%2F%2Fsub.kaiche.tk%2F%3Ftoken%3Dauto%7Chttps%3A%2F%2Fsub.kaiche.tk%2F%3Ftoken%3Dauto&emoji=true&xudp=true&udp=true&tfo=true&fdn=true&new_name=true
    interval: 21600
#    filter: (?i)(🇭🇰|🇹🇼|🇯🇵|🇸🇬|🇺🇸|港|hk|hongkong|hong kong|台|tw|taiwan|新北|彰化|桃园|日|jp|japan|日本|川日|东京|大阪|泉日|埼玉|沪日|深日|新|sg|singapore|狮城|美|us|unitedstates|United States|波特兰|达拉斯|俄勒冈|凤凰城|费利蒙|硅谷|拉斯维加斯|洛杉矶|圣何塞|圣克拉拉|西雅图|芝加哥)
    override:
      udp: true
      skip-cert-verify: false
      tfo: true
      mptcp: true
    health-check:
      enable: true
      lazy: false
      url: https://www.gstatic.com/generate_204
      interval: 900
      timeout: 1000
      
rule-providers:
#behavior: domain / ipcidr / classical  #classical有前缀字段，ip和domain直接跟内容 classical 是ipcidr和domain-suffix
#format: text/yaml 区别：yaml有payload   默认yaml
   
  补充规则集:
    type: http
    behavior: classical
    path: ./rule_providers/补充规则集.yaml
    url: https://raw.githubusercontent.com/blngxj/ASCII/refs/heads/master/rules
    interval: 86400
   
  直连域名列表:
    type: http
    behavior: domain
    path: ./rule_providers/直连域名列表.yaml
    url: https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/direct.txt
    interval: 86400
    
  代理域名列表:
    type: http
    behavior: domain
    path: ./rule_providers/代理域名列表.yaml
    url: https://raw.githubusercontent.com/Loyalsoldier/clash-rules/release/proxy.txt
    interval: 86400
    
  GoogleFCM:
    type: http
    behavior: classical
    path: ./rule_providers/GoogleFCM.yaml
    url: https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/GoogleFCM/GoogleFCM_No_Resolve.yaml
    interval: 86400

  GameDownLoad:
    type: http
    behavior: classical
    path: ./rule_providers/GameDownLoadyaml
    url: https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/refs/heads/master/rule/Clash/Game/GameDownload/GameDownload_No_Resolve.yaml
    interval: 86400
    
  Bing&Copilot:
    type: http
    behavior: classical
    path: ./rule_providers/Bing&Copilot.yaml
    url: https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/Providers/Ruleset/Bing.yaml
    interval: 86400
   
  OpenAi:
    type: http
    behavior: classical
    path: ./rule_providers/OpenAI.yaml
    url: https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/OpenAI/OpenAI_No_Resolve.yaml
    interval: 86400   
       
  Gemini:
    type: http
    behavior: classical
    path: ./rule_providers/Gemini.yaml
    url: https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Gemini/Gemini_No_Resolve.yaml
    interval: 86400   
           
  Claude:
    type: http
    behavior: classical
    path: ./rule_providers/Claude.yaml
    url: https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/Claude/Claude_No_Resolve.yaml
    interval: 86400   
    
  p2p_httpdns:
    type: http
    behavior: classical
    path: ./rule_providers/p2p_httpdns.yaml
    url: https://raw.githubusercontent.com/SunsetMkt/anti-ip-attribution/main/generated/rule-provider-reject.yaml
    interval: 86400

  屏蔽httpdns:
    type: http
    behavior: classical
    path: ./rule_providers/blockhttpdns.yaml
    url: https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/BlockHttpDNS/BlockHttpDNS_No_Resolve.yaml
    interval: 86400
    
  miui隐私:
    type: http
    behavior: classical
    path: ./rule_providers/MIUIPrivacy.yaml
    url: https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/Clash/MIUIPrivacy/MIUIPrivacy_No_Resolve.yaml

  AdRule:   
    type: http
    behavior: domain
    path: ./rule_providers/AdRule.yaml
    url: https://raw.githubusercontent.com/xndeye/adblock_list/beta/rule/clash.yaml
    interval: 86400

  Anti-AD: 
    type: http
    behavior: domain
    path: ./rule_providers/BanEasyPrivacy.yaml
    url: https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/master/anti-ad-clash.yaml
    interval: 86400
    
  加密dns:   
    type: http
    behavior: domain
    path: ./rule_providers/dns.yaml
    url: https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/master/discretion/dns.txt
    interval: 86400    
    format: text

    
  PCDN:   
    type: http
    behavior: domain
    path: ./rule_providers/PCDN.yaml
    url: https://raw.githubusercontent.com/privacy-protection-tools/anti-AD/master/discretion/pcdn.txt
    interval: 86400    
    format: text
    
rules:
#  - DOMAIN-SUFFIX,gvt1.com,🚀 节点选择
#  - AND,(AND,(DST-PORT,443),(NETWORK,UDP)),(NOT,((GEOSITE,cn))),🛑 广告拦截 # 屏蔽国外quic
#  - AND,(AND,(DST-PORT,443),(NETWORK,UDP)),(NOT,((GEOIP,cn,no-resolve))),🛑 广告拦截
  - RULE-SET,屏蔽httpdns,🛑 广告拦截,no-resolve
  - RULE-SET,p2p_httpdns,🛑 广告拦截,no-resolve
  - RULE-SET,加密dns,🛑 广告拦截
  - RULE-SET,PCDN,🛑 广告拦截 
  - RULE-SET,miui隐私,🛑 广告拦截
  - RULE-SET,Anti-AD,🛑 广告拦截
  - RULE-SET,AdRule,🛑 广告拦截

  - GEOIP,Private,🇨🇳 国内直连,no-resolve
  - GEOSITE,Private,🇨🇳 国内直连
  - RULE-SET,GoogleFCM,🇨🇳 国内直连,no-resolve
  - RULE-SET,补充规则集,⚔ CDN下载
#港澳台判定  
  - DOMAIN-SUFFIX,biliapi.net,📺 哔哩哔哩 #港澳台番剧 视频列表 评论区
  - DOMAIN-SUFFIX,api.bilibili.com,📺 哔哩哔哩 #港澳台番剧 视频列表 评论区
  - DOMAIN,www.bilibili.com,📺 哔哩哔哩 #PC端港澳台
#  - DOMAIN-SUFFIX,app.bilibili.com,📺 哔哩哔哩 #陆版app去广
  - DOMAIN-SUFFIX,passport.bilibili.com,😎 社交媒体 #登录地
  - GEOSITE,category-games@cn,🇨🇳 国内直连
  - GEOIP,CN,🇨🇳 国内直连,no-resolve
  - GEOSITE,CN,🇨🇳 国内直连
 #代理分流
  - RULE-SET,Bing&Copilot,🚀 节点选择
  - RULE-SET,Gemini,🤖 Ai,no-resolve
  - GEOSITE,OpenAi,🤖 Ai
  - RULE-SET,OpenAi,🤖 Ai,no-resolve
  - RULE-SET,Claude,🤖 Ai,no-resolve
  - DOMAIN-SUFFIX,fc2.com,🗽 视频流
  - GEOSITE,Twitch,🗽 视频流
  - GEOSITE,YouTube,🗽 视频流
  - RULE-SET,GameDownLoad,⚔ CDN下载
  - GEOSITE,category-games,🎮 游戏
  - GEOSITE,category-porn,🤩 TG
  - GEOSITE,dmm,🚀 节点选择
  - GEOIP,Telegram,🤩 TG,no-resolve
  - GEOSITE,bahamut,😎 社交媒体
  - GEOIP,Google,😎 社交媒体,no-resolve
  - GEOIP,Twitter,😎 社交媒体,no-resolve
  - GEOIP,Facebook,😎 社交媒体,no-resolve
  - GEOSITE,category-communication,😎 社交媒体 # discord line telegram whatsapp messenger
  - GEOSITE,category-social-media-!cn,😎 社交媒体 # facebook instagram twitter
  - GEOSITE,Google,😎 社交媒体
#  - GEOSITE,category-scholar-!cn,🚀 节点选择
  - GEOSITE,GFW,🚀 节点选择
  - GEOSITE,geolocation-!cn,🚀 节点选择
  - RULE-SET,代理域名列表,🚀 节点选择
  - MATCH,🐟 漏网之鱼
