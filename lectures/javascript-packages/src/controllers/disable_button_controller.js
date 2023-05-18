import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['link', 'button']

  connect() {
    // console.log(this.linkTarget)
    // console.log(this.buttonTarget)
  }

  disable(event) {
    // console.log(this.element) refers to the element which hold DATA-CONTROLLER!
    this.buttonTarget.innerText = 'Bingo!'
    this.buttonTarget.setAttribute('disabled', '')
    this.linkTarget.classList.remove('d-none')
  }

  reset() {
    this.buttonTarget.innerText = 'Click me!'
    this.buttonTarget.removeAttribute('disabled')
    this.linkTarget.classList.add('d-none')

  }
}
