// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {}

class GetProfileEvent extends ProfileEvent {
  final String userID;
  GetProfileEvent({
    required this.userID,
  });

  @override
  List<Object?> get props => [userID];
}
