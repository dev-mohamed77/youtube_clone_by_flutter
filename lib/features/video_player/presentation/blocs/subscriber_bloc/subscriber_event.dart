// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class SubscriberEvent extends Equatable {}

class GetStatusSubscriberEvent extends SubscriberEvent {
  final String userID;
  GetStatusSubscriberEvent({
    required this.userID,
  });
  @override
  List<Object?> get props => [userID];
}

class AddSubscribeEvent extends SubscriberEvent {
  final String userID;
  AddSubscribeEvent({
    required this.userID,
  });
  @override
  List<Object?> get props => [userID];
}

class UnSubscribeEvent extends SubscriberEvent {
  final String userID;
  UnSubscribeEvent({
    required this.userID,
  });
  @override
  List<Object?> get props => [userID];
}
