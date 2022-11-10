import { Component, OnInit, Injectable } from '@angular/core';
import { Product } from '../models/Producto';
import { ProductosService } from './productos.service';


@Component({
  selector: 'app-productos',
  templateUrl: './productos.component.html',
  styleUrls: ['./productos.component.css']
})
export class ProductosComponent implements OnInit {

  isEdit: boolean = false;
  titleProduct = "";

  newProduct: Product = {
    IdProduct: 0,
    NameProduct: "",
    UnitPrice: 0
  }

  showNewProduct = false;

  listProducts: Product[] = [];

  constructor(public productos: ProductosService) {
   }

  ngOnInit(): void {
    this.getAllProducts();
  }

  getAllProducts(){
    this.productos.getAllProducts().subscribe(
      (r) => { console.log(r); this.listProducts = r},
      (e) => {console.error(e)}
    )
  }

  showProduct(){
    this.showNewProduct = true;
  }

  createProduct(){
    this.titleProduct = "Crear Producto"
    this.showProduct();
    this.cleanForm();
    this.isEdit = false;
  }

  editProduct(idProduct:number){
    this.titleProduct = "Editar Producto";
    this.showProduct();
    this.isEdit = true;
    let product: Product;
    product = this.listProducts.find(x => x.IdProduct == idProduct) as Product; 
    this.newProduct.IdProduct = product.IdProduct;
    this.newProduct.NameProduct = product.NameProduct;
    this.newProduct.UnitPrice = product.UnitPrice;
  }

  deleteProduct(idProduct:number){
    this.productos.deleteProduct(idProduct).subscribe(
      (r) => {r ? this.getAllProducts() : alert("Ha ocurrido un error.");}
    )
  }

  saveChanges(){
    if(this.isEdit){
      this.productos.editProduct(this.newProduct).subscribe(
        (r) => {r ? this.getAllProducts() : alert("Ha ocurrido un error.");}
      )
    } else{
      this.productos.createProduct(this.newProduct).subscribe(
        (r) => {r ? this.getAllProducts() : alert("Ha ocurrido un error.");}
      );
    }
    
    this.cleanForm();
    this.showNewProduct = false;  
  }

  cleanForm(){
    this.newProduct = {
      IdProduct: 0,
      NameProduct: "",
      UnitPrice: 0
    }
  }

}
