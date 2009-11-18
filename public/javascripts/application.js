// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function load_video(){
  var flashvars = {};
		flashvars.xml = "config.xml";
		flashvars.font = "font.swf";		
		var attributes = {};
		attributes.wmode = "transparent";
		attributes.bgcolor = "#c72e42";
		attributes.id = "slider";
		swfobject.embedSWF("cu3er.swf", "cuber", "961", "359", "9", "expressInstall.swf", flashvars, attributes);
  
}

function load_image_gallery(){
  new SlideShow('listOfImages', {
     crossFade: true, 
     pauseOnMouseover: true,
     slideDuration: 8,
     transitionDuration: 1,
  });
}	
		
function test_jquery(){
  $("cuber").hide();
 

}

function mycarousel_initCallback(carousel)
{
    // Disable autoscrolling if the user clicks the prev or next button.
    carousel.buttonNext.bind('click', function() {
        carousel.startAuto(0);
    });

    carousel.buttonPrev.bind('click', function() {
        carousel.startAuto(0);
    });

    // Pause autoscrolling if the user moves with the cursor over the clip.
    carousel.clip.hover(function() {
        carousel.stopAuto();
    }, function() {
        carousel.startAuto();
    });
};


$.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

/*$(document).ready(function() {

  // UJS authenticity token fix: add the authenticy_token parameter
  // expected by any Rails POST request.
  $(document).ajaxSend(function(event, request, settings) {
    // do nothing if this is a GET request. Rails doesn't need
    // the authenticity token, and IE converts the request method
    // to POST, just because - with love from redmond.
    if (settings.type == 'GET') return;
    if (typeof(AUTH_TOKEN) == "undefined") return;
    settings.data = settings.data || "";
    settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
  });

});
*/
function front_paragraph_chop(){
  var aux = $("#main p");
  $(aux[0]).css("font-weight", "bold");		$(aux[0]).css("font-style", "italic");
  //$("#block0").show();
  //$("#main p").addClass("toggle");
  var showText='(read more)';
  var hideText='(back)';

  for (var i=0; i < aux.length; i++) {
  	var counter=i+1;
  	var divisible= counter/2;
  	var s = divisible +'';
  	var holder= s.split(".")
  	if(holder.length==2){
  		$("#main").append("<div id='block"+i+"' class='toggle'></div>");
  		$(aux[i]).appendTo("#block"+i);
  		if((i == aux.length-1)&&(i != 0)){
  	  	var index = i-1;
  		  $('#block'+i).append(' <a href="#" class="toggleBack">(back)</a>');
  		}
  	}else{
  		var index = i-1;
  		$(aux[i]).appendTo("#block"+index);
  		if(i != aux.length-1){
  		  $('#block'+index).append('<a href="#" class="toggleLink">'+showText+'</a>');
  		}
  	}

  	//alert();
  	/*$(aux[i]).appendTo()*/
  };
  // append show/hide links to the element directly preceding the element with a class of "toggle"


  // hide all of the elements with a class of 'toggle'
  $('.toggle').hide();
  $("#block0").show();
  // capture clicks on the toggle links
  $('a.toggleLink').click(function() {

  	// change the link depending on whether the element is shown or hidden
  	$(this).html ($(this).html()==hideText ? showText : hideText);

  	// toggle the display - uncomment the next line for a basic "accordion" style
  	$('.toggle').hide();$('a.toggleLink').html(showText);
  	$(this).parent().next('.toggle').toggle(400);
  
  	// return false so any link destination is not followed
  	return false;

  });
  $('a.toggleBack').click(function() {

  	// change the link depending on whether the element is shown or hidden
  	$(this).html ($(this).html()==hideText ? hideText : hideText);

  	// toggle the display - uncomment the next line for a basic "accordion" style
  	$('.toggle').hide();
    $('#block0').toggle('fast');

  	// return false so any link destination is not followed
  	return false;

    });
}

function chop_front_list(){
  var ul = $("#main ul");
  var le = $("#main ul li");
//  alert(le.length); 
  var showText='(read more)';
  var hideText='(back)';
  var lastfull = 0;
  $("#main").append('<hr />');
  $("#main").append('<img src="/images/system/bg/front/corporate.jpg" width="197" height="22" alt="Corporate" class="static_why">');
  $("#main").append("<ul id='li_block0' class='toggle_li'></ul>");
  for (var i=0; i < le.length; i++) {
  	var counter=i+1;
  	var divisible= counter/3;
  	var s = divisible +'';
  	var holder= s.split(".");
  	if(holder.length==1){
  		$("#main").append("<ul id='li_block"+i+"' class='toggle_li'></ul>");
				$(le[i]).appendTo("#li_block"+i);
  		lastfull = i;
  	}else{
  	  	$(le[i]).appendTo("#li_block"+lastfull);
  	  	x = i +2;
  	  	r = x/3;
  	  	var st = r +'';
  	  	var link = st.split(".");
  	  	
  	  	if(i==le.length-1){
  	  	  $('#li_block'+lastfull).append(' <a href="#" class="toggleBack">(back)</a>');
  	  	}else if(link.length==1){
  	  	   $('#li_block'+lastfull).append('<a href="#" class="toggleLink">'+showText+'</a>');
  	  	}
  	}

  };
  $('.toggle_li').hide();
  $("#li_block0").show();
  
  $('a.toggleLink').click(function() {

  	// change the link depending on whether the element is shown or hidden
  	$(this).html ($(this).html()==hideText ? showText : hideText);

  	// toggle the display - uncomment the next line for a basic "accordion" style
  	$('.toggle_li').hide();$('a.toggleLink').html(showText);
  	$(this).parent().next('.toggle_li').toggle(400);
  
  	// return false so any link destination is not followed
  	return false;

  });
  $('a.toggleBack').click(function() {

  	// change the link depending on whether the element is shown or hidden
  	$(this).html ($(this).html()==hideText ? hideText : hideText);

  	// toggle the display - uncomment the next line for a basic "accordion" style
  	$('.toggle_li').hide();
    $('#li_block0').toggle('fast');

  	// return false so any link destination is not followed
  	return false;

    });
}

function place_main_bottom(fixed){
  var main_height= $('#main').height();
  if (fixed == "false"){
  	$('#main_bottom').css('margin-top',main_height+16);  
  }else{
    $('#main_bottom').css('margin-top',main_height);  
  }
 	
}

function set_nav_pointer(st){
  onfocus_forms();
  	$('#upper_pagewrapper').css("height","133px"); 
		$("#nav_"+st+" img").addClass("active");
		x = $("#nav_"+st).width();
		y= x/2;
		$("#nav_"+st+" img").css("margin-left",y-10);
		$("#nav_"+st+" a").css("color","white");
}

function nice_fonts(){
  	Cufon.replace('li.cufon-active h2', {
		  hover: false
	 });
	
	
	Cufon.replace('h2', {
		   fontFamily: "GarmdITC BkCn BT",
		   color: '#818181',
		   fontSize: "14px",
		   hover: {
		   		color: 'white'
		   }
	 });


  	Cufon.replace('li.cufon-active h2', {
		  fontFamily: "GarmdITC BkCn BT",
		  color: 'white',
		  fontSize: "14px",
	 });
    
  Cufon.replace('h3', {
	  fontFamily: "GarmdITC BkCn BT",
	  color: '#E13939',
	  fontSize: "16px",
 });
  Cufon.replace('h1', {
	  fontFamily: "GarmdITC BkCn BT",
	  color: '#E13939',
	  fontSize: "16px",
 });

  Cufon.replace('h4', {
	  fontFamily: "GarmdITC BkCn BT",
	  color: '#888888',
	  fontSize: "12px",
    hover: {
     		color: 'white'
     }
 });
  Cufon.replace('h6', {
	  fontFamily: "GarmdITC BkCn BT",
	  color: '#888888',
	  fontSize: "14px",
    hover: {
     		color: 'white'
     }
 });
 
}

function onfocus_forms(){

      $('input[type="text"]').addClass("idle");  
      $('input[type="text"]').focus(function() {  
          $(this).removeClass("idle").addClass("onfocus");  
          if (this.value == this.defaultValue){  
              this.value = '';  
          }  
          if(this.value != this.defaultValue){  
              this.select();  
          }  
      });  
      $('input[type="text"]').blur(function() {  
          $(this).removeClass("onfocus").addClass("idle");  
          if ($.trim(this.value == '')){  
              this.value = (this.defaultValue ? this.defaultValue : '');  
          }  
      });  

}
