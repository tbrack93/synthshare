reveal = document.getElementById("reveal");
secrets = Array.from(document.getElementsByClassName("hidden"));
secrets.shift();

reveal.addEventListener("click", (event) => {
  secrets.forEach((secret) => {
    secret.classList.remove("hidden");
    reveal.classList.add("hidden");
  });
});

