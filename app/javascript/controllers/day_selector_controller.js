import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="day-selector"
export default class extends Controller {
  static targets = [ "toggle", "content"];

  selectDay(event) {
    const index = event.currentTarget.dataset.index

    const contentElements = this.contentTarget.querySelectorAll('[data-index]');
    contentElements.forEach(content => {
      content.classList.add("hidden")
    });

    const toggleElements = this.toggleTarget.querySelectorAll('[data-index]');
    toggleElements.forEach(toggle => {
      toggle.classList.remove("border-2")
      toggle.classList.remove("border-rose-800")

    });

    const selectedContent = this.contentTarget.querySelector(`[data-index="${index}"]`)
    selectedContent.classList.remove("hidden")

    const selectedtoggle = this.toggleTarget.querySelector(`[data-index="${index}"]`)
    selectedtoggle.classList.add("border-2")
    selectedtoggle.classList.add("border-rose-800")
  }
}
