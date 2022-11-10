import { Component, OnInit } from '@angular/core';
import { ClientesService } from '../clientes/clientes.service';
import { BuyProducts } from '../models/BuyProduct';
import { Cliente } from '../models/Cliente';
import { Compras } from '../models/Compras';
import { Product } from '../models/Producto';
import { ProductosService } from '../productos/productos.service';

@Component({
  selector: 'app-compras',
  templateUrl: './compras.component.html',
  styleUrls: ['./compras.component.css']
})
export class ComprasComponent implements OnInit {

  constructor(public clientes: ClientesService,public productos: ProductosService) { }

  listClients: Cliente[] = [];
  listProducts: Product[] = [];
  selectedClient: number = 0;
  showProducts: boolean = false;
  /*listPurchase: Compras[] = [{
    IdProduct: 1,
    NameProduct: "Lavadora",
    Mount: 3,
    UnitPrice: 15000,
    TotalPrice: 45000
  },
  {
    IdProduct: 2,
    NameProduct: "Telefonos",
    Mount: 2,
    UnitPrice: 3000,
    TotalPrice: 6000
  }];*/

  listPurchase: Compras[] = []

  ngOnInit(): void {
    this.getAllClients();
    this.getAllProducts();

  }

  getProductsByClient() {
    this.showProducts = true;
    this.clientes.getProductsByClient(this.selectedClient).subscribe(
      (r) => { console.log(r); this.listPurchase = r},
      (e) => {console.error(e)}
    )
  }

  buyProduct(idProduct: number){
    let amount = (<HTMLInputElement>document.getElementById("mount-prod-"+idProduct)).value;
    if(amount != ""){
      let buyProduct: BuyProducts = { 
        IdProduct: idProduct,
        IdClient: this.selectedClient,
        Amount: +amount
      }
      this.productos.buyProductByClient(buyProduct).subscribe(
        (r) => { 
          console.log(r); 
          this.getProductsByClient();
          (<HTMLInputElement>document.getElementById("mount-prod-"+idProduct)).value = "";
         },
        (e) => {console.error(e)}
      )
    }
  }

  getAllProducts(){
    this.productos.getAllProducts().subscribe(
      (r) => { console.log(r); this.listProducts = r},
      (e) => {console.error(e)}
    )
  }

  getAllClients(){
    this.clientes.getAllClients().subscribe(
      (r) => { console.log(r); this.listClients = r},
      (e) => {console.error(e)}
    )
  }

  

}
