import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { options: Object }
  connect() {
    new TomSelect(
      this.element ,
      this.optionsValue
    );
  }
}
