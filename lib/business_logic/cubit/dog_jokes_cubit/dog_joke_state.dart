part of 'dog_joke_cubit.dart';

abstract class DogJokeState extends Equatable {
  const DogJokeState();
}

class DogJokeInitial extends DogJokeState {
  @override
  List<Object> get props => [];
}

class Loading extends DogJokeState {
  @override
  List<Object> get props => [];
}


class Success extends DogJokeState {
  List<dynamic> apiResponses;

  Success({required this.apiResponses});
  @override
  List<Object> get props => [apiResponses];
}


class Error extends DogJokeState {
  @override
  List<Object> get props => [];
}
