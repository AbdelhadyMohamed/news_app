import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:news_app/repoContract/news_source_repo.dart';

import '../../data/models/SourcesResponse.dart';

@injectable
class CategoryDetailsViewModel extends Cubit<CategoryDetailsState> {
  late NewsSourceRepository repository;
  @factoryMethod
  CategoryDetailsViewModel(this.repository)
      : super(LoadingState("Loading...."));
  void loadSources(String categoryId) async {
    emit(LoadingState("Loading....."));
    try {
      var sourcesList = await repository.getSources(categoryId);
      emit(SuccessState(sourcesList));
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
