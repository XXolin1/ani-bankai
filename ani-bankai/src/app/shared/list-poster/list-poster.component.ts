import { Component, Input } from '@angular/core';
import { AnimePosters } from '../../models/interfaces/anime-posters.interface';
import { PosterComponent } from '../poster/poster.component';

@Component({
  selector: 'app-list-poster',
  imports: [PosterComponent],
  templateUrl: './list-poster.component.html',
  styleUrl: './list-poster.component.scss'
})
export class ListPosterComponent {

  @Input() public animeList: AnimePosters[] = []; // List of anime titles to display

}
