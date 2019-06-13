import SmoothScroll from 'smooth-scroll'

const initSmoothScroll = () => {
  var scroll = new SmoothScroll('[data-easing="easeInOutQuint"]', {
    easing: 'easeInOutQuint',
    speed: 3000,
  });
}

export default initSmoothScroll
