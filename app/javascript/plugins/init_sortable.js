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
    let jsItemStatus = document.querySelector(`.jsitem[data-id-trip='${id}'] .status`);
    jsItemStatus.innerHTML = '<i class="fas fa-check"></i>'
    let jsItemQuanity = document.querySelector(`.jsitem[data-id-trip='${id}'] .quantity`);
    jsItemQuanity.innerText = ""
    let link = document.querySelector(`.jsitem[data-id-trip='${id}'] .link`);
    link.outerHTML = ""
  });
}

const markAsComplete = (id) => {
  fetch(`/todos/${id}/mark_as_complete`, {
    method: 'PATCH',
  })
  // .then(response => response.json())
  .then((data) => {
    let jstodo = document.querySelector(`.jstodo[data-id-todo='${id}'] .status`);
    jstodo.innerHTML = '<i class="fas fa-check"></i>'
    let link = document.querySelector(`.jstodo[data-id-todo='${id}'] .link`);
    link.outerHTML = ""
  });
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
