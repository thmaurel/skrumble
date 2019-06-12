import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

require("flatpickr/dist/themes/confetti.css");
const initFlatpickr = () => {
  const datepicker = document.querySelector(".datepicker");
  if (datepicker) {
    flatpickr(".datepicker", {
      dateFormat: "j, F Y",
      minDate: "today",
      plugins: [new rangePlugin({ input: "#trip_end_date"})]
    });
  }
  const datepicker2 = document.querySelector(".datepicker2");
  if (datepicker2) {
    flatpickr(".datepicker2", {
      dateFormat: "j, F Y",
      minDate: "today",
      plugins: [new rangePlugin({ input: "#end_date2"})]
    });
  }
}

export default initFlatpickr;
