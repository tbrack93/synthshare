reveal = document.getElementById("reveal");
secrets = Array.from(document.getElementsByClassName("hidden"));
if (secrets[0] != secrets[1]) {
  secrets.shift();
}

reveal.addEventListener("click", (event) => {
  secrets.forEach((secret) => {
    secret.classList.remove("hidden");
    reveal.classList.add("hidden");
  });
});

