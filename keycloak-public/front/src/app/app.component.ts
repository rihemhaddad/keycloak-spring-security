import { Component } from '@angular/core';
import {KeycloakService} from './services/keycloak.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'front';

  constructor(public keycloakService: KeycloakService) {}

}
