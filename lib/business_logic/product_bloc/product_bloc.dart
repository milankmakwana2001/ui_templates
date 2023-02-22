import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ui_templates/business_logic/models/product_model.dart';
import 'package:ui_templates/business_logic/reositories/product_repo.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  late List<ProductModel> myList;
  ProductRepo _productRepo;
  ProductBloc(super.initialState,this._productRepo);

  ProductState get initialState => ProductInitial();

  Stream<ProductState> mapEventToState(ProductEvent event) async* {
    if(event is getData){
      yield Loading();
      myList = await _productRepo.getProducts(productCount: 5);
      yield Success(globalList: myList);
    }
  }
}
