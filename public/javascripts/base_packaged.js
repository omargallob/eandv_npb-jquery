var swfobject=function(){var UNDEF="undefined",OBJECT="object",SHOCKWAVE_FLASH="Shockwave Flash",SHOCKWAVE_FLASH_AX="ShockwaveFlash.ShockwaveFlash",FLASH_MIME_TYPE="application/x-shockwave-flash",EXPRESS_INSTALL_ID="SWFObjectExprInst",ON_READY_STATE_CHANGE="onreadystatechange",win=window,doc=document,nav=navigator,plugin=false,domLoadFnArr=[main],regObjArr=[],objIdArr=[],listenersArr=[],storedAltContent,storedAltContentId,storedCallbackFn,storedCallbackObj,isDomLoaded=false,isExpressInstallActive=false,dynamicStylesheet,dynamicStylesheetMedia,autoHideShow=true,ua=function(){var w3cdom=typeof doc.getElementById!=UNDEF&&typeof doc.getElementsByTagName!=UNDEF&&typeof doc.createElement!=UNDEF,u=nav.userAgent.toLowerCase(),p=nav.platform.toLowerCase(),windows=p?/win/.test(p):/win/.test(u),mac=p?/mac/.test(p):/mac/.test(u),webkit=/webkit/.test(u)?parseFloat(u.replace(/^.*webkit\/(\d+(\.\d+)?).*$/,"$1")):false,ie=!+"\v1",playerVersion=[0,0,0],d=null;if(typeof nav.plugins!=UNDEF&&typeof nav.plugins[SHOCKWAVE_FLASH]==OBJECT){d=nav.plugins[SHOCKWAVE_FLASH].description;if(d&&!(typeof nav.mimeTypes!=UNDEF&&nav.mimeTypes[FLASH_MIME_TYPE]&&!nav.mimeTypes[FLASH_MIME_TYPE].enabledPlugin)){plugin=true;ie=false;d=d.replace(/^.*\s+(\S+\s+\S+$)/,"$1");playerVersion[0]=parseInt(d.replace(/^(.*)\..*$/,"$1"),10);playerVersion[1]=parseInt(d.replace(/^.*\.(.*)\s.*$/,"$1"),10);playerVersion[2]=/[a-zA-Z]/.test(d)?parseInt(d.replace(/^.*[a-zA-Z]+(.*)$/,"$1"),10):0;}}
else if(typeof win.ActiveXObject!=UNDEF){try{var a=new ActiveXObject(SHOCKWAVE_FLASH_AX);if(a){d=a.GetVariable("$version");if(d){ie=true;d=d.split(" ")[1].split(",");playerVersion=[parseInt(d[0],10),parseInt(d[1],10),parseInt(d[2],10)];}}}
catch(e){}}
return{w3:w3cdom,pv:playerVersion,wk:webkit,ie:ie,win:windows,mac:mac};}(),onDomLoad=function(){if(!ua.w3){return;}
if((typeof doc.readyState!=UNDEF&&doc.readyState=="complete")||(typeof doc.readyState==UNDEF&&(doc.getElementsByTagName("body")[0]||doc.body))){callDomLoadFunctions();}
if(!isDomLoaded){if(typeof doc.addEventListener!=UNDEF){doc.addEventListener("DOMContentLoaded",callDomLoadFunctions,false);}
if(ua.ie&&ua.win){doc.attachEvent(ON_READY_STATE_CHANGE,function(){if(doc.readyState=="complete"){doc.detachEvent(ON_READY_STATE_CHANGE,arguments.callee);callDomLoadFunctions();}});if(win==top){(function(){if(isDomLoaded){return;}
try{doc.documentElement.doScroll("left");}
catch(e){setTimeout(arguments.callee,0);return;}
callDomLoadFunctions();})();}}
if(ua.wk){(function(){if(isDomLoaded){return;}
if(!/loaded|complete/.test(doc.readyState)){setTimeout(arguments.callee,0);return;}
callDomLoadFunctions();})();}
addLoadEvent(callDomLoadFunctions);}}();function callDomLoadFunctions(){if(isDomLoaded){return;}
try{var t=doc.getElementsByTagName("body")[0].appendChild(createElement("span"));t.parentNode.removeChild(t);}
catch(e){return;}
isDomLoaded=true;var dl=domLoadFnArr.length;for(var i=0;i<dl;i++){domLoadFnArr[i]();}}
function addDomLoadEvent(fn){if(isDomLoaded){fn();}
else{domLoadFnArr[domLoadFnArr.length]=fn;}}
function addLoadEvent(fn){if(typeof win.addEventListener!=UNDEF){win.addEventListener("load",fn,false);}
else if(typeof doc.addEventListener!=UNDEF){doc.addEventListener("load",fn,false);}
else if(typeof win.attachEvent!=UNDEF){addListener(win,"onload",fn);}
else if(typeof win.onload=="function"){var fnOld=win.onload;win.onload=function(){fnOld();fn();};}
else{win.onload=fn;}}
function main(){if(plugin){testPlayerVersion();}
else{matchVersions();}}
function testPlayerVersion(){var b=doc.getElementsByTagName("body")[0];var o=createElement(OBJECT);o.setAttribute("type",FLASH_MIME_TYPE);var t=b.appendChild(o);if(t){var counter=0;(function(){if(typeof t.GetVariable!=UNDEF){var d=t.GetVariable("$version");if(d){d=d.split(" ")[1].split(",");ua.pv=[parseInt(d[0],10),parseInt(d[1],10),parseInt(d[2],10)];}}
else if(counter<10){counter++;setTimeout(arguments.callee,10);return;}
b.removeChild(o);t=null;matchVersions();})();}
else{matchVersions();}}
function matchVersions(){var rl=regObjArr.length;if(rl>0){for(var i=0;i<rl;i++){var id=regObjArr[i].id;var cb=regObjArr[i].callbackFn;var cbObj={success:false,id:id};if(ua.pv[0]>0){var obj=getElementById(id);if(obj){if(hasPlayerVersion(regObjArr[i].swfVersion)&&!(ua.wk&&ua.wk<312)){setVisibility(id,true);if(cb){cbObj.success=true;cbObj.ref=getObjectById(id);cb(cbObj);}}
else if(regObjArr[i].expressInstall&&canExpressInstall()){var att={};att.data=regObjArr[i].expressInstall;att.width=obj.getAttribute("width")||"0";att.height=obj.getAttribute("height")||"0";if(obj.getAttribute("class")){att.styleclass=obj.getAttribute("class");}
if(obj.getAttribute("align")){att.align=obj.getAttribute("align");}
var par={};var p=obj.getElementsByTagName("param");var pl=p.length;for(var j=0;j<pl;j++){if(p[j].getAttribute("name").toLowerCase()!="movie"){par[p[j].getAttribute("name")]=p[j].getAttribute("value");}}
showExpressInstall(att,par,id,cb);}
else{displayAltContent(obj);if(cb){cb(cbObj);}}}}
else{setVisibility(id,true);if(cb){var o=getObjectById(id);if(o&&typeof o.SetVariable!=UNDEF){cbObj.success=true;cbObj.ref=o;}
cb(cbObj);}}}}}
function getObjectById(objectIdStr){var r=null;var o=getElementById(objectIdStr);if(o&&o.nodeName=="OBJECT"){if(typeof o.SetVariable!=UNDEF){r=o;}
else{var n=o.getElementsByTagName(OBJECT)[0];if(n){r=n;}}}
return r;}
function canExpressInstall(){return!isExpressInstallActive&&hasPlayerVersion("6.0.65")&&(ua.win||ua.mac)&&!(ua.wk&&ua.wk<312);}
function showExpressInstall(att,par,replaceElemIdStr,callbackFn){isExpressInstallActive=true;storedCallbackFn=callbackFn||null;storedCallbackObj={success:false,id:replaceElemIdStr};var obj=getElementById(replaceElemIdStr);if(obj){if(obj.nodeName=="OBJECT"){storedAltContent=abstractAltContent(obj);storedAltContentId=null;}
else{storedAltContent=obj;storedAltContentId=replaceElemIdStr;}
att.id=EXPRESS_INSTALL_ID;if(typeof att.width==UNDEF||(!/%$/.test(att.width)&&parseInt(att.width,10)<310)){att.width="310";}
if(typeof att.height==UNDEF||(!/%$/.test(att.height)&&parseInt(att.height,10)<137)){att.height="137";}
doc.title=doc.title.slice(0,47)+" - Flash Player Installation";var pt=ua.ie&&ua.win?"ActiveX":"PlugIn",fv="MMredirectURL="+win.location.toString().replace(/&/g,"%26")+"&MMplayerType="+pt+"&MMdoctitle="+doc.title;if(typeof par.flashvars!=UNDEF){par.flashvars+="&"+fv;}
else{par.flashvars=fv;}
if(ua.ie&&ua.win&&obj.readyState!=4){var newObj=createElement("div");replaceElemIdStr+="SWFObjectNew";newObj.setAttribute("id",replaceElemIdStr);obj.parentNode.insertBefore(newObj,obj);obj.style.display="none";(function(){if(obj.readyState==4){obj.parentNode.removeChild(obj);}
else{setTimeout(arguments.callee,10);}})();}
createSWF(att,par,replaceElemIdStr);}}
function displayAltContent(obj){if(ua.ie&&ua.win&&obj.readyState!=4){var el=createElement("div");obj.parentNode.insertBefore(el,obj);el.parentNode.replaceChild(abstractAltContent(obj),el);obj.style.display="none";(function(){if(obj.readyState==4){obj.parentNode.removeChild(obj);}
else{setTimeout(arguments.callee,10);}})();}
else{obj.parentNode.replaceChild(abstractAltContent(obj),obj);}}
function abstractAltContent(obj){var ac=createElement("div");if(ua.win&&ua.ie){ac.innerHTML=obj.innerHTML;}
else{var nestedObj=obj.getElementsByTagName(OBJECT)[0];if(nestedObj){var c=nestedObj.childNodes;if(c){var cl=c.length;for(var i=0;i<cl;i++){if(!(c[i].nodeType==1&&c[i].nodeName=="PARAM")&&!(c[i].nodeType==8)){ac.appendChild(c[i].cloneNode(true));}}}}}
return ac;}
function createSWF(attObj,parObj,id){var r,el=getElementById(id);if(ua.wk&&ua.wk<312){return r;}
if(el){if(typeof attObj.id==UNDEF){attObj.id=id;}
if(ua.ie&&ua.win){var att="";for(var i in attObj){if(attObj[i]!=Object.prototype[i]){if(i.toLowerCase()=="data"){parObj.movie=attObj[i];}
else if(i.toLowerCase()=="styleclass"){att+=' class="'+attObj[i]+'"';}
else if(i.toLowerCase()!="classid"){att+=' '+i+'="'+attObj[i]+'"';}}}
var par="";for(var j in parObj){if(parObj[j]!=Object.prototype[j]){par+='<param name="'+j+'" value="'+parObj[j]+'" />';}}
el.outerHTML='<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"'+att+'>'+par+'</object>';objIdArr[objIdArr.length]=attObj.id;r=getElementById(attObj.id);}
else{var o=createElement(OBJECT);o.setAttribute("type",FLASH_MIME_TYPE);for(var m in attObj){if(attObj[m]!=Object.prototype[m]){if(m.toLowerCase()=="styleclass"){o.setAttribute("class",attObj[m]);}
else if(m.toLowerCase()!="classid"){o.setAttribute(m,attObj[m]);}}}
for(var n in parObj){if(parObj[n]!=Object.prototype[n]&&n.toLowerCase()!="movie"){createObjParam(o,n,parObj[n]);}}
el.parentNode.replaceChild(o,el);r=o;}}
return r;}
function createObjParam(el,pName,pValue){var p=createElement("param");p.setAttribute("name",pName);p.setAttribute("value",pValue);el.appendChild(p);}
function removeSWF(id){var obj=getElementById(id);if(obj&&obj.nodeName=="OBJECT"){if(ua.ie&&ua.win){obj.style.display="none";(function(){if(obj.readyState==4){removeObjectInIE(id);}
else{setTimeout(arguments.callee,10);}})();}
else{obj.parentNode.removeChild(obj);}}}
function removeObjectInIE(id){var obj=getElementById(id);if(obj){for(var i in obj){if(typeof obj[i]=="function"){obj[i]=null;}}
obj.parentNode.removeChild(obj);}}
function getElementById(id){var el=null;try{el=doc.getElementById(id);}
catch(e){}
return el;}
function createElement(el){return doc.createElement(el);}
function addListener(target,eventType,fn){target.attachEvent(eventType,fn);listenersArr[listenersArr.length]=[target,eventType,fn];}
function hasPlayerVersion(rv){var pv=ua.pv,v=rv.split(".");v[0]=parseInt(v[0],10);v[1]=parseInt(v[1],10)||0;v[2]=parseInt(v[2],10)||0;return(pv[0]>v[0]||(pv[0]==v[0]&&pv[1]>v[1])||(pv[0]==v[0]&&pv[1]==v[1]&&pv[2]>=v[2]))?true:false;}
function createCSS(sel,decl,media,newStyle){if(ua.ie&&ua.mac){return;}
var h=doc.getElementsByTagName("head")[0];if(!h){return;}
var m=(media&&typeof media=="string")?media:"screen";if(newStyle){dynamicStylesheet=null;dynamicStylesheetMedia=null;}
if(!dynamicStylesheet||dynamicStylesheetMedia!=m){var s=createElement("style");s.setAttribute("type","text/css");s.setAttribute("media",m);dynamicStylesheet=h.appendChild(s);if(ua.ie&&ua.win&&typeof doc.styleSheets!=UNDEF&&doc.styleSheets.length>0){dynamicStylesheet=doc.styleSheets[doc.styleSheets.length-1];}
dynamicStylesheetMedia=m;}
if(ua.ie&&ua.win){if(dynamicStylesheet&&typeof dynamicStylesheet.addRule==OBJECT){dynamicStylesheet.addRule(sel,decl);}}
else{if(dynamicStylesheet&&typeof doc.createTextNode!=UNDEF){dynamicStylesheet.appendChild(doc.createTextNode(sel+" {"+decl+"}"));}}}
function setVisibility(id,isVisible){if(!autoHideShow){return;}
var v=isVisible?"visible":"hidden";if(isDomLoaded&&getElementById(id)){getElementById(id).style.visibility=v;}
else{createCSS("#"+id,"visibility:"+v);}}
function urlEncodeIfNecessary(s){var regex=/[\\\"<>\.;]/;var hasBadChars=regex.exec(s)!=null;return hasBadChars&&typeof encodeURIComponent!=UNDEF?encodeURIComponent(s):s;}
var cleanup=function(){if(ua.ie&&ua.win){window.attachEvent("onunload",function(){var ll=listenersArr.length;for(var i=0;i<ll;i++){listenersArr[i][0].detachEvent(listenersArr[i][1],listenersArr[i][2]);}
var il=objIdArr.length;for(var j=0;j<il;j++){removeSWF(objIdArr[j]);}
for(var k in ua){ua[k]=null;}
ua=null;for(var l in swfobject){swfobject[l]=null;}
swfobject=null;});}}();return{registerObject:function(objectIdStr,swfVersionStr,xiSwfUrlStr,callbackFn){if(ua.w3&&objectIdStr&&swfVersionStr){var regObj={};regObj.id=objectIdStr;regObj.swfVersion=swfVersionStr;regObj.expressInstall=xiSwfUrlStr;regObj.callbackFn=callbackFn;regObjArr[regObjArr.length]=regObj;setVisibility(objectIdStr,false);}
else if(callbackFn){callbackFn({success:false,id:objectIdStr});}},getObjectById:function(objectIdStr){if(ua.w3){return getObjectById(objectIdStr);}},embedSWF:function(swfUrlStr,replaceElemIdStr,widthStr,heightStr,swfVersionStr,xiSwfUrlStr,flashvarsObj,parObj,attObj,callbackFn){var callbackObj={success:false,id:replaceElemIdStr};if(ua.w3&&!(ua.wk&&ua.wk<312)&&swfUrlStr&&replaceElemIdStr&&widthStr&&heightStr&&swfVersionStr){setVisibility(replaceElemIdStr,false);addDomLoadEvent(function(){widthStr+="";heightStr+="";var att={};if(attObj&&typeof attObj===OBJECT){for(var i in attObj){att[i]=attObj[i];}}
att.data=swfUrlStr;att.width=widthStr;att.height=heightStr;var par={};if(parObj&&typeof parObj===OBJECT){for(var j in parObj){par[j]=parObj[j];}}
if(flashvarsObj&&typeof flashvarsObj===OBJECT){for(var k in flashvarsObj){if(typeof par.flashvars!=UNDEF){par.flashvars+="&"+k+"="+flashvarsObj[k];}
else{par.flashvars=k+"="+flashvarsObj[k];}}}
if(hasPlayerVersion(swfVersionStr)){var obj=createSWF(att,par,replaceElemIdStr);if(att.id==replaceElemIdStr){setVisibility(replaceElemIdStr,true);}
callbackObj.success=true;callbackObj.ref=obj;}
else if(xiSwfUrlStr&&canExpressInstall()){att.data=xiSwfUrlStr;showExpressInstall(att,par,replaceElemIdStr,callbackFn);return;}
else{setVisibility(replaceElemIdStr,true);}
if(callbackFn){callbackFn(callbackObj);}});}
else if(callbackFn){callbackFn(callbackObj);}},switchOffAutoHideShow:function(){autoHideShow=false;},ua:ua,getFlashPlayerVersion:function(){return{major:ua.pv[0],minor:ua.pv[1],release:ua.pv[2]};},hasFlashPlayerVersion:hasPlayerVersion,createSWF:function(attObj,parObj,replaceElemIdStr){if(ua.w3){return createSWF(attObj,parObj,replaceElemIdStr);}
else{return undefined;}},showExpressInstall:function(att,par,replaceElemIdStr,callbackFn){if(ua.w3&&canExpressInstall()){showExpressInstall(att,par,replaceElemIdStr,callbackFn);}},removeSWF:function(objElemIdStr){if(ua.w3){removeSWF(objElemIdStr);}},createCSS:function(selStr,declStr,mediaStr,newStyleBoolean){if(ua.w3){createCSS(selStr,declStr,mediaStr,newStyleBoolean);}},addDomLoadEvent:addDomLoadEvent,addLoadEvent:addLoadEvent,getQueryParamValue:function(param){var q=doc.location.search||doc.location.hash;if(q){if(/\?/.test(q)){q=q.split("?")[1];}
if(param==null){return urlEncodeIfNecessary(q);}
var pairs=q.split("&");for(var i=0;i<pairs.length;i++){if(pairs[i].substring(0,pairs[i].indexOf("="))==param){return urlEncodeIfNecessary(pairs[i].substring((pairs[i].indexOf("=")+1)));}}}
return"";},expressInstallCallback:function(){if(isExpressInstallActive){var obj=getElementById(EXPRESS_INSTALL_ID);if(obj&&storedAltContent){obj.parentNode.replaceChild(storedAltContent,obj);if(storedAltContentId){setVisibility(storedAltContentId,true);if(ua.ie&&ua.win){storedAltContent.style.display="block";}}
if(storedCallbackFn){storedCallbackFn(storedCallbackObj);}}
isExpressInstallActive=false;}}};}();var BrowserDetect={init:function(){this.browser=this.searchString(this.dataBrowser)||"An unknown browser";this.version=this.searchVersion(navigator.userAgent)||this.searchVersion(navigator.appVersion)||"an unknown version";this.OS=this.searchString(this.dataOS)||"an unknown OS";},searchString:function(data){for(var i=0;i<data.length;i++){var dataString=data[i].string;var dataProp=data[i].prop;this.versionSearchString=data[i].versionSearch||data[i].identity;if(dataString){if(dataString.indexOf(data[i].subString)!=-1)
return data[i].identity;}
else if(dataProp)
return data[i].identity;}},searchVersion:function(dataString){var index=dataString.indexOf(this.versionSearchString);if(index==-1)return;return parseFloat(dataString.substring(index+this.versionSearchString.length+1));},dataBrowser:[{string:navigator.userAgent,subString:"Chrome",identity:"Chrome"},{string:navigator.userAgent,subString:"OmniWeb",versionSearch:"OmniWeb/",identity:"OmniWeb"},{string:navigator.vendor,subString:"Apple",identity:"Safari",versionSearch:"Version"},{prop:window.opera,identity:"Opera"},{string:navigator.vendor,subString:"iCab",identity:"iCab"},{string:navigator.vendor,subString:"KDE",identity:"Konqueror"},{string:navigator.userAgent,subString:"Firefox",identity:"Firefox"},{string:navigator.vendor,subString:"Camino",identity:"Camino"},{string:navigator.userAgent,subString:"Netscape",identity:"Netscape"},{string:navigator.userAgent,subString:"MSIE",identity:"Explorer",versionSearch:"MSIE"},{string:navigator.userAgent,subString:"Gecko",identity:"Mozilla",versionSearch:"rv"},{string:navigator.userAgent,subString:"Mozilla",identity:"Netscape",versionSearch:"Mozilla"}],dataOS:[{string:navigator.platform,subString:"Win",identity:"Windows"},{string:navigator.platform,subString:"Mac",identity:"Mac"},{string:navigator.userAgent,subString:"iPhone",identity:"iPhone/iPod"},{string:navigator.platform,subString:"Linux",identity:"Linux"}]};BrowserDetect.init();function front_paragraph_chop(){var aux=$("#main p");$(aux[0]).css("font-weight","bold");$(aux[0]).css("font-style","italic");var showText='(read more)';var hideText='(back)';for(var i=0;i<aux.length;i++){var counter=i+1;var divisible=counter/2;var s=divisible+'';var holder=s.split(".")
if(holder.length==2){$("#main").append("<div id='block"+i+"' class='toggle'></div>");$(aux[i]).appendTo("#block"+i);if((i==aux.length-1)&&(i!=0)){var index=i-1;$('#block'+i).append(' <a href="#" class="toggleBack">(back)</a>');}}else{var index=i-1;$(aux[i]).appendTo("#block"+index);if(i!=aux.length-1){$('#block'+index).append('<a href="#" class="toggleLink">'+showText+'</a>');}}};$('.toggle').hide();$("#block0").show();$('a.toggleLink').click(function(){$(this).html($(this).html()==hideText?showText:hideText);$('.toggle').hide();$('a.toggleLink').html(showText);$(this).parent().next('.toggle').toggle(400);return false;});$('a.toggleBack').click(function(){$(this).html($(this).html()==hideText?hideText:hideText);$('.toggle').hide();$('#block0').toggle('fast');return false;});}
function chop_front_list(){var ul=$("#main ul");var le=$("#main ul li");var showText='(read more)';var hideText='(back)';var lastfull=0;$("#main").append('<hr />');$("#main").append('<img src="/images/system/bg/front/corporate.jpg" width="197" height="22" alt="Corporate" class="static_why">');$("#main").append("<ul id='li_block0' class='toggle_li'></ul>");for(var i=0;i<le.length;i++){var counter=i+1;var divisible=counter/3;var s=divisible+'';var holder=s.split(".");if(holder.length==1){$("#main").append("<ul id='li_block"+i+"' class='toggle_li'></ul>");$(le[i]).appendTo("#li_block"+i);lastfull=i;}else{$(le[i]).appendTo("#li_block"+lastfull);x=i+2;r=x/3;var st=r+'';var link=st.split(".");if(i==le.length-1){$('#li_block'+lastfull).append(' <a href="#" class="toggleBack">(back)</a>');}else if(link.length==1){$('#li_block'+lastfull).append('<a href="#" class="toggleLink">'+showText+'</a>');}}};$('.toggle_li').hide();$("#li_block0").show();$('a.toggleLink').click(function(){$(this).html($(this).html()==hideText?showText:hideText);$('.toggle_li').hide();$('a.toggleLink').html(showText);$(this).parent().next('.toggle_li').toggle(400);return false;});$('a.toggleBack').click(function(){$(this).html($(this).html()==hideText?hideText:hideText);$('.toggle_li').hide();$('#li_block0').toggle('fast');return false;});}
function place_main_bottom(fixed){var main_height=$('#main').height();if(fixed=="false"){$('#main_bottom').css('margin-top',main_height+16);}else{$('#main_bottom').css('margin-top',main_height);}}
function set_nav_pointer(st){onfocus_forms();$('#upper_pagewrapper').css("height","133px");$("#nav_"+st+" img").addClass("active");x=$("#nav_"+st).width();y=x/2;$("#nav_"+st+" img").css("margin-left",y-10);$("#nav_"+st+" a").css("color","white");}
function nice_fonts(){Cufon.replace('li.cufon-active h2',{hover:false});Cufon.replace('h2',{fontFamily:"GarmdITC BkCn BT",color:'#818181',fontSize:"14px",hover:{color:'white'}});Cufon.replace('li.cufon-active h2',{fontFamily:"GarmdITC BkCn BT",color:'white',fontSize:"14px",});Cufon.replace('h3',{fontFamily:"GarmdITC BkCn BT",color:'#E13939',fontSize:"16px",});Cufon.replace('h1.title',{fontFamily:"GarmdITC BkCn BT",color:'#E13939',fontSize:"22px",});Cufon.replace('h5',{fontFamily:"GarmdITC BkCn BT",color:'white',fontSize:"18px",});Cufon.replace('h4',{fontFamily:"GarmdITC BkCn BT",color:'#888888',fontSize:"12px",hover:{color:'white'}});Cufon.replace('h6',{fontFamily:"GarmdITC BkCn BT",color:'#888888',fontSize:"14px",hover:{color:'white'}});}
function onfocus_forms(){$('input[type="text"]').addClass("idle");$('input[type="text"]').focus(function(){$(this).removeClass("idle").addClass("onfocus");if(this.value==this.defaultValue){this.value='';}
if(this.value!=this.defaultValue){this.select();}});$('input[type="text"]').blur(function(){$(this).removeClass("onfocus").addClass("idle");if($.trim(this.value=='')){this.value=(this.defaultValue?this.defaultValue:'');}});}