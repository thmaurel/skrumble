// ./src/plugins/init_select2.js
import $ from 'jquery';
import 'select2';
import "../../../node_modules/select2/dist/css/select2.min.css";
const initSelect2 = () => {
  const select = document.querySelector(".select2");
  if (select) {
    $(".select2").select2({
      placeholder: "Select a country",
      allowClear: true,
      width: '100%'
    });
  }
};

export default initSelect2;
