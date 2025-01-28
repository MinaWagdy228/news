import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/ui/home/category/cubit/source_states.dart';

class SourceViewModel extends Cubit<SourceStates> {
  SourceViewModel() : super(SourceLoadingState());
  //todo: hold data (and) handle logic, since it's a view model!
  Future<void> getSources(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await ApiManager.getSources(categoryId);
      if (response?.status == 'error') {
        emit(SourceErrorState(errorMessage: response!.message!));
      }
      if (response?.status == 'ok') {
        emit(SourceSuccessState(sourcesList: response!.sources!));
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}
