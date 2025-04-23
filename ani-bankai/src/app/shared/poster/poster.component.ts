import { Component, Input } from '@angular/core';
import { AnimePosters } from '../../models/interfaces/anime-posters.interface';

@Component({
  selector: 'app-poster',
  imports: [],
  templateUrl: './poster.component.html',
  styleUrl: './poster.component.scss'
})
export class PosterComponent {

  @Input() public obj!: AnimePosters
}
