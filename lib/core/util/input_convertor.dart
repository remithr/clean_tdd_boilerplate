import 'package:clear_architecture/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class InputConvertor {
  Either<Failure, int> stringtoUnsignedInteger(String num) {
    return int.tryParse(num) == null
        ? Left(InvalidInputFailure())
        : Right(int.parse(num));
    // return Right(int.parse(num));
  }
}

class InvalidInputFailure extends Failure {
  @override
  List<Object> get props => [];
}
