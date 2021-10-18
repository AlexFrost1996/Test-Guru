document.addEventListener('turbolinks:load', function() {
  var password = document.getElementById('user_password')
  var password_confirmation = document.getElementById('user_password_confirmation')

  if (password != null && password_confirmation != null) { 
    password.addEventListener('input', showNotification)  
    password_confirmation.addEventListener('input', showNotification) 
  }
})

function showNotification (){

  var password = document.getElementById('user_password').value
  var password_confirmation = document.getElementById('user_password_confirmation').value
  var icon = document.querySelector('.octicon-check')
  if (password_confirmation == ""){
    icon.classList.add('no-confirmation')
    icon.classList.add('hide')
    return
  } 
  if (password === password_confirmation) {
    icon.classList.remove('no-confirmation')
    icon.classList.remove('hide')

  } else {
    icon.classList.add('no-confirmation')
    icon.classList.remove('hide')
  }
} 
