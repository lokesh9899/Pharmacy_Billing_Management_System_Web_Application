/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


  const firstForm = document.querySelector("form");
      const secondForm=document.querySelector(".container");
      // const secondForm = document.querySelector("#medicine-form form");
      firstForm.addEventListener("submit", (event) => {
        event.preventDefault();
        document.querySelector(".container").style.display = "block";
         firstForm.style.display = "none";
      });
        secondForm.addEventListener("submit", (event) => {
          event.preventDefault();
          alert("Form submitted!");
          window.location.reload();
        });

      // DOM Elements
const orderForm = document.getElementById("order-form");
const addMedicineBtn = document.getElementById("add-medicine");
const medicinesContainer = document.getElementById("medicines-container");

// Medicine counter
let medicineCount = 0;

// Add medicine to container
const addMedicine = (medicine, quantity) => {
  // Create medicine element
  const medicineEl = document.createElement("div");
  medicineEl.classList.add("medicine");

  // Add medicine name
  const medicineNameEl = document.createElement("div");
  medicineNameEl.classList.add("medicine-name");
  medicineNameEl.innerText = medicine;
  medicineEl.appendChild(medicineNameEl);

  // Add medicine quantity
  const quantityEl = document.createElement("div");
  quantityEl.innerText = `Quantity: ${quantity}`;
  medicineEl.appendChild(quantityEl);

  // Add remove button
  const removeBtnEl = document.createElement("button");
  removeBtnEl.classList.add("remove-medicine");
  removeBtnEl.innerText = "X";
  removeBtnEl.addEventListener("click", () => {
    medicineEl.remove();
  });
  medicineEl.appendChild(removeBtnEl);

  // Add medicine to container
  medicinesContainer.appendChild(medicineEl);
};

// Handle add medicine button click
addMedicineBtn.addEventListener("click", () => {
  const medicineSelect = document.getElementById("medicine");
  const medicine = medicineSelect.options[medicineSelect.selectedIndex].text;
  const quantity = document.getElementById("quantity").value;

  addMedicine(medicine, quantity);
  medicineCount++;
});

// Handle form submit
orderForm.addEventListener("submit", (e) => {
  e.preventDefault();

  // Get form values
  const name = document.getElementById("name").value;
  const email = document.getElementById("email").value;
  const address = document.getElementById("address").value;

  // Get medicines
  const medicines = [];
  const medicineEls = document.querySelectorAll(".medicine");
  medicineEls.forEach((medicineEl) => {
    const medicineName = medicineEl.querySelector(".medicine-name").innerText;
    const quantity = medicineEl
      .querySelector("div:nth-child(2)")
      .innerText.replace("Quantity: ", "");
    medicines.push({ name: medicineName, quantity: quantity });
  });

  // Create order object
  const order = {
    name: name,
    email: email,
    address: address,
    medicines: medicines
  };

  // Do something with the order object (e.g. send it to a server)
    console.log(order);

  // Reset form
  orderForm.reset();
  medicinesContainer.innerHTML = "";
  medicineCount = 0;
});