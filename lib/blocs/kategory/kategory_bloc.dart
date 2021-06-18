import 'package:case_devindo/models/kategory.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'kategory_event.dart';
import 'kategory_state.dart';


class KategoryBloc extends Bloc<KategoryEvent, KategoryState> {
  KategoryBloc() : super(KategoryInitial());

  @override
  Stream<KategoryState> mapEventToState(KategoryEvent event) async* {
    if (event is FetchKategory) {
      yield KategoryLoadingProgress();
      try {
        String data = await rootBundle.loadString('assets/category.json');
        List<Kategory> listKategory = kategoryFromJson(data);
        yield KategoryLoadSuccess(listKategory);
      } catch (e) {
        yield KategoryLoadFailure();
      }
    }
  }
}
