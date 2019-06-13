import Sortable from 'sortablejs';

const initSortable = () => {
  // const valise = document.querySelector('.drop-zone');
  // Sortable.create(valise, {
  //   group: "valise",
  //   sort: false,
  // });
  const listTrip = document.querySelector('.trip-list-group');
  if (listTrip) {
    Sortable.create(listTrip, {
      group: "list-trip",
      animation: 150,
      dataIdAttr: 'data-id-trip',
      onEnd: (event) => {
        if (event.to === document.querySelector('.done-list-group')) {
          let tripItemId = event.item.dataset.idTrip;
          markAsDone(tripItemId);
          autoScroll();
        }
      },
    });
    const listTodo = document.querySelector('.todo-list-group');
    Sortable.create(listTodo, {
      group: {
        name: 'list-todo',
        pull: true
      },
      animation: 150,
      dataIdAttr: 'data-id-todo',
      onEnd: (event) => {
        if (event.to === document.querySelector('.done-list-group')) {
          let todoId = event.item.dataset.idTodo;
          markAsComplete(todoId);
          autoScroll();
        }
      },
    });
    const listDone = document.querySelector('.done-list-group');
    Sortable.create(listDone, {
      group: {
      name: 'list-done',
      put: ['list-trip', 'list-todo']
    },
      animation: 150,
    });
  }
};

const markAsDone = (id) => {
  fetch(`/tripitems/${id}/mark_as_complete`, {
    method: 'PATCH',
  })
  // .then(response => response.json())
  .then((data) => {
    // let jsItemStatus = document.querySelector(`.jsitem[data-id-trip='${id}'] .status`);
    // jsItemStatus.innerHTML = '<i class="far fa-thumbs-up"></i>'
    let jsItemQuanity = document.querySelector(`.jsitem[data-id-trip='${id}'] .quantity`);
    jsItemQuanity.outerHTML = "";
    // let link = document.querySelector(`.jsitem[data-id-trip='${id}'] .link`);
    // link.outerHTML = ""
    let jsDoneList = document.querySelector(`.done-list-group`);
    jsDoneList.style.borderColor = "white";
    let jsDragItemText = document.querySelector('#drag-item-text');
    if (jsDragItemText) {
      jsDragItemText.innerHTML = "";
    }
    let jsDropZone = document.querySelector(`#sortDone`);
    jsDropZone.classList.remove(`flexbox-dropzone`);
    let borderDropZone = document.querySelector('.border-drop-zone');
    if (borderDropZone) {
      borderDropZone.classList.remove(`border-drop-zone`);
    }
    let itemsIcons = document.querySelector(`.jsitem[data-id-trip='${id}']`);
    if (itemsIcons) {
      itemsIcons.classList.remove(`jsitem`);
      itemsIcons.classList.add(`jsdone`);
    }
  });
}

const markAsComplete = (id) => {
  fetch(`/todos/${id}/mark_as_complete`, {
    method: 'PATCH',
  })
  // .then(response => response.json())
  .then((data) => {
    // let jstodo = document.querySelector(`.jstodo[data-id-todo='${id}'] .status`);
    // jstodo.innerHTML = '<i class="far fa-thumbs-up"></i>'
    // let link = document.querySelector(`.jstodo[data-id-todo='${id}'] .link`);
    // link.outerHTML = ""
    let jsDoneList = document.querySelector(`.done-list-group`);
    jsDoneList.style.borderColor = "white";
    let jsDragItemText = document.querySelector('#drag-item-text');
    if (jsDragItemText) {
      jsDragItemText.innerHTML = "";
    }
    let jsDropZone = document.querySelector(`#sortDone`);
    jsDropZone.classList.remove(`flexbox-dropzone`);
    let borderDropZone = document.querySelector('.border-drop-zone');
    if (borderDropZone) {
      borderDropZone.classList.remove(`border-drop-zone`);
    }
    let itemsIcons = document.querySelector(`.jstodo[data-id-todo='${id}']`);
    if (itemsIcons) {
      itemsIcons.classList.remove(`jstodo`);
      itemsIcons.classList.add(`jsdone`);
    }
  });
}

const autoScroll = () => {
  const essentials = document.querySelector('.trip-list-group');
  const importants = document.querySelector('.todo-list-group');
  const tripList = document.querySelector('.trip-list');
  const suitcaseDone = document.querySelector('#suitcase-done');
  if (essentials && importants) {
    if (essentials.children.length === 0 && importants.children.length === 0) {
      const scrollLink = document.querySelector("#scroll-link")
      scrollLink.click();
      // vider les titres
      tripList.style.display = "none";
      // mettre en visible ma div suitcase
      suitcaseDone.style.display = "initial";
      // lui mettre la meme mise en forme que tripList
      suitcaseDone.classList.add('skrumble-done');
    }
  }
}

export { initSortable };




  // const listTrip = document.querySelector('.triplist-group');
  //   Sortable.create(listTrip, {
  //   ghostClass: "ghost",
  //   group: "valise",
  //   animation: 150,
  //   onEnd: (event) => {
  //     if (event.to === valise) { markAsDone() }
  //     // alert(`${event.oldIndex} moved to ${event.newIndex}`);
  //     },
  //   });
  // });
