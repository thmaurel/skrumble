const initCollapsible = () => {
  const coll = document.querySelectorAll(".collapsible");
  let i;
  if (coll){
    for (i = 0; i < coll.length; i++) {
      coll[i].addEventListener("mouseover", function() {
        this.classList.toggle("active");
        let eventId = this.nextElementSibling.dataset.idEvent;
        collapse(eventId);
      });
    }
  }
}

const collapse = (id) => {
  let content = document.querySelector(`.eventItem[data-id-event='${id}']`);
  content.classList.add = "red";
  console.log(content)
  if (content.style.display === "block") {
    content.style.display = "none";
  } else {
    const items = document.querySelectorAll(".eventItem");
    items.forEach((item) => {
      item.style.display = "none";
      // item.parentElement.classList.remove("card-open");
      item.parentElement.classList.add("card-closed");
    })
    content.style.display = "block";
    content.parentElement.classList.remove("card-closed")
    content.parentElement.classList.add("card-open");
  }
}

export default initCollapsible;
