import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Cliente } from '../models/Cliente';

@Injectable({
  providedIn: 'root'
})
export class ClientesService {

  private API = "http://localhost:65282/api/";

  constructor(public http: HttpClient) {
  }

  public getAllClients() : Observable<any>{
    return this.http.get(this.API + "client")
  }

  public createClient(client: Cliente) : Observable<any>{
    return this.http.post(this.API + "client",client);
  }

  public editClient(client: Cliente) : Observable<any>{
    return this.http.put(this.API + "client/"+ client.IdClient,client);
  }

  public deleteClient(idClient: number) : Observable<any>{
    return this.http.delete(this.API + "client/" + idClient);
  }

  public getProductsByClient(idClient: number): Observable<any>{
    return this.http.get(this.API + "PurchasedProduct/" + idClient);
  }
}
