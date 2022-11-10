import { Injectable } from '@angular/core';
import { Observable } from "rxjs";
import { HttpClient } from '@angular/common/http';
import { Product } from '../models/Producto';
import { BuyProducts } from '../models/BuyProduct';

@Injectable()
export class ProductosService {

  private API = "http://localhost:65282/api/";

  constructor(public http: HttpClient) {
  }

  public getAllProducts() : Observable<any>{
    return this.http.get(this.API + "product")
  }

  public createProduct(product: Product) : Observable<any>{
    return this.http.post(this.API + "product",product);
  }

  public editProduct(product: Product) : Observable<any>{
    return this.http.put(this.API + "product/"+ product.IdProduct,product);
  }

  public deleteProduct(idProduct: number) : Observable<any>{
    return this.http.delete(this.API + "product/" + idProduct);
  }

  public buyProductByClient(buyProduct: BuyProducts) : Observable<any>{
    return this.http.post(this.API + "RegisterShopping", buyProduct);
  }

}
