import flatpickr from "flatpickr";
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";


const initFlatpickr = () => {
  flatpickr("#range_start", {
  altInput: true,

  dateFormat: "Y.m.d",
  plugins: [new rangePlugin({ input: "#range_end"})]
  });
};

export { initFlatpickr };