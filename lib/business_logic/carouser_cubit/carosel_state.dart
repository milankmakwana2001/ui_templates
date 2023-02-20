part of 'carosel_cubit.dart';

abstract class CarouselState extends Equatable {

  // late int activePage;

   // CarouselState([this.activePage=1]);
}

class CarouselInitial extends CarouselState {
  @override
  List<Object> get props => [];
}

class Loadinig extends CarouselState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Success extends CarouselState{
  final int page;
  Success({required this.page});
  @override
  // TODO: implement props
  List<Object?> get props => [page];
}

class Error extends CarouselState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

