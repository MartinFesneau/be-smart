const prestationActive = () => {

  const prestations = document.querySelectorAll(".prestation-choice");

  if (prestations) {
    
    prestations.forEach((prestation) => {
      prestation.addEventListener("click", (event) => {
        event.currentTarget.classList.toggle("active");
      });
    });
  };
};

export { prestationActive };