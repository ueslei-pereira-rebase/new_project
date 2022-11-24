$(function() {
  // $('#cadastrar').on('click', function() {
  //   $('.field-error').fadeOut(300).delay(3000).fadeIn( 700 )

  // });


  // (function() {
  //   this.App || (this.App = {});
  
  //   App.cable = ActionCable.createConsumer();
  
  // }).call(this);
  if ($('.alert, .alert-danger, .alert-info').length) {
    $('.alert-danger, .alert-info').fadeIn( 3000 ).delay(1000).fadeOut(3000)
  }

  const KEYCODE = {
    A: 0
  }

  $(window).keydown(function (e) {
    if (e.code == 'CapsLock')  {
      $('.capslock-off').toggleClass('capslock-on');
    }
  });

  $("#submit-search").click(function(){
    valor =  ($(".form-control").val())
    if (valor === ''){
      return false
    }
  })

  $("#my-adv-false").click(function(){
    searchIsBlank();
    return false
  })

  
  $("#my-list-false").click(function(){
    searchIsBlank();
    return false
  })

  $(".card-advertise-false").click(function(){
    searchIsBlank();
    return false
  })

  $("#create-adv-false").click(function(){
    searchIsBlank();
    return false
  })


  $("#step-1-2").click(function(){
    if ($('#title').val() === ""){
      alertTipTitle ();
      return false
    }
    $(".step-one").delay(600).fadeOut();
    $(".step-two").delay(1100).fadeIn();
    return false
  })

  function alertTipTitle(){
    $('.tip-title').fadeIn();
    $('.tip-title').delay(1000).fadeOut(3000);
  }

  $("#step-2-3").click(function(){
    if ($('#description').val() === ""){
      alertTipDescription();
      return false
    }
    $(".step-two").delay(600).fadeOut();
    $(".step-three").delay(1100).fadeIn();
    return false
  })

  function alertTipDescription(){
    $('.tip-title').fadeIn();
    $('.tip-title').delay(1000).fadeOut(3000);
  }

  $("#step-4").click(function(){
    if (alertTipList() || alertTipPrice()){
      return false
    }

    $(".step-three").delay(600).fadeOut();
    $(".step-four").delay(1100).fadeIn();
    return false
  })

  $(".step-finish").click(function(){
    $(".step-four").hide();
    $("#loading").fadeIn();
    $("#loading").delay(4000).fadeOut();
    $(".finish").delay(5000).fadeIn();
  })

  function alertTipList(){
    if ($('#list').val() === "" || $('#list').val() === "") {
      $('.tip-list').fadeIn();
      $('.tip-list').delay(1000).fadeOut(3000);
      return true
    }
    return false

  }

  function alertTipPrice(){
    if ($('#price').val() === "" || $('#price').val() === "") {
      $('.tip-price').fadeIn();
      $('.tip-price').delay(1000).fadeOut(3000)
      return true
    }
    return false
;
  }

  $("#step-4-3").click(function(){
    $(".step-four").delay(600).fadeOut();
    $(".step-three").delay(1100).fadeIn();
    return false
  })

  $("#step-3-2").click(function(){
    $(".step-three").delay(600).fadeOut();
    $(".step-two").delay(1100).fadeIn();
    return false
  })

  $("#step-1").click(function(){
    $(".step-two").delay(600).fadeOut();
    $(".step-one").delay(1100).fadeIn();
    return false
  })

  function searchIsBlank() {
    $( ".alert-error-minutes" ).slideUp( 500 ).fadeIn( 400 ).delay(1000).fadeOut(800)
    $(".profile-icon").toggleClass('alert-profile-inactive')

  }

  // var chat = document.getElementById('box-messages');
  //  chat.scrollTop = chat.scrollHeight - chat.clientHeight;

  // $("#CPF").keypress(function (e) {
  //   $('#CPF').mask('000.000.000-00');
  //   $('#CNPJ').mask('00.000.000/0000-00');
  // });

  
  $('#enviar-msg').click(function(){
    setTimeout(
      function() 
      {
        var chat = document.getElementById('box-messages');
        chat.scrollTop = chat.scrollHeight - chat.clientHeight;
        $("#myform").trigger("reset");
      }, 300);

  })
  


  // $("#title").keypress(function (e) {
  //   if (e.keyCode > 0 || e.keyCode < 249 ) {
  //     $('#step-1-2').css("opacity","1")
  //     }
  // });
});

// direct_uploads.js

// addEventListener("direct-upload:initialize", event => {
//   const { target, detail } = event
//   const { id, file } = detail
//   target.insertAdjacentHTML("beforebegin", `
//     <div id="direct-upload-${id}" class="direct-upload direct-upload--pending">
//       <div id="direct-upload-progress-${id}" class="direct-upload__progress" style="width: 0%"></div>
//       <span class="direct-upload__filename"></span>
//     </div>
//   `)
//   target.previousElementSibling.querySelector(`.direct-upload__filename`).textContent = file.name
// })

// addEventListener("direct-upload:start", event => {
//   const { id } = event.detail
//   const element = document.getElementById(`direct-upload-${id}`)
//   element.classList.remove("direct-upload--pending")
// })

// addEventListener("direct-upload:progress", event => {
//   const { id, progress } = event.detail
//   const progressElement = document.getElementById(`direct-upload-progress-${id}`)
//   progressElement.style.width = `${progress}%`
// })

// addEventListener("direct-upload:error", event => {
//   event.preventDefault()
//   const { id, error } = event.detail
//   const element = document.getElementById(`direct-upload-${id}`)
//   element.classList.add("direct-upload--error")
//   element.setAttribute("title", error)
// })

// addEventListener("direct-upload:end", event => {
//   const { id } = event.detail
//   const element = document.getElementById(`direct-upload-${id}`)
//   element.classList.add("direct-upload--complete")
// })

