

const dynamicPrice = () => {
  const priceElement = document.getElementById("price");
  const startDate = document.getElementById("range_start");
  const endDate = document.getElementById("range_end");
  const priceForm = document.getElementById("reservation_total_price")

  if (startDate) {
    startDate.addEventListener("change", (event) => {
      const price = parseInt(priceElement.innerText, 10)
      const startDateArray = startDate.value.split(' ')[0].split('.').map(number => parseInt(number, 10));
      // const endDateArray = endDate.value.split('.').map(number => parseInt(number, 10));
      const start = new Date(startDateArray);
      // const start = new Date(startDate.value.split(' ')[0]).setHours(0,0,0,0);
      const end = new Date(endDate.value);
      console.log(start)
      console.log(end)
      // console.log(start);
      // console.log(end);
      // console.log(end - start);
      // console.log(Date.parse(end) - Date.parse(start));

      const nights = (end - start)/1000/60/60/24;
      const totalPrice = price * nights;
      // console.log(totalPrice);

      if (end) {
        priceForm.classList.remove("d-none");
        priceForm.innerText = "";
        priceForm.insertAdjacentText( "afterbegin", `${totalPrice}€ for ${nights} nights`);
      }


    })
  }
}


export { dynamicPrice }


// replace inner text de l'input simple form
// cacher et afficher le prix quand on change de date
