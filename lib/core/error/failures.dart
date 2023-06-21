import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  String? message;
}

class OfflineFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}
class AuthServerFailure extends Failure {
  final String message;
  AuthServerFailure({required this.message});

  @override
  List<Object?> get props => [message];
}
