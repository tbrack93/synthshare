const start = document.getElementById("start");
let end = document.getElementById("end");
const enddiv = document.getElementById("end-div");


end.addEventListener("focus", (event) => {
  let end = document.getElementById("end");
  let rebirth = '<input data-provide="datepicker" data-date-format="dd-mm-yyyy" data-date-autoclose="true" data-date-start-date="' + start.value +'" autocomplete="off" id="end" type="text" name="booking[end_time]"> <i class="fas fa-calendar-alt"></i>';
  end.remove();
  enddiv.innerHTML = rebirth;
  end = document.getElementById("end");
  end.click();
  });

