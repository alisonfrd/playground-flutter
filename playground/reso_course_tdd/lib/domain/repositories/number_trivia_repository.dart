import 'package:dartz/dartz.dart';
import 'package:reso_course_tdd/core/error/failure.dart';
import 'package:reso_course_tdd/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcretNumerTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRanbomnumberTrivia();
}
