import { BrowserModule } from '@angular/platform-browser';
import {APP_INITIALIZER, NgModule} from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import {KeycloakService} from './services/keycloak.service';
import { AdminComponent } from './admin/admin.component';
import { ProducerComponent } from './producer/producer.component';
import {RoleGuard} from './guards/role.guard';
import { ForbiddenComponent } from './forbidden/forbidden.component';

export function kcFactory(keycloakService: KeycloakService): () => Promise<any> {
  return () => keycloakService.init();
}

@NgModule({
  declarations: [
    AppComponent,
    AdminComponent,
    ProducerComponent,
    ForbiddenComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [
    KeycloakService,
    RoleGuard,
    {
      provide: APP_INITIALIZER,
      useFactory: kcFactory,
      deps: [KeycloakService],
      multi: true
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
