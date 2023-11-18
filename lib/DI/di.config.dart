// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:news_app/data/api_manager/api_manager.dart' as _i3;
import 'package:news_app/data/data_source_impl/news_data_source_impl.dart'
    as _i5;
import 'package:news_app/data/data_source_impl/sources_data_source_imp.dart'
    as _i9;
import 'package:news_app/data/dataSourceContract/news_data_source.dart' as _i4;
import 'package:news_app/data/dataSourceContract/news_source_data_source.dart'
    as _i8;
import 'package:news_app/data/repository_impl/news_repo_impl.dart' as _i7;
import 'package:news_app/data/repository_impl/sources_repo_impl.dart' as _i11;
import 'package:news_app/repoContract/news_repo_contract.dart' as _i6;
import 'package:news_app/repoContract/news_source_repo.dart' as _i10;
import 'package:news_app/ui/categories/categories_details_view_model.dart'
    as _i13;
import 'package:news_app/ui/news/news_view_model.dart' as _i12;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(_i3.ApiManager());
    gh.factory<_i4.NewsDataSource>(
        () => _i5.NewsDataSourceImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.NewsRepoContract>(
        () => _i7.NewsRepoImpl(gh<_i4.NewsDataSource>()));
    gh.factory<_i8.NewsSourceDataSource>(
        () => _i9.NewsSourceDataSourceImplementation(gh<_i3.ApiManager>()));
    gh.factory<_i10.NewsSourceRepository>(
        () => _i11.NewsSourceRepoImpl(gh<_i8.NewsSourceDataSource>()));
    gh.factory<_i12.NewsViewModel>(
        () => _i12.NewsViewModel(gh<_i6.NewsRepoContract>()));
    gh.factory<_i13.CategoryDetailsViewModel>(
        () => _i13.CategoryDetailsViewModel(gh<_i10.NewsSourceRepository>()));
    return this;
  }
}
