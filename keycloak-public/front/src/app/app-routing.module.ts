import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {AdminComponent} from './admin/admin.component';
import {RoleGuard} from './guards/role.guard';
import {ProducerComponent} from './producer/producer.component';
import {ForbiddenComponent} from './forbidden/forbidden.component';

const routes: Routes = [
  { path: 'admin', component: AdminComponent, canActivate: [RoleGuard], data: {roles: ['admin']}},
  { path: 'producteur', component: ProducerComponent, canActivate: [RoleGuard], data: {roles: ['producteur']}},
  { path: 'interdit', component: ForbiddenComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
