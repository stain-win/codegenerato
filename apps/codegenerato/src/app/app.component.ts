import { Component } from '@angular/core';
import { RouterModule } from '@angular/router';
import {PlaceholderComponent} from './placeholder.component';

@Component({
  standalone: true,
  imports: [RouterModule, PlaceholderComponent],
  selector: 'cdg-root',
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss',
})
export class AppComponent {
  title = 'codegenerato';
}
