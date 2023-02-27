import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'carosel_state.dart';

class CarouselCubit extends Cubit<CarouselState> {
  CarouselCubit() : super(CarouselInitial());

  void changePage(int page) => emit(Success(page: page));
}
