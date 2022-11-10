import { Component, OnInit } from '@angular/core';
import { Cliente } from '../models/Cliente';
import { ClientesService } from './clientes.service';

@Component({
  selector: 'app-clientes',
  templateUrl: './clientes.component.html',
  styleUrls: ['./clientes.component.css']
})
export class ClientesComponent implements OnInit {

  isEdit: boolean = false;
  titleClient = "";

  newClient: Cliente = {
    IdClient: 0,
    IdentityCard: "",
    NameClient: "",
    SurnameClient: "",
    Phone: "",
    RegistrationDate: ""
  }

  showNewClient = false;

  listClients: Cliente[] = [];

  constructor(public clientes: ClientesService) {
   }

  ngOnInit(): void {
    this.getAllClients();
  }

  getAllClients(){
    this.clientes.getAllClients().subscribe(
      (r) => { console.log(r); this.listClients = r},
      (e) => {console.error(e)}
    )
  }

  showClient(){
    this.showNewClient = true;
  }

  createClient(){
    this.titleClient = "Crear Cliente"
    this.showClient();
    this.cleanForm();
    this.isEdit = false;
  }

  editClient(idClient:number){
    this.titleClient = "Editar Cliente";
    this.showClient();
    this.isEdit = true;
    let client: Cliente;
    client = this.listClients.find(x => x.IdClient == idClient) as Cliente; 
    this.newClient.IdClient = client.IdClient;
    this.newClient.IdentityCard = client.IdentityCard;
    this.newClient.NameClient = client.NameClient;
    this.newClient.SurnameClient = client.SurnameClient;
    this.newClient.Phone = client.Phone;
    this.newClient.RegistrationDate = client.RegistrationDate;
  }

  deleteClient(idClient:number){
    this.clientes.deleteClient(idClient).subscribe(
      (r) => {r ? this.getAllClients() : alert("Ha ocurrido un error.");}
    )
  }

  saveChanges(){
    if(this.isEdit){
      this.clientes.editClient(this.newClient).subscribe(
        (r) => {r ? this.getAllClients() : alert("Ha ocurrido un error.");}
      )
    } else{
      this.clientes.createClient(this.newClient).subscribe(
        (r) => {r ? this.getAllClients() : alert("Ha ocurrido un error.");}
      );
    }
    
    this.cleanForm();
    this.showNewClient = false;  
  }

  cleanForm(){
    this.newClient = {
      IdClient: 0,
    IdentityCard: "",
    NameClient: "",
    SurnameClient: "",
    Phone: "",
    RegistrationDate: ""
    }
  }


}
