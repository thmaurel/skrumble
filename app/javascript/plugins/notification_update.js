const updateNotif = () => {
  const accept = document.querySelector('#accept-btn');
  const decline = document.querySelector('.decline-btn');
  const dropdown = document.querySelector('.content-notif');

  if (accept){
    accept.addEventListener('click', () => {
      const bulle = document.querySelector('#bulle');
      const id = dropdown.dataset.id;
      const url = window.location.pathname;
      const count =  document.querySelector('.notif-count');
      count.innerText = parseInt(count.innerText) - 1;
      if (url.includes(id)) {
        dropdown.remove();
      }
      console.log(count.innerText);
      if (count.innerText == 0 ){
        bulle.remove();
      }
    });
  }
  if (decline){
    decline.addEventListener('click', () => {
      const bulle = document.querySelector('#bulle');
      const id = dropdown.dataset.id;
      const url = window.location.pathname;
      const count =  document.querySelector('.notif-count');
      count.innerText = parseInt(count.innerText) - 1;
      if (url.includes(id)) {
        dropdown.remove();
      }
      console.log(count.innerText);
      if (count.innerText == 0 ){
        bulle.remove();
      }
    });
  }
}
export default updateNotif;
