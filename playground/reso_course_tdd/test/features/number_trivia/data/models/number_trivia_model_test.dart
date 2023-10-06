import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:reso_course_tdd/data/models/number_trivia_model.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() async {
  var tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test Text');

  group('test from json', () {
    test('should return a valid model when the JSON number is an integer',
        () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));

      final result = NumberTriviaModel.fromJson(jsonMap);

      expect(result, isA<NumberTriviaModel>());
    });

    test('should return a valid model when the JSON number is an double',
        () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('trivia_double.json'));

      final result = NumberTriviaModel.fromJson(jsonMap);

      expect(result, isA<NumberTriviaModel>());
    });
  });

  //
  group('toJson', () {
    test('should return a JSON map containing the proper data', () async {
      final result = tNumberTriviaModel.toJson();

      final expectedJsonMap = {
        "text": "Test Text",
        "number": 1,
      };

      expect(result, expectedJsonMap);
    });
  });
}
