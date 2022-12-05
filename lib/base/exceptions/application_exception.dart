import 'base_exception.dart';

class ApplicationException implements BaseException {
  final String message;

  const ApplicationException(this.message);

  @override
  String toString() => message;
}
