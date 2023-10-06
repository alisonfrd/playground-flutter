import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:reso_course_tdd/core/usecases/usecase.dart';
import 'package:reso_course_tdd/domain/repositories/number_trivia_repository.dart';
import 'package:reso_course_tdd/domain/entities/number_trivia.dart';
import 'package:reso_course_tdd/domain/usecases/get_random_number_trivia.dart';

import 'get_concret_number_trivia_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NumberTriviaRepository>()])
void main() async {
  late GetRandomNumberUsecase usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberUsecase(
        numberTriviaRepository: mockNumberTriviaRepository);
  });

  final tNumberTrivia = NumberTrivia(text: 'Teste', number: 1);

  test('Should be trivia from te repository', () async {
    when(mockNumberTriviaRepository.getRanbomnumberTrivia())
        .thenAnswer((_) async => Right(tNumberTrivia));
    final result = await usecase(NoParams());
    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getRanbomnumberTrivia());
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
