import { Component } from '@angular/core';

@Component({
  selector: 'app-header-bar',
  imports: [],
  standalone: true,
  templateUrl: './header-bar.component.html',
  styleUrl: './header-bar.component.scss'
})
export class HeaderBarComponent {
  // This is the header bar component for the application.

  // sections is an array of strings that represent the different sections of the bar.
  protected sections: string[] = ['Home', 'Search', 'Watchlist', 'Library'];
}
