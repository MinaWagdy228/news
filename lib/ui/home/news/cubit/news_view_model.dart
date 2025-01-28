import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/ui/home/news/cubit/news_states.dart';

class NewsViewModel extends Cubit<NewsStates> {
  NewsViewModel() : super(NewsLoadingState());

  Future<void> getNewsBySourceId(String sourceId) async {
    emit(NewsLoadingState());
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response!.status == 'error') {
        emit(NewsErrorState(errorMessage: response.message!));
      }
      if (response.status == 'ok') {
        emit(NewsSuccessState(newsList: response.articles!));
      }
    } catch (e) {
      e.toString();
    }
  }
}
