import configureStore from "./store/store";

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  console.log('shit');
  window.store = store;
});