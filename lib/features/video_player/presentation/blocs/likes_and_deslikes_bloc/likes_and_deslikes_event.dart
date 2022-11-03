// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class LikesAndDesLikesEvent extends Equatable {}

class AddLikeAndDeleteForVideoEvent extends LikesAndDesLikesEvent {
  final String videoID;
  AddLikeAndDeleteForVideoEvent({
    required this.videoID,
  });

  @override
  List<Object?> get props => [videoID];
}

class AddDesLikeAndDeleteForVideoEvent extends LikesAndDesLikesEvent {
  final String videoID;
  AddDesLikeAndDeleteForVideoEvent({
    required this.videoID,
  });

  @override
  List<Object?> get props => [videoID];
}
