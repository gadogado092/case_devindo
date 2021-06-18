import 'package:equatable/equatable.dart';

abstract class KategoryEvent extends Equatable {
  const KategoryEvent();

  @override
  List<Object> get props => [];
}

class FetchKategory extends KategoryEvent {
  FetchKategory();
}

class SearchKategory extends KategoryEvent {
  final String query;

  SearchKategory(this.query);

}