import { Spinner } from 'spin.js';

const initSpin = () => {
  const title = document.getElementById('home-title');
  const lasttitle = document.getElementById('last-title');
  const form = document.querySelector('.home-title #new_trip');
  const toucan = document.getElementById('toucan');
  if (form) {
    form.addEventListener('submit', (e) => {
    e.preventDefault();
    form.style.display="none";
    title.style.display="none";
    lasttitle.style.display="none";
    title.parentElement.classList.remove('justify-content-center');
    toucan.style.display="flex";
    const target = document.querySelector('#spinner');
    const opts = {
      lines: 13, // The number of lines to draw
      length: 38, // The length of each line
      width: 17, // The line thickness
      radius: 70, // The radius of the inner circle
      scale: 0.7, // Scales overall size of the spinner
      corners: 1, // Corner roundness (0..1)
      color: '#ffffff', // CSS color or array of colors
      fadeColor: 'transparent', // CSS color or array of colors
      speed: 1, // Rounds per second
      rotate: 0, // The rotation offset
      animation: 'spinner-line-fade-quick', // The CSS animation name for the lines
      direction: 1, // 1: clockwise, -1: counterclockwise
      zIndex: 2e9, // The z-index (defaults to 2000000000)
      className: 'spinner', // The CSS class to assign to the spinner
      // top: '0%', // Top position relative to parent
      // left: '0%', // Left position relative to parent
      shadow: '0 0 1px transparent', // Box-shadow for the lines
      position: 'absolute' // Element positioning
     };
    const spinner = new Spinner(opts).spin(target);
    setTimeout(() => {
      spinner.stop();
      form.submit();
     }, 2000);;
    });
  }
}


// ecouter le submit du form
// preventDefault du submit du form
// initlespinner
// arrëter au bout de pour 5 secondes
// Ensuite, redigirer vers l'action #create du trips_controller

export default initSpin;
