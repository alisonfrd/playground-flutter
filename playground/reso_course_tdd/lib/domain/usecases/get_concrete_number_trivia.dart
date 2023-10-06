import 'package:dartz/dartz.dart';

import 'package:reso_course_tdd/core/usecases/usecase.dart';

import '../../core/error/failure.dart';
import '../repositories/number_trivia_repository.dart';
import '../entities/number_trivia.dart';

class GetConcreteNumberTrivia extends UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository numberTriviaRepository;

  GetConcreteNumberTrivia(this.numberTriviaRepository);

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await numberTriviaRepository.getConcretNumerTrivia(params.number);
  }
}

class Params {
  final int number;
  Params({
    required this.number,
  });
}
