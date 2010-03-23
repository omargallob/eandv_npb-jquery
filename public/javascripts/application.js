// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

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
				$(le[i]).appendTo("#li_block"+0);
  };
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
		
		$("#nav_"+st+" a").css("color","white");

		if(($.browser.msie)&&(($.browser.version == "7.0")||($.browser.version == "6.0"))){
			$("#nav_"+st+" img").css("margin-left",-y-10);
		}else{
	
			if(x > 120){
				z = 30;
			}
			else if (x < 70){
				z=15;
			}
			else{
				z = 20;
			}
			$("#nav_"+st+" img").css("margin-left",y-z);
		}
		
		
}

function nice_fonts(){


  	Cufon.replace('li.cufon-active h2', {
		  hover: false
	 });
	
	
	Cufon.replace('h2.title', {
		   fontFamily: "GarmdITC BkCn BT",
		   color: '#818181',
		   fontSize: "14px",
  		 hover: {
	   	 color: '#E13939'
	   }
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
		  fontSize: "14px"
	 });
    
  Cufon.replace('h3 span.title', {
	  fontFamily: "GarmdITC BkCn BT",
	  color: '#E13939',
	  fontSize: "16px",
	  hover: {
	   		color: '#888888'
	   }
 });
  Cufon.replace('h3 span.inactive', {
	  fontFamily: "GarmdITC BkCn BT",
	  color: '#888888',
	  fontSize: "16px",
	  hover: {
	   		color: '#E13939'
	   }
 });

  Cufon.replace('h3 strong', {
	  fontFamily: "GarmdITC BkCn BT",
	  color: '#888888',
	  fontSize: "16px"
 });
  Cufon.replace('#main h3', {
	  fontFamily: "GarmdITC BkCn BT",
	  color: '#E13939',
	  fontSize: "20px"
 });
  Cufon.replace('.featured h3', {
	  fontFamily: "GarmdITC BkCn BT",
	  color: 'white',
	  fontSize: "20px"
 });
  Cufon.replace('h1.title', {
	  fontFamily: "GarmdITC BkCn BT",
	  color: '#E13939',
	  fontSize: "22px"
 });
  Cufon.replace('h1.services', {
	  fontFamily: "GarmdITC BkCn BT",
	  color: '#E13939',
	  fontSize: "22px"
 });
  Cufon.replace('h1.title span', {
	  fontFamily: "GarmdITC BkCn BT",
		color: '#888888',
		fontSize: "22px",
		hover: {
		 		color: '#E13939'
		 }
 });
  Cufon.replace('.featured h1.title', {
	  fontFamily: "GarmdITC BkCn BT",
	  color: 'white',
	  fontSize: "22px"
 });
  Cufon.replace('h5', {
	  fontFamily: "GarmdITC BkCn BT",
	  color: 'white',
	  fontSize: "18px"
 });

  Cufon.replace('h4', {
	  fontFamily: "GarmdITC BkCn BT",
	  color: '#888888',
	  fontSize: "12px",
    hover: {
     		color: 'white'
     }
 });
  Cufon.replace('#main h4', {
	  fontFamily: "GarmdITC BkCn BT",
	  color: '#888888',
	  fontSize: "18px"
 });
  Cufon.replace('h6', {
	  fontFamily: "GarmdITC BkCn BT",
	  color: '#888888',
	  fontSize: "14px",
    hover: {
     		color: '#E13939'
     }
 });
  Cufon.replace('#telephone p', {
	  fontFamily: "GarmdITC BkCn BT",
	  color: '#4d4d4d',
	  fontSize: "18px",
    hover: {
     		color: '#E13939'
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

function override_search_submit(){


  $("#Selectable").submit(function () {
    
    var aux = $("#Selectable").serialize();
    //alert(aux);
    //$.post($(this).attr("action"),aux, null, "script");
     return true;
  });

}

jQuery.fn.filter_options = function() {
  jQuery.ajaxSetup({ 
     'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
   });
  

  jQuery.fn.pickup_active_filter = function() {
    active_filters = $("#view_options li a.active");
    var params ="";
    for (var i=0; i < active_filters.length; i++) { 
     params += "&active="+$(active_filters[i]).text();
    };
    return params;
  };

  jQuery.fn.pickup_active_sort = function() {
    active_filters = $("#view_options li.active");
    var params ="";
    for (var i=0; i < active_filters.length; i++) { 
     params += "&active="+$(active_filters[i]).text()+"&search_query[order]="+$("#"+$(active_filters[i]).text()+"_order").text();
    };
    return params;
  };


  jQuery.fn.pickup_search_query = function(){
    active_search = $("#search_options li");
    var params ="";
    for (var i=0; i < active_search.length; i++) {
        if ($(active_search[i]).text() != ""){
         params += "&search_query["+active_search[i].id+"]="+$(active_search[i]).text(); 
        }
    };
  return params;
  }
  
};



