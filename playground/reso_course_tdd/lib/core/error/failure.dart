abstract class Failure {
  Failure([List properties = const <dynamic>[]]) : super();
}

class ServerException extends Failure {}

class CacheException extends Failure {}
