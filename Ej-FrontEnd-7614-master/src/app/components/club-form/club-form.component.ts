import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Club } from 'src/app/models/club';
import { ClubService } from 'src/app/services/club.service';

@Component({
  selector: 'app-club-form',
  templateUrl: './club-form.component.html',
  styleUrls: ['./club-form.component.css']
})
export class ClubFormComponent implements OnInit {
  title = "Nuevo registro de Club";
  club : Club = new Club();

  form: FormGroup;  
  
  constructor(private clubService: ClubService,  private formBuilder: FormBuilder, private activatedRoute : ActivatedRoute, private router:Router) { }

  ngOnInit(): void {    

    this.form = this.formBuilder.group({
      nombre: [''],
      descripcion: [''],
      minimoIntegrantes: [''],      
      maximoIntegrantes: [''],     
      instructor: [''],
      lugarEnsayos: [''], 
    });  

    this.activatedRoute.params.subscribe(
      params => {
        if(params['id']){
          this.clubService.retrieve(params['id']).subscribe(
            result => {
              this.club = result;
              this.title = "Actualizando registro de " + this.club.nombre;
            }
          )
        }
      }
    );
  }
  

  onSubmit() : void {    
    if(this.form.invalid){
      console.error('Error en formulario');
      return;
    }

    console.log(this.club);


    this.clubService.save(this.club).subscribe(
      result => {
        console.log(result);   
        this.router.navigate(['club/list']);
      }
    );
  }

  onReset() : void {    
    this.form.reset();    
  }


  }


