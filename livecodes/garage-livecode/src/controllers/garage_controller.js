import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["carsList", 'brand', 'model', 'owner', 'plate']

  connect() {
    this.url = "https://wagon-garage-api.herokuapp.com/1254-garage/cars"
    // console.log("hello from garage controller!")
    this.refreshCars()
  }

  refreshCars() {
    fetch(this.url)
      .then(response => response.json())
      .then(data => this.insertCars(data))
  }

  insertCars(data) {
    data.forEach(car => this.addCar(car))
      // car => { id: 15276, brand: 'Fiat', model: 'Uno', plate: '123PZ56', owner: 'Pedro Zoffoli', … }
  }

  addCar(car) {
    const carHTML = `<div class="car">
            <div class="car-image">
              <img src="https://source.unsplash.com/random?${car.brand} ${car.model}" />
            </div>
            <div class="car-info">
              <h4>${car.brand} ${car.model}</h4>
              <p><strong>Owner:</strong> ${car.owner}</p>
              <p><strong>Plate:</strong> ${car.plate}</p>
            </div>
          </div>`
    this.carsListTarget.insertAdjacentHTML('afterbegin', carHTML)
  }

  createCar(event) {
    event.preventDefault()
    const inputValues = new FormData(event.currentTarget)
    // console.log(Object.fromEntries(inputValues))
    // inputValues.forEach((e) => {
    //   console.log(e);
    // })
    const newCar = Object.fromEntries(inputValues)
    // console.log(newCar) //=> { brand: 'Volkswagen', model: 'Brasilia', plate: '123AL56', owner: 'Augusto Lopes'}
    fetch(this.url, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json'},
      body: JSON.stringify(newCar)
    })
      .then(() => this.refreshCars())
  }

}
