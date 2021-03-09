import { Injectable } from '@angular/core';
import {CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree, Router} from '@angular/router';
import { Observable } from 'rxjs';
import {KeycloakService} from '../services/keycloak.service';

@Injectable({
  providedIn: 'root'
})
export class RoleGuard implements CanActivate {

  protected roles: string[] = [];

  constructor(protected router: Router, protected keycloakService: KeycloakService) {}

  canActivate(
    route: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Observable<boolean | UrlTree> | Promise<boolean | UrlTree> | boolean | UrlTree {

    // Get the roles required from the route.
    const requiredRoles = route.data.roles;
    this.roles = this.keycloakService.getToken().realm_access?.roles || [];

    // Allow the user to to proceed if no additional roles are required to access the route.
    if (!(requiredRoles instanceof Array) || requiredRoles.length === 0) {
      return true;
    }

    if (!requiredRoles.every((role) => this.roles.includes(role))) {
      this.router.navigate(['/interdit']);
    }
    // Allow the user to proceed if all the required roles are present.
    return true;

  }

}
