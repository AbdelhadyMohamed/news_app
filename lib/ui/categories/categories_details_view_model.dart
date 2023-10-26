import 'package:bloc/bloc.dart';
import 'package:news_app/shared/api_manager/api_manager.dart';

import '../../models/SourcesResponse.dart';

class CategoryDetailsViewModel extends Cubit<CategoryDetailsState> {
  CategoryDetailsViewModel() : super(LoadingState("Loading...."));
  void loadSources(String categoryId) async {
    emit(LoadingState("Loading....."));
    try {
      var response = await ApiManager.getInstance().getSources(categoryId);
      if (response.status == "error") {
        emit(ErrorState(response.message ?? ""));
      } else {
        emit(SuccessState(response.sources));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}

sealed class CategoryDetailsState {}

class SuccessState extends CategoryDetailsState {
  List<Sources>? sourcesList;
  SuccessState(this.sourcesList);
}

class LoadingState extends CategoryDetailsState {
  String message;
  LoadingState(this.message);
}

class ErrorState extends CategoryDetailsState {
  String message;
  ErrorState(this.message);
}
