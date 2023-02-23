part of 'product_cubit.dart';

 class ProductState  {
  List<ProductModel> globalProductList;

   ProductState(this.globalProductList);


}

class ProductInitial extends ProductState {
  ProductInitial(super.globalProductList);


}

class Loading extends ProductState {
  Loading(super.globalProductList);


}

class Success extends ProductState {
  List<ProductModel> data;
  Success({required this.data}):super(data);

}

class Error extends ProductState {
  Error(super.globalProductList);


}


