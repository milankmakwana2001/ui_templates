import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ui_templates/business_logic/reositories/jokes_dogs_repo.dart';

part 'dog_joke_state.dart';

class DogJokeCubit extends Cubit<DogJokeState> {
  JokeDogRepo dogJokRepo;

  DogJokeCubit({required this.dogJokRepo}) : super(DogJokeInitial());

  Future getData() async {
    emit(Loading());
    try {
      List responses = await dogJokRepo.getData();
      emit(
        Success(
          apiResponses: responses,
        ),
      );
    } catch (e) {
      emit(
        Error(),
      );
    }
  }
}
