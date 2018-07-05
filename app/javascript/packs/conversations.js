const tabs = Array.from(document.getElementsByClassName("tab"));
const conversations = Array.from(document.getElementsByClassName("booking-conversation"));

tabs.forEach((tab) =>{
  console.log(tab.id);
  tab.addEventListener("click", (event) => {
    removeActive();
    let conversation = document.getElementById(`conversation-${tab.id}`);
    conversation.classList.add("active-conversation");
  });
});


function removeActive() {
  conversations.forEach((conversation) => {
    if (conversation.classList.contains("active-conversation")){
      conversation.classList.remove("active-conversation");
    }
  });
};

