import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ui_templates/business_logic/models/product_model.dart';
import 'package:ui_templates/business_logic/reositories/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductRepo productRepo;

  ProductCubit({required this.productRepo})
      : super(ProductInitial());

  Future<void> getData() async {
    emit(Loading());
    try {
      final response = await productRepo.getProducts(productCount: 5);
      // log('${response}', name: 'ProductCubit');
      emit(
        Success(
          data: response,
        ),
      );
      response.forEach((element)  {
          state.globalProductList?.add(element);
      });
     // state.globalProductList?.addAll(response);
      log('${state.globalProductList!.length}', name: 'ProductCubit');
    } catch (e) {
      log('${e.toString()} from ProductCubit in getData');
      emit(
        Error(

        ),
      );
    }
  }
}
