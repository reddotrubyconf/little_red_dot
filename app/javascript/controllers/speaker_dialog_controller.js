import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

// Connects to data-controller="speaker-dialog"
export default class extends Controller {
  static values = {
    name: String,
    title: String,
    imageUrl: String,
    bio: String
  }

  connect(){
    console.log("HELLO")
  }

  showDialog() {
    const bio = this.bioValue || "No bio available";
    Swal.fire({
      title: this.nameValue,
      html: `${this.titleValue} <br> <br> <hr> <br> ${bio}`,
      imageUrl: this.imageUrlValue,
      imageHeight: 150,
      confirmButtonText: 'wow',
      confirmButtonColor: 'rgb(251, 113, 133)',
      customClass: {
        title: "p-0",
        image: "rounded-lg border-rose-400 border-4"
      }
    })
  }
}
