import 'package:equatable/equatable.dart';

// Abstract class for all failures
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

// Specific failure for server-related errors
class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

// Specific failure for cache-related errors
class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

// Specific failure for network-related errors
class NetworkFailure extends Failure {
  const NetworkFailure(String message) : super(message);
}

// Specific failure for invalid input or domain-level validation
class InputFailure extends Failure {
  const InputFailure(String message) : super(message);
}
