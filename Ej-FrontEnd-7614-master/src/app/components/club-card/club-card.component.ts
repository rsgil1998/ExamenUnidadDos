import { Component, OnInit } from '@angular/core';
import { Club } from 'src/app/models/club';
import { ClubService } from 'src/app/services/club.service';
import { ActivatedRoute } from '@angular/router';
import { faListAlt } from '@fortawesome/free-solid-svg-icons';

@Component({
  selector: 'app-club-card',
  templateUrl: './club-card.component.html',
  styleUrls: ['./club-card.component.css']
})
export class ClubCardComponent implements OnInit {

  faListAlt=faListAlt;  
  club : Club;
  title: string;
  constructor(private clubService: ClubService,private activatedRoute : ActivatedRoute) { }

  ngOnInit(): void {

    this.activatedRoute.params.subscribe(
      params => {
        if(params['id']){
          this.clubService.retrieve(params['id']).subscribe(
            result => this.club=result
          )
        }
      }
    )
  }

}
