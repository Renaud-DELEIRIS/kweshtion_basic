// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:kweshtion_basic/services/history.service.dart' as _i3;
import 'package:kweshtion_basic/services/kwesh.service.dart' as _i4;
import 'package:kweshtion_basic/services/search.service.dart' as _i5;

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
    gh.singletonAsync<_i3.HistoryService>(() => _i3.HistoryService.inject());
    gh.singletonAsync<_i4.KweshService>(() => _i4.KweshService.inject());
    gh.singletonAsync<_i5.SearchService>(() => _i5.SearchService.inject());
    return this;
  }
}
