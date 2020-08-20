


const formActive = () => {
  const bookBtn = document.getElementById("book-btn");
  const bookingForm = document.getElementById("book-form");
  if (bookBtn) {
    bookBtn.addEventListener('click', (event) => {
      event.preventDefault();
      bookingForm.classList.toggle("active");
    })
  }
}

export { formActive }
