import { Component, OnInit } from '@angular/core';
import { HeaderBarComponent } from '../../shared/header-bar/header-bar.component';
import { AnimePosters } from '../../models/interfaces/anime-posters.interface';
import { ListPosterComponent } from '../../shared/list-poster/list-poster.component';

@Component({
  selector: 'app-home',
  imports: [HeaderBarComponent, ListPosterComponent],
  standalone: true,
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss'
})
export class HomeComponent implements OnInit {

  // List of trending anime titles.
  protected trendingAnime: AnimePosters[] = [];

  public ngOnInit(): void {
    this.trendingAnime = this.getTrendingAnime();
  }

  /** 
    * getTrendingAnime
    * 
    * Retuns a list of trending anime titles.
    * TODO: This should be replaced with a service call to fetch trending anime from API.
    * @returns {AnimePosters[]} An array of trending anime titles.
   */
  private getTrendingAnime(): AnimePosters[] {
    return [
      { title: 'Attack on Titan', },
      { title: 'Demon Slayer'},
      { title: 'Jujutsu Kaisen'}
    ];
  }




}
