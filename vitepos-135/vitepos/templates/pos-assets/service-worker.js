if(!self.define){let e,s={};const c=(c,r)=>(c=new URL(c+".js",r).href,s[c]||new Promise((s=>{if("document"in self){const e=document.createElement("script");e.src=c,e.onload=s,document.head.appendChild(e)}else e=c,importScripts(c),s()})).then((()=>{let e=s[c];if(!e)throw new Error(`Module ${c} didn’t register its module`);return e})));self.define=(r,i)=>{const f=e||("document"in self?document.currentScript.src:"")||location.href;if(s[f])return;let o={};const a=e=>c(e,f),d={module:{uri:f},exports:o,require:a};s[f]=Promise.all(r.map((e=>d[e]||a(e)))).then((e=>(i(...e),o)))}}define(["./workbox-79ffe3e0"],(function(e){"use strict";e.setCacheNameDetails({prefix:"vitepos"}),self.addEventListener("message",(e=>{e.data&&"SKIP_WAITING"===e.data.type&&self.skipWaiting()})),e.precacheAndRoute([{url:"DoubleRing.svg",revision:"f71749e58bee8066166069e4c188e495"},{url:"Rolling.svg",revision:"72908447508a1cc4bb0471bc9c56b8a4"},{url:"Spinner.svg",revision:"70ed3fd217a2da2fb400e589411d114c"},{url:"Subtract.svg",revision:"281d2742dd7e019140283e559889b497"},{url:"css/_main_root.scss",revision:"6126a18cff8cc395e41b5cfcb1bfd70f"},{url:"css/_variable.scss",revision:"16304756dbff9d8cfc96f8509d3b5c05"},{url:"css/_variable_cyan.scss",revision:"22226ad20620a145ca4366c6240f4e75"},{url:"css/_variable_dark.scss",revision:"dfad486712cf5e40c11d7e1cfa41b3b3"},{url:"css/_variable_gray.scss",revision:"870853b367962bef0ff3eda7fc146342"},{url:"css/_variable_green.scss",revision:"45ef51340b9ea3782b5baa007328c555"},{url:"css/_variable_orange.scss",revision:"6906b1ddabe13993fefc9197b515bbd3"},{url:"css/_variable_pink.scss",revision:"65949324e1cce739d4b5d47252f58de5"},{url:"css/_variable_purple.scss",revision:"e3c6c6b9132257171938c1eef5f7f7e0"},{url:"css/_variable_red.scss",revision:"bbf6108e67fdd4cceb740d330920d8f1"},{url:"css/color-cyan.css",revision:"965356a10b2184e3365550634dbeabed"},{url:"css/color-cyan.scss",revision:"65083d47d40db7ed2fc4aa49d3b1fb6b"},{url:"css/color-dark.css",revision:"3eb93691fcff4d1038a2093dee3cd026"},{url:"css/color-dark.scss",revision:"f55fb7e9d43fc00e0d65d1174d48c554"},{url:"css/color-default.css",revision:"d328f78f8a4c9c8c50e56ed0bac519e5"},{url:"css/color-default.scss",revision:"9ac30e4651bff21dec6b21ad79892bbd"},{url:"css/color-gray.css",revision:"397d58a93c2286f50cb18e97e1e512be"},{url:"css/color-gray.scss",revision:"5b76cb7e100e61126f2262b8de3a8c17"},{url:"css/color-green.css",revision:"d0eead8428876787f42eef49db970a87"},{url:"css/color-green.scss",revision:"3c14665c1cfae82977c0b6e6ed43ebf2"},{url:"css/color-orange.css",revision:"ac2ad198a366740aa11d46e0ceaacf03"},{url:"css/color-orange.scss",revision:"56d0762d685bda1b2cb54c7040eb547a"},{url:"css/color-pink.css",revision:"ff56a67287fdf40311838d2800d4c4db"},{url:"css/color-pink.scss",revision:"03259cb822e4c552fb7ef051131d43ea"},{url:"css/color-purple.css",revision:"de4ced46ce08e4fdcfbac0cc6a112770"},{url:"css/color-purple.scss",revision:"b113f822f0386ff5bffea0fe2f501b7e"},{url:"css/color-red.css",revision:"22413eeeed2b418d29778b951ee849f6"},{url:"css/color-red.scss",revision:"e94972d4462d6b177148b2527e7fd78e"},{url:"css/vitepos.css",revision:"495e259cd1843f396201acff554ad1b4"},{url:"error_tone.mp3",revision:"d2fa2a1496a56b6179e8fc1aed9237ad"},{url:"favicon.png",revision:"1a3320dd0e81d67001cea3dbbfb22c1d"},{url:"filename.png",revision:"4f0f4863a284eba8b32ea33779dab7a3"},{url:"font.css",revision:"914eb0b64c89c65c08bdee73afd1886c"},{url:"font.scss",revision:"404c4490557b630c36814d5a1fdfbd38"},{url:"fonts/Inter-Regular.ttf",revision:"eba360005eef21ac6807e45dc8422042"},{url:"fonts/vps.eot",revision:"33a62d81025d74b5c1c635cd582c1335"},{url:"fonts/vps.svg",revision:"6b3e65b68816810f539446ace0d7d456"},{url:"fonts/vps.ttf",revision:"f808c105e5fa44cf75fc98b8d5b7d49b"},{url:"fonts/vps.woff",revision:"04b26bd2336b7650bf2a7b29cd2c44e6"},{url:"index.html",revision:"fbf8bd54d80d37a8bf39d6cfb17e6a9b"},{url:"js/about.js",revision:"f6ce09761e2026ac7c29d277d8cb317c"},{url:"loader.svg",revision:"01e1455279765848c402fe2ac3695464"},{url:"logo.png",revision:"afa141175fc023babf5766fd8c8b0aef"},{url:"mackbook.png",revision:"4436b19e69895101fea9d1ca2b932153"},{url:"manifest.json",revision:"d151b5f6e310a70b2f270f10bac67466"},{url:"middle-button.svg",revision:"2aa8cbf81a1a2a15eba7f6e6cde3f60c"},{url:"pos-skins/black.png",revision:"8af6f5b9853d8e4abd0fb560cc9dff12"},{url:"pos-skins/cyan.png",revision:"5999cfba6ad42a3c5bb5161beacd5d91"},{url:"pos-skins/default.png",revision:"dde5727b983ab145c1f359760836efe9"},{url:"pos-skins/gray.png",revision:"723996cf91a66cbffd316114a2d80b55"},{url:"pos-skins/green.png",revision:"26a96fc0af83254f01c4d79dc8d52270"},{url:"pos-skins/orange.png",revision:"eb3f4e79f86bc3cb348372dcb886bbcf"},{url:"pos-skins/pink.png",revision:"8a8a214539be5f0fbef4b57e5c00d9d9"},{url:"pos-skins/purple.png",revision:"0f53b9e56cf2f702a712d822ce1db04b"},{url:"pos-skins/red.png",revision:"6e33f73d42bb82d2a59a1f45c783609c"},{url:"robots.txt",revision:"b6216d61c03e6ce0c9aea6ca7808f7ca"},{url:"success_tone.mp3",revision:"10ea902f885ac991b301fd4618efefd0"}],{})}));
