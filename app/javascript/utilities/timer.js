document.addEventListener('turbolinks:load', function() {

  var timerSelector = document.querySelector('.timer')

  if (timerSelector) {
    timer = timerSelector.dataset.timer
    function startTime() {
      if (timer > 60) {
        timerSelector.innerHTML = 'Deadline: ' + Math.round(timer/60) + ' minutes'
      } else
      if (timer < 60 && timer > 0) {
        timerSelector.innerHTML = 'Deadline: ' + Math.round(timer) + ' seconds'
      } else
      if (timer <= 0) {
        window.location.href = window.location.href + '/result'
        return
      }
      setTimeout(startTime, 1000);
      timer --
    }
    startTime();
  }
})
