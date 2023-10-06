import 'package:dartz/dartz.dart';
import 'package:reso_course_tdd/core/error/failure.dart';
import 'package:reso_course_tdd/domain/entities/number_trivia.dart';
import 'package:reso_course_tdd/domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  @override
  Future<Either<Failure, NumberTrivia>> getConcretNumerTrivia(int number) {
    // TODO: implement getConcretNumerTrivia
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRanbomnumberTrivia() {
    // TODO: implement getRanbomnumberTrivia
    throw UnimplementedError();
  }
}
