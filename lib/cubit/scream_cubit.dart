import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_app/model/scream.dart';
import 'package:social_app/repository/repository.dart';

part 'scream_state.dart';

class ScreamCubit extends Cubit<ScreamState> {
  final Repository _repository;

  ScreamCubit(this._repository) : super(ScreamInitial());

  Future<void> getScreams() async {
    try {
      emit(ScreamLoading());
      final scream = await _repository.fetchAllScreams();
      emit(ScreamLoaded(scream));
    } on Exception {
      emit(ScreamError("Something went wrong!"));
    }
  }

  Future<void> addScream(String screamBody) async{
    final scream = await _repository.postScream(screamBody);
    emit(AddNewScream(scream));
  }

}
