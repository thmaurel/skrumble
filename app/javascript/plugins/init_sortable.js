import Sortable from 'sortablejs';

const initSortable = () => {
  const list = document.querySelectorAll('.list-group');
  list.forEach ( function(element) {
    Sortable.create(element, {
    ghostClass: "ghost",
    group: "valise",
    animation: 150,
    onEnd: (event) => {
      if (event.to === valise) { markAsDone() }
      alert(`${event.oldIndex} moved to ${event.newIndex}`);
    },
    });
  });
  const valise = document.querySelector('.drop-zone');
  Sortable.create(valise, {
    group: "valise",
    sort: false,
  });
};

// const markAsDone = () => {
//   $.ajax({
//     type: 'PATCH',
//     url: '/todos/:id/markAsDone'
//     data:
//   })
// };

export { initSortable };
