const tabs = Array.from(document.getElementsByClassName("tab"));
const conversations = Array.from(document.getElementsByClassName("booking-conversation"));

tabs.forEach((tab) =>{
  tab.addEventListener("click", (event) => {
    removeActive();
    let conversation = document.getElementById(`conversation-${tab.id}`);
    conversation.classList.add("active-conversation");
    tab.classList.add("active-tab");
  });
});


function removeActive() {
  conversations.forEach((conversation) => {
    if (conversation.classList.contains("active-conversation")){
      conversation.classList.remove("active-conversation");
    }
  });

  tabs.forEach((tab) => {
    if (tab.classList.contains("active-tab")) {
      tab.classList.remove("active-tab");
    }
   });
};

