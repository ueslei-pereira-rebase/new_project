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

  function searchIsBlank() {
    $( ".alert-error-minutes" ).slideUp( 500 ).fadeIn( 400 ).delay(1000).fadeOut(800)
    $(".profile-icon").toggleClass('alert-profile-inactive')

  }
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

