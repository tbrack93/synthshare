let inputs = Array.from(document.getElementsByClassName("validate"));

inputs.forEach((input) =>{
  input.addEventListener("change", (event) => {
    if (input.value === "Other") {
      alert("Your selection suggests you are adding an old model of Synth.\nGreen eyes are forbidden from using this service.");
      input.value = "";
    }
  });
});

