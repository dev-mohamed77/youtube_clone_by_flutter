// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../data/model/result_and_message_model.dart';

abstract class SubscriberState extends Equatable {}

class GetStatusSubscriberLoadingState extends SubscriberState {
  @override
  List<Object?> get props => [];
}

class GetStatusSubscriberSuccessState extends SubscriberState {
  final ResultAndMessageModel result;
  GetStatusSubscriberSuccessState({
    required this.result,
  });
  @override
  List<Object?> get props => [result];
}

class GetStatusSubscriberErrorState extends SubscriberState {
  final String error;
  GetStatusSubscriberErrorState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}
