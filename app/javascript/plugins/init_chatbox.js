// $(function() {
//   const chatWidget = (".chat-widget-container"),
//       chatBox = $(".chat-box-container");
  
//   $(chatWidget).click(function(e){
    
//     e.preventDefault();
    
//     $(chatBox).toggleClass("show");
//     $(chatWidget).toggleClass("open");
//   })
  
// });

const initChatBox = () => {
  const chatWidget = document.querySelector('.chat-widget-container');
  const chatBox = document.querySelector(".chat-box-container")
  if (chatWidget) {
    chatWidget.addEventListener('click', (event) => {
      event.preventDefault();
      chatBox.classList.toggle("show")
      chatWidget.classList.toggle("open")
    });
  }
}


export { initChatBox }