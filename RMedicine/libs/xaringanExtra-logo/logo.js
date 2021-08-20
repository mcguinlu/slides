(function () {
  let tries = 0
  function addLogo () {
    if (typeof slideshow === 'undefined') {
      tries += 1
      if (tries < 10) {
        setTimeout(addLogo, 100)
      }
    } else {
      document.querySelectorAll('.remark-slide-content:not(.title-slide):not(.inverse):not(.hide_logo)')
        .forEach(function (slide) {
          const logo = document.createElement('div')
          logo.classList = 'xaringan-extra-logo'
          logo.href = null
          slide.appendChild(logo)
        })
    }
  }
  document.addEventListener('DOMContentLoaded', addLogo)
})()