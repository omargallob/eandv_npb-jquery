function front_paragraph_chop(){var aux=$("#main p");$(aux[0]).css("font-weight","bold");$(aux[0]).css("font-style","italic");var showText='(read more)';var hideText='(back)';for(var i=0;i<aux.length;i++){var counter=i+1;var divisible=counter/2;var s=divisible+'';var holder=s.split(".")
if(holder.length==2){$("#main").append("<div id='block"+i+"' class='toggle'></div>");$(aux[i]).appendTo("#block"+i);if((i==aux.length-1)&&(i!=0)){var index=i-1;$('#block'+i).append(' <a href="#" class="toggleBack">(back)</a>');}}else{var index=i-1;$(aux[i]).appendTo("#block"+index);if(i!=aux.length-1){$('#block'+index).append('<a href="#" class="toggleLink">'+showText+'</a>');}}};$('.toggle').hide();$("#block0").show();$('a.toggleLink').click(function(){$(this).html($(this).html()==hideText?showText:hideText);$('.toggle').hide();$('a.toggleLink').html(showText);$(this).parent().next('.toggle').toggle(400);return false;});$('a.toggleBack').click(function(){$(this).html($(this).html()==hideText?hideText:hideText);$('.toggle').hide();$('#block0').toggle('fast');return false;});}
function chop_front_list(){var ul=$("#main ul");var le=$("#main ul li");var showText='(read more)';var hideText='(back)';var lastfull=0;$("#main").append('<hr />');$("#main").append('<img src="/images/system/bg/front/corporate.jpg" width="197" height="22" alt="Corporate" class="static_why">');$("#main").append("<ul id='li_block0' class='toggle_li'></ul>");for(var i=0;i<le.length;i++){var counter=i+1;var divisible=counter/3;var s=divisible+'';var holder=s.split(".");if(holder.length==1){$("#main").append("<ul id='li_block"+i+"' class='toggle_li'></ul>");$(le[i]).appendTo("#li_block"+i);lastfull=i;}else{$(le[i]).appendTo("#li_block"+lastfull);x=i+2;r=x/3;var st=r+'';var link=st.split(".");if(i==le.length-1){$('#li_block'+lastfull).append(' <a href="#" class="toggleBack">(back)</a>');}else if(link.length==1){$('#li_block'+lastfull).append('<a href="#" class="toggleLink">'+showText+'</a>');}}};$('.toggle_li').hide();$("#li_block0").show();$('a.toggleLink').click(function(){$(this).html($(this).html()==hideText?showText:hideText);$('.toggle_li').hide();$('a.toggleLink').html(showText);$(this).parent().next('.toggle_li').toggle(400);return false;});$('a.toggleBack').click(function(){$(this).html($(this).html()==hideText?hideText:hideText);$('.toggle_li').hide();$('#li_block0').toggle('fast');return false;});}
function place_main_bottom(fixed){var main_height=$('#main').height();if(fixed=="false"){$('#main_bottom').css('margin-top',main_height+16);}else{$('#main_bottom').css('margin-top',main_height);}}
function set_nav_pointer(st){onfocus_forms();$('#upper_pagewrapper').css("height","133px");$("#nav_"+st+" img").addClass("active");x=$("#nav_"+st).width();y=x/2;$("#nav_"+st+" img").css("margin-left",y-10);$("#nav_"+st+" a").css("color","white");}
function nice_fonts(){Cufon.replace('li.cufon-active h2',{hover:false});Cufon.replace('h2',{fontFamily:"GarmdITC BkCn BT",color:'#818181',fontSize:"14px",hover:{color:'white'}});Cufon.replace('li.cufon-active h2',{fontFamily:"GarmdITC BkCn BT",color:'white',fontSize:"14px",});Cufon.replace('h3',{fontFamily:"GarmdITC BkCn BT",color:'#E13939',fontSize:"16px",});Cufon.replace('h1.title',{fontFamily:"GarmdITC BkCn BT",color:'#E13939',fontSize:"22px",});Cufon.replace('h5',{fontFamily:"GarmdITC BkCn BT",color:'white',fontSize:"18px",});Cufon.replace('h4',{fontFamily:"GarmdITC BkCn BT",color:'#888888',fontSize:"12px",hover:{color:'white'}});Cufon.replace('h6',{fontFamily:"GarmdITC BkCn BT",color:'#888888',fontSize:"14px",hover:{color:'white'}});}
function onfocus_forms(){$('input[type="text"]').addClass("idle");$('input[type="text"]').focus(function(){$(this).removeClass("idle").addClass("onfocus");if(this.value==this.defaultValue){this.value='';}
if(this.value!=this.defaultValue){this.select();}});$('input[type="text"]').blur(function(){$(this).removeClass("onfocus").addClass("idle");if($.trim(this.value=='')){this.value=(this.defaultValue?this.defaultValue:'');}});}