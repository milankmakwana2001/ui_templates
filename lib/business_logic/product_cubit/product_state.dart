part of 'product_cubit.dart';

 class ProductState  {
  List<ProductModel>? globalProductList;
   ProductState({this.globalProductList});


}

class ProductInitial extends ProductState {


}

class Loading extends ProductState {


}

class Success extends ProductState {
  List<ProductModel> data;
  Success({required this.data}):super(globalProductList: data);

}

class Error extends ProductState {


}


