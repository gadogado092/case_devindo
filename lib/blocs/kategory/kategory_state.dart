import 'package:case_devindo/models/kategory.dart';
import 'package:equatable/equatable.dart';

abstract class KategoryState extends Equatable {
  const KategoryState();

  @override
  List<Object> get props => [];
}

class KategoryInitial extends KategoryState{}

class KategoryLoadingProgress extends KategoryState {}

class KategoryLoadSuccess extends KategoryState {
  final List<Kategory> listKategory;

  KategoryLoadSuccess(this.listKategory);
}

class KategoryLoadFailure extends KategoryState {}

class SearchKategoryEmpty extends KategoryState {}