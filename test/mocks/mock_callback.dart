import 'package:mocktail/mocktail.dart';

class MockCallback<Arg, Result> extends Mock {
  Result call(Arg arg);
}
