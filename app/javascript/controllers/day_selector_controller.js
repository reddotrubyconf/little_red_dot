import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="day-selector"
export default class extends Controller {
  connect() {
    console.log("HELLO WORLD")
  }

  selectDay(event) {
    console.log(event.currentTarget.dataset.index)
    const index = event.currentTarget.dataset.index

    const contentElements = document.querySelectorAll('[data-content-index]');
    contentElements.forEach(content => {
      content.classList.add("hidden")
    });

    const tabElements = document.querySelectorAll('[data-index]');
    tabElements.forEach(tab => {
      tab.classList.remove("border-2")
      tab.classList.remove("border-rose-800")

    });

    const selectedContent = document.querySelector(`[data-content-index="${index}"]`)
    selectedContent.classList.remove("hidden")

    const selectedTab = document.querySelector(`[data-index="${index}"]`)
    selectedTab.classList.add("border-2")
    selectedTab.classList.add("border-rose-800")
  }
}
