import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

const initFlatpickr = () => {
  const datepicker = document.querySelector(".datepicker");
  if (datepicker) {
    flatpickr(".datepicker", {
      dateFormat: "l, j F Y",
      minDate: "today",
      plugins: [new rangePlugin({ input: "#trip_end_date"})]
    });
  }
}

export default initFlatpickr;
