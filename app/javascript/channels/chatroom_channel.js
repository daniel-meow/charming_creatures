import consumer from "./consumer";

const insertIntoDOM = (messageHTML, currentUserId, messages) => {
  // create an empty div
  const message = document.createElement('div') // https://developer.mozilla.org/pt-BR/docs/Web/API/Document/createElement

  // put the message HTML inside
  message.innerHTML = messageHTML;

  // if the message is from the sender,
  if (message.dataset.senderId === currentUserId) {
    // add the sender CSS
    message.firstChild.classList.add('sender');
  } else {
    // Else, add the receiver css
    message.firstChild.classList.add('receiver');
  }

  // insert the element in the DOM
  messages.insertAdjacentElement('beforeend', message);
}

const initChatroomCable = () => {
  const messages = document.getElementById('messages');
  if (messages) {
    const chatroomId = messages.dataset.chatroomId;
    const currentUserId = messages.dataset.currentUserId;


    consumer.subscriptions.create({ channel: "ChatroomChannel", id: chatroomId }, {
      received(messageHTML) {
        insertIntoDOM(messageHTML, currentUserId, messages);
      },
    });
  }
}

export { initChatroomCable };