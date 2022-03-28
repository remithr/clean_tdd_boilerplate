import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  // final Exception exception;
  const Failure([List properties = const <dynamic>[]]) : super();
}

/// NO INTERNET EXCEPTION
class SocketException extends Failure {
  final String exception;
  const SocketException({
    required this.exception,
  });

  @override
  List<Object?> get props => [exception];
}

/// 404 NOT FOUND EXCEPTION
class HttpException extends Failure {
  final String exception;
  const HttpException({
    required this.exception,
  });

  @override
  List<Object?> get props => [exception];
}

/// INVALID RESPONSE, NOT JSON, etc
class FormatException extends Failure {
  final String exception;
  const FormatException({
    required this.exception,
  });

  @override
  List<Object?> get props => [exception];
}

class CacheException extends Failure {
  final String exception;
  const CacheException({
    required this.exception,
  });
  @override
  List<Object?> get props => [exception];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}
