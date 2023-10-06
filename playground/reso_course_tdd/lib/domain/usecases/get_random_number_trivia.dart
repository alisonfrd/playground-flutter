import 'package:dartz/dartz.dart';

import 'package:reso_course_tdd/core/error/failure.dart';
import 'package:reso_course_tdd/core/usecases/usecase.dart';
import 'package:reso_course_tdd/domain/entities/number_trivia.dart';

import '../repositories/number_trivia_repository.dart';

class GetRandomNumberUsecase extends UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository numberTriviaRepository;
  GetRandomNumberUsecase({
    required this.numberTriviaRepository,
  });
  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await numberTriviaRepository.getRanbomnumberTrivia();
  }
}
