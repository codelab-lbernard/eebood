var windowWidth;
var windowHeight;

var canvasWid;
var canvasHei;

var toolbarHei = $("#toolbar").height();
var editor;

var isRunning = false;
var hasSideBar = true;


// error handler

window.onerror = function(msg, url, linenumber) {
  console.log('You have an error in your code: '+msg);
  return true;
}

/*this.displayMsg = function(msg){
    document.querySelector('#output').innerHTML += msg;
}*/


$(document).ready(function(){

  // ascii text site:
  // http://patorjk.com/software/taag/#p=display&f=Boie2&t=Hello%20World


  ////////////
  // VARS
  ////////////




  ////////////
  // SETUP PJS
  ////////////



  process_run = '';

  $("#play_button").click(function(){
    process_this();


  });
  $("#stop_button").click(function(){
    stop_this();

  });




  $("a[href='#top']").click(function() {
    $("html, body").animate({ scrollTop: 0 }, "slow");
    return false;
  });

  $(document).keyup(function(e) {
    if (e.keyCode == 27) { stop_this(); }   // esc
  });


  function process_this() {
    if (typeof process_run == 'object') {
      process_run.exit();

    }
    var script_text = editor.getValue();
    var canvas = document.getElementById('p5Window');
    if (process_run) {

      process_run.exit();
    }
    if (script_text) {
      process_run =  new Processing(canvas, script_text);
    }
    onWindowResize();
    showCanvas();

    $("#stop_button").removeClass("disabledButton");
    $("#save_button").removeClass("disabledButton");
    isRunning = true;
  }

  function stop_this(){
    if (typeof process_run == 'object') {
        process_run.exit();
        var canvas = document.getElementById('p5Window');
        var context = canvas.getContext('2d');
        context.clearRect(0, 0, canvas.width, canvas.height);
      }

      onWindowResize();
      hideCanvas();

      $("#stop_button").addClass("disabledButton");
      $("#save_button").addClass("disabledButton");
      isRunning = false;
  }



  Processing.log = function(msg) {
    //console.log("Processing.js log: " + msg);
    document.getElementById("output").innerHTML += msg + "<br>";
  }

  Processing.warning = function(msg) {
    alert("error!");
    console.warning("Processing.js warning: " + msg);
  }

  Processing.error = function(msg) {
    alert("error!");
    console.error("Processing.js error: " + msg);
  }

  ////////////////////////
  // SETUP DOCUMENT
  ////////////////////////
  onWindowResize();
  hideCanvas();

  $(window).resize(function(){
    onWindowResize();
  });

  function onWindowResize(){
    windowWidth = $(window).width();
    windowHeight = $(window).height();
    updateWrapperSize();
  }


  function showCanvas(){
    $("#canvasWrapper").show();

    canvasWid = $("#p5Window").width();
    canvasHei = $("#p5Window").height();

    $("#canvasWrapper").width(canvasWid);
    $("#canvasWrapper").height(canvasHei);

    $("#canvasWrapper").css("margin-left",-canvasWid/2);
    $("#canvasWrapper").css("margin-top",-canvasHei/2);
    $("#overlay").show();
  }

  function hideCanvas(){
    $("#canvasWrapper").hide();
    $("#overlay").hide();
  }


  $(window).keydown(function(event) {
    if(event.ctrlKey && event.keyCode == 49) {
      console.log("Hey! Ctrl+T event captured!");
      event.preventDefault();
      stop_this();

    }
    if(event.ctrlKey && event.keyCode == 83) {
      console.log("Hey! Ctrl+S event captured!");
      event.preventDefault();
      process_this();
    }

    updateWrapperSize();
  });


  function updateWrapperSize(){
    var winHeight = Math.max( $(".CodeMirror").height() ,  $(window).height() - 65);
    $("#wrapper").height(winHeight);
  }


  $(window).scroll(function(){
    onWindowScroll();
  });

  function onWindowScroll(){

  }

  $("#play_button").hover(function(){
      $("#tooltip").html("Run sketch");
  },function(){
      $("#tooltip").html("");
  });

  $("#stop_button").hover(function(){
      $("#tooltip").html("Stop sketch");
  },function(){
      $("#tooltip").html("");
  });

  $("#ref_button").hover(function(){
      $("#tooltip").html("Open reference");
  },function(){
      $("#tooltip").html("");
  });

  $("#new_button").hover(function(){
      $("#tooltip").html("Open New Tab");
  },function(){
      $("#tooltip").html("");
  });

  $("#save_button").hover(function(){
      $("#tooltip").html("Save as image");
  },function(){
      $("#tooltip").html("");
  });

  $("#help_button").hover(function(){
      $("#tooltip").html("Help");
  },function(){
      $("#tooltip").html("");
  });

  $("#sideBar_button").hover(function(){
      $("#tooltip").html("Sidebar");
  },function(){
      $("#tooltip").html("");
  });


   $("#sideBar_button").click(function(){
       if(hasSideBar){
          hideSideBar();
          hasSideBar = false;
       }else{
          showSideBar();
          hasSideBar = true;
       }

   });

  function hideSideBar(){
    $("nav.sideBar").animate({
      left:"-202px"
      }, 200, "swing", function() {
        // onComplete
    });

    $("section#code").animate({
      marginLeft:"1px"
      }, 200, "swing", function() {
        // onComplete
    });
  }

  function showSideBar(){
    $("nav.sideBar").animate({
      left:"0px"
      }, 200, "swing", function() {
        // onComplete
    });

    $("section#code").animate({
      marginLeft:"202px"
      }, 200, "swing", function() {
        // onComplete
    });
  }




  ////////////////////////
  // LOAD DOCUMENTS
  ////////////////////////

  $(".file").click(function(event){
    event.preventDefault();
    var path = $(this).attr("href");
    readFile(path);
    $(".file").removeClass("currentFile");
    $(this).addClass("currentFile");
  });


  readFile("sketches/readme.txt");

  function readFile(filename) {

      $.ajax({
         url : filename,
         dataType: "text",
         success : function (data) {
             //$("#code").val(data);
             editor.setValue(data);
             updateWrapperSize();
         }
      });


  }



  ////////////////////////
  // SETUP CODEMIRROR
  ////////////////////////
  setupCodeMirror();

  function setupCodeMirror(){
    editor = CodeMirror.fromTextArea(document.getElementById("txt"), {
      lineNumbers: true,
      matchBrackets: true,
      mode: "text/x-csrc"
    });

    editor.setOption("theme", "monokai");// monokai  solarized dark
  }




});



function saveImage(returnType) {
  if(!isRunning){
    return;
  }
  var dataURL = document.getElementById('p5Window').toDataURL("image/png");

  // The returnType argument specifies how to get the
  // the image.  'obj' will set the source to an image element.
  // 'window' will open a new window and display the image.
  // 'download' will prompt the user to save the image.
  switch(returnType) {
    case 'obj':
      var imgObj = new Image();
      imgObj.src = dataURL;
      document.getElementById('graphics').appendChild(imgObj);
      break;
    case 'window':
      window.open(dataURL, "Canvas Image");
      break;
    case 'download':
      dataURL = dataURL.replace("image/png", "image/octet-stream");
      document.location.href = dataURL;
      break;
  }
}
