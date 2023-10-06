import 'package:reso_course_tdd/data/models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDatasource {
  Future<NumberTriviaModel> getConcretNumerTrivia(int number);
  Future<NumberTriviaModel> getRandomNumberTrivia();
}
