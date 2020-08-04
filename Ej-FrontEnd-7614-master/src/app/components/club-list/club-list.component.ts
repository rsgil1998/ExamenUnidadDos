import { Component, OnInit } from '@angular/core';
import { Club } from 'src/app/models/club';
import { faPlus,faEye, faPencilAlt, faTrash } from '@fortawesome/free-solid-svg-icons';
import { ClubService } from 'src/app/services/club.service';
import Swal from 'sweetalert2';

@Component({
  selector: 'app-club-list',
  templateUrl: './club-list.component.html',
  styleUrls: ['./club-list.component.css']
})
export class ClubListComponent implements OnInit {
  faEye=faEye;
  faPlus=faPlus;
  faPencilAlt=faPencilAlt;
  faTrash=faTrash;
  clubs : Club[];
  constructor(private clubServices : ClubService) { }

  ngOnInit(): void {
    this.list();
  }
  delete(a:Club) :void {
    Swal.fire({
      title: '¿Está seguro de continuar?',
      text: "El registro del club " + a.nombre +" será eliminado.",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Confirmar',
      cancelButtonText: 'Cancelar'
    }).then((result) => {
      if (result.value) {
        this.clubServices.delete(a).subscribe(
          result => {
            console.log(result);
            this.list();
          }           
        )
      }
    })
  }

  list():void{
    this.clubServices.list().subscribe(result => this.clubs=result )
  }
}
