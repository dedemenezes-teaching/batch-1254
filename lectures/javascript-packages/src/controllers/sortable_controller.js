import { Controller } from "@hotwired/stimulus";
import Sortable from "sortablejs";

export default class extends Controller {
  connect() {
    // console.log(this.element)
    Sortable.create(this.element)
  }

}
