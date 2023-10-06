import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:reso_course_tdd/domain/repositories/number_trivia_repository.dart';
import 'package:reso_course_tdd/domain/entities/number_trivia.dart';
import 'package:reso_course_tdd/domain/usecases/get_concrete_number_trivia.dart';

import 'get_concret_number_trivia_test.mocks.dart';

@GenerateNiceMocks([MockSpec<NumberTriviaRepository>()])
void main() async {
  late GetConcreteNumberTrivia usecase;
  late MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  const tNumber = 1;
  final tNumberTrivia = NumberTrivia(text: 'Teste', number: 1);

  test('should get trivia for the number from the repository', () async {
    when(mockNumberTriviaRepository.getConcretNumerTrivia(any))
        .thenAnswer((_) async => Right(tNumberTrivia));

    final result = await usecase(Params(number: tNumber));
    expect(result, Right(tNumberTrivia));
    verify(mockNumberTriviaRepository.getConcretNumerTrivia(tNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
