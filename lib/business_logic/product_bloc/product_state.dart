part of 'product_bloc.dart';

abstract class ProductState  {
  const ProductState();
}

class ProductInitial extends ProductState {

}

class Loading extends ProductState {

}

class Success extends ProductState {
  List<ProductModel> globalList;
  Success({required this.globalList});

}

class Error extends ProductState {

}
