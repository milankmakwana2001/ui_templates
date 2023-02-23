import 'dart:developer' as logg;
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:ui_templates/business_logic/models/product_model.dart';
import 'package:ui_templates/business_logic/reositories/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductRepo productRepo;

  ProductCubit({required this.productRepo}) : super(ProductInitial([]));


  Future<void> getData() async {
    emit(Loading([]));
    try {
      Random random = new Random();
      int randomNumber = random.nextInt(5);
      final response = await productRepo.getProducts(pageNumber: randomNumber);
      if (state.globalProductList.isEmpty) {
        state.globalProductList.addAll(response);
      }
      emit(
        Success(
          data: response,
        ),
      );
    } catch (e) {
      logg.log('${e.toString()} from ProductCubit in getData');
      emit(
        Error(state.globalProductList),
      );
    }
  }

  Future<void> getMoreData() async {
    try {
      Random random = new Random();
      int randomNumber = random.nextInt(5);
      final response = await productRepo.getProducts(pageNumber: randomNumber);
      emit(Success(data: [...state.globalProductList, ...response]));
    } catch (e) {
      logg.log('${e.toString()} from ProductCubit in getMoreData');
      emit(
        Error(state.globalProductList),
      );
    }
  }
}
