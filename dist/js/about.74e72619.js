(window["webpackJsonp"]=window["webpackJsonp"]||[]).push([["about"],{"00d9":function(t,e,o){"use strict";o("2bf1")},"2bf1":function(t,e,o){},"5b93":function(t,e,o){"use strict";o.r(e);var s=function(){var t=this,e=t.$createElement,o=t._self._c||e;return o("v-app",{attrs:{id:"inspire2"}},[o("v-container",{staticClass:"m-10",attrs:{fluid:""}},[o("v-row",{staticStyle:{height:"180px"}},[o("v-col",[o("h3",{staticClass:"white--text",staticStyle:{"font-family":"'Caveat', cursive","font-size":"20px"}},[t._v(" Follow Me In ")]),o("ButtonsSocial")],1)],1),o("v-row",{staticStyle:{height:"120px"}},[o("v-col",[o("h3",{staticClass:"white--text",staticStyle:{"font-family":"'Caveat', cursive","font-size":"26px"}},[t._v(" Videos Gallary ")]),o("search",{attrs:{toolbarColor:(t.switch1,t.color.color2),toolbarTitle:"videos selection",inputColor:"",itemColor:"",light:!1,data:t.videos,states:t.states},on:{selectionAdded:t.GetSearchIndex,reset:t.resetSelect}})],1)],1),t.videos.length<=1?o("v-progress-circular",{staticClass:"mt-10",attrs:{size:200,width:10,color:"red ",indeterminate:""}}):t._e(),t.videos.length>1?o("v-row",[o("v-col",{attrs:{cols:"12"}},[null==t.select?o("carousel-3d",{attrs:{"controls-width":60,"controls-height":0,"controls-visible":!0,clickable:!0,height:455,width:500,display:10,loop:!0,perspective:60,autoplay:!1},on:{"after-slide-change":t.onAfterSlideChange,click:function(e){return t.stop()}}},t._l(t.videos,(function(e,s){return o("slide",{key:s,attrs:{index:s}},[o("figure",[o("iframe",{ref:"mycarousel",refInFor:!0,staticClass:"video",staticStyle:{"background-color":"rgb(0 0 0)"},attrs:{width:"100%",height:"380",frameborder:"0",allow:"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture",allowfullscreen:"",src:e.sources[0]}}),o("figcaption",{staticStyle:{position:"absolute",bottom:"-30px",height:"2rem"}},[o("v-btn",{attrs:{text:"",color:"white"}},[t._v(t._s(e.title))])],1),o("v-card-title",{staticClass:"\n                  swip\n                  text-h6\n                  d-block\n                  text-light text-center\n                  pa-0\n                  mx-auto\n                  bg-dark\n                ",staticStyle:{cursor:"pointer"}},[o("v-btn",{staticClass:"ma-2",attrs:{outlined:"",color:"orange"}},[o("v-icon",{attrs:{left:""}},[t._v("mdi-arrow-left-circle-outline")]),t._v(" Swip Here "),o("v-icon",{attrs:{right:""}},[t._v("mdi-arrow-right-circle-outline")])],1)],1)],1),t.select?t._e():o("commentTemp1",{attrs:{type:"Video",MainColor:t.switch1?t.color.color3:t.color.color2,data:e,badgeColor:t.switch1?t.color.color1:"pink lighten-1",Maintitle:"Tell Me What your opinion in "+e.title+" Video",index:s}},[o("iframe",{staticClass:"video",staticStyle:{"background-color":"#212121"},attrs:{width:"100%",height:"400",frameborder:"10",allow:"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture",allowfullscreen:"",src:e.sources[0]}})])],1)})),1):t._e(),o("div",{staticClass:"text-center"},[o("v-row",{attrs:{justify:"center"}},[o("v-col",{attrs:{cols:"12",sm:"8",md:"6"}},[o("v-card",[o("v-toolbar",{attrs:{color:t.switch1?t.color.color3:t.color.color2,dark:"",bottom:"","extension-height":"","min-height":"fit-content",rounded:!0,shaped:!0},model:{value:t.title.snackbar,callback:function(e){t.$set(t.title,"snackbar",e)},expression:"title.snackbar"}},[o("v-toolbar-title",{staticClass:"ma-auto text-h6"},[t._v(" "+t._s(t.select||t.title.text)+" ")])],1)],1)],1)],1)],1)],1)],1):t._e(),t.select?o("v-row",{staticClass:"d-flex justify-center mb-10"},[o("v-col",{attrs:{cols:"12"}},[o("div",{staticClass:"images-wrapper"},[o("figure",[t.select?o("iframe",{staticClass:"grey lighten-2 image selected-video position-relative",attrs:{preload:"none",width:680,height:480,frameborder:"0",allow:"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture",allowfullscreen:"",src:t.selectedVideo[0].sources[0]}}):t._e(),o("div",{staticClass:"select-comment"},[t.select?o("commentTemp1",{attrs:{type:"Video",MainColor:t.switch1?t.color.color3:t.color.color2,data:t.selectedVideo[0],badgeColor:t.switch1?t.color.color1:"pink lighten-1",Maintitle:"Tell Me What your opinion in "+t.selectedVideo[0].title+" Video",index:t.ii}},[o("iframe",{staticClass:"video",staticStyle:{"background-color":"#212121"},attrs:{width:"100%",height:"400",frameborder:"10",allow:"accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture",allowfullscreen:"",src:t.selectedVideo[0].sources[0]}})]):t._e()],1)])])])],1):t._e(),o("v-snackbar",{attrs:{timeout:2e3},scopedSlots:t._u([{key:"action",fn:function(e){var s=e.attrs;return[o("v-btn",t._b({attrs:{color:"blue",text:""},on:{click:function(e){t.snackbar1=!1}}},"v-btn",s,!1),[t._v(" Close ")])]}}]),model:{value:t.snackbar1,callback:function(e){t.snackbar1=e},expression:"snackbar1"}},[t._v(" "+t._s(t.resp)+" ")])],1),o("Message")],1)},i=[],a=(o("2223"),o("2af0")),r=o("b992"),c=o("5c03"),l={name:"Videos",data:function(){return{valid:!0,dialog:{},index:null,rules:[function(t){return!!t||"Required."},function(t){return t&&t.length>=3||"Min 3 characters"}],select:null,states:[],selectedVideo:[{description:"The first Blender Open Movie from 2006",sources:["https://www.youtube.com/embed/zP601i-x0O4"],subtitle:"By Blender Foundation",thumb:"http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ElephantsDream.jpg",title:"Elephant Dream",comments:[]}],commentDialog:{},resp:"",snackbarDelete:!1,snackbar1:!1,vertical:!0,slides:10,title:{snackbar:!1,text:""},ii:1,switch1:!1}},components:{Carousel3d:a["Carousel3d"],Slide:a["Slide"],search:r["a"],commentTemp1:c["a"]},created:function(){for(var t=0;t<this.videos.length;t++)if(this.states[t]=this.videos[t].title,null!==window.localStorage.getItem("VideoCommentsOf".concat(t))&&this.videos[t].comments)for(var e=0,o=0;o<this.videos[t].comments.length;o++)JSON.parse(localStorage.getItem("VideoCommentsOf".concat(t)))[e]&&this.videos[t].comments[o].id==JSON.parse(localStorage.getItem("VideoCommentsOf".concat(t)))[e].id&&(this.videos[t].comments[o].author=JSON.parse(localStorage.getItem("VideoCommentsOf".concat(t)))[e].author,this.videos[t].comments[o].color=JSON.parse(localStorage.getItem("VideoCommentsOf".concat(t)))[e].author?"pink":this.videos[t].comments[o].color,e++);this.title.text=this.states[0],this.colorDark()},methods:{GetSearchIndex:function(t,e){this.ii=t,this.selectedVideo[0]=this.videos[this.ii],this.select=e,this.title.text=e},resetSelect:function(t){this.select=t,this.title.text=this.states[0]},onAfterSlideChange:function(t){this.title.snackbar=!0,this.title.text=this.$refs.mycarousel[t].nextSibling.children[0].innerText;for(var e=0;e<this.$refs.mycarousel.length;e++)this.$refs.mycarousel[e].contentWindow.postMessage('{"event":"command","func":"stopVideo","args":""}',"*");var o=this.videos[t].thumbnails.high.url;document.getElementById("inspire2").style.backgroundImage="url(".concat(o,")")},stop:function(){for(var t=0;t<this.$refs.mycarousel.length;t++)this.$refs.mycarousel[t].contentWindow.postMessage('{"event":"command","func":"stopVideo","args":""}',"*")},colorDark:function(){this.switch1=this.$store.state.switch,1==this.switch1&&this.$store.commit("color"),0==this.switch1&&this.$store.commit("dark")}},computed:{color:function(){return this.$store.state.color},videos:function(){var t=this.$store.state.VideosModule.apivideos;return t}},watch:{color:function(){this.switch1=this.$store.state.switch}}},n=l,d=(o("b796"),o("00d9"),o("2877")),u=o("6544"),h=o.n(u),m=o("7496"),p=o("8336"),f=o("b0af"),v=o("99d9"),g=o("62ad"),b=o("a523"),w=o("132d"),y=o("490a"),C=o("0fd9"),x=o("2db4"),k=o("71d9"),V=o("2a7f"),S=Object(d["a"])(n,s,i,!1,null,"af4f220e",null);e["default"]=S.exports;h()(S,{VApp:m["a"],VBtn:p["a"],VCard:f["a"],VCardTitle:v["d"],VCol:g["a"],VContainer:b["a"],VIcon:w["a"],VProgressCircular:y["a"],VRow:C["a"],VSnackbar:x["a"],VToolbar:k["a"],VToolbarTitle:V["a"]})},"8cdb":function(t,e,o){"use strict";o.r(e);var s=function(){var t=this,e=t.$createElement,o=t._self._c||e;return o("div",{staticClass:"NotFound"},[o("v-container",[o("v-layout",{attrs:{row:"",wrap:""}},[o("v-flex",{attrs:{xs12:""}},[o("v-card",{attrs:{height:"400",color:"transparent",flat:""}},[o("div",{staticClass:"display-3 mt-5"},[t._v("Page not found.")]),o("div",{staticClass:"grey--text lighten-5"},[t._v(" The page you are trying to get to never existed in this reality, or has migrated to a parallel universe. ")]),o("div",{staticClass:"paragraph-text mt-2"},[o("br"),o("br"),t._v("Try going back to home page and repeating your action. Or, contact helpdesk for support. ")])])],1)],1)],1)],1)},i=[],a=(o("b2b1"),o("2877")),r=o("6544"),c=o.n(r),l=o("b0af"),n=o("a523"),d=(o("20f6"),o("e8f2")),u=Object(d["a"])("flex"),h=Object(d["a"])("layout"),m={},p=Object(a["a"])(m,s,i,!1,null,null,null);e["default"]=p.exports;c()(p,{VCard:l["a"],VContainer:n["a"],VFlex:u,VLayout:h})},b2b1:function(t,e,o){"use strict";o("e4a5")},b796:function(t,e,o){"use strict";o("e481")},e481:function(t,e,o){},e4a5:function(t,e,o){}}]);
//# sourceMappingURL=about.74e72619.js.map