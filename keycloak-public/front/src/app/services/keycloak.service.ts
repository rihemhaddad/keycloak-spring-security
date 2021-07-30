import { Injectable } from '@angular/core';
import {KeycloakTokenParsed} from 'keycloak-js';

declare var Keycloak: any;

@Injectable({
  providedIn: 'root'
})
export class KeycloakService {
  private keycloakAuth: any;

  constructor() { }

  init(): Promise<any> {
    return new Promise((resolve: any, reject: any) => {
      const config = {
        url: 'http://localhost:8080/auth',
        realm: 'FRONT',
        clientId: 'public-client'
      };
      this.keycloakAuth = new Keycloak(config);
      this.keycloakAuth.init({ onLoad: 'login-required' })
        .then(() => {
          resolve();
        })
        .catch(() => {
          reject();
        });
    });
  }
  getToken(): KeycloakTokenParsed {
    return this.keycloakAuth.tokenParsed;
  }

  logout(): void {
    this.keycloakAuth.logout({redirectUri : document.baseURI}).success(() => {
      this.keycloakAuth.loggedIn = false;
      this.keycloakAuth.authz = null;
    });
  }
}
