document.addEventListener('turbolinks:load', function() {

  var progressBar = document.querySelector('.progress-bar')

  if (progressBar) {
    var currentTest = progressBar.dataset.currentTest - 1
    var allTests = progressBar.dataset.allTests

    var progressBarPercent = document.querySelector('.progress-bar_percent')
    var percent = Math.round((currentTest * 100 / allTests)).toString() + '%'
    progressBarPercent.innerHTML = percent

    progressBar.style.width = percent
    if (currentTest == 0) {
      progressBarPercent.classList.add('nil-percent')
    }
  }

})
