import Sortable from 'sortablejs';

const initSortable = () => {
  const list = document.querySelectorAll('.list-group');
  list.forEach ( function(element) {
    Sortable.create(element, {
    ghostClass: "ghost",
    animation: 150,
    // onEnd: (event) => {
    //   alert(`${event.oldIndex} moved to ${event.newIndex}`);
    // }
    });
  });
  const sortDone = document.querySelector('#sortDone')
    Sortable.create(sortDone, {
      group: "sorting",
      sort: true
    });
  const sortUndone = document.querySelector('#sortUndone')
    Sortable.create(sortUndone, {
      group: "sorting",
      sort: false
    });
};

export { initSortable };
