import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelector('#philosopher_address, #reservation_address, #location');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
