import Flatpickr from 'flatpickr';
require("flatpickr/dist/flatpickr.css")

document.addEventListener('turbolinks:load', event => {
    Flatpickr("[data-behavior='flatpickr']", {
        altInput: true,
        altFormat: "F j, Y",
        dateFormat: "Y-m-d",
    })
}, true);

