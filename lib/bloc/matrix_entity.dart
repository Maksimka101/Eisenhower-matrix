import 'package:eisenhower_matrix/models/models.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class MatrixEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/// Load [Matrix] and subscribe on every changing
class MatrixLatestFetched extends MatrixEvent {}

/// Send loaded [Matrix] to the Bloc
class MatrixFetchedTransition extends MatrixEvent {
  final Matrix matrix;

  MatrixFetchedTransition({@required this.matrix}) : assert(matrix != null);

  @override
  List<Object> get props => [matrix];
}

class MatrixCeilItemSaved extends MatrixEvent {
  final CeilItem item;

  MatrixCeilItemSaved({@required this.item}) : assert(item != null);

  @override
  List<Object> get props => [item];
}

class MatrixCeilItemDeleted extends MatrixEvent {
  final String itemId;

  MatrixCeilItemDeleted({@required this.itemId}) : assert(itemId != null);

  @override
  List<Object> get props => [itemId];
}

abstract class MatrixState extends Equatable {
  @override
  List<Object> get props => [];
}

class MatrixInitial extends MatrixState {}

class MatrixFetched extends MatrixState {
  final Matrix matrix;

  MatrixFetched({@required this.matrix}) : assert(matrix != null);

  @override
  List<Object> get props => [matrix];
}
