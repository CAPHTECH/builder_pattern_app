import 'package:mocktail/mocktail.dart';

mixin UsesMockMixin {
  T mock<T extends Mock>() => mockList<T>().first;
  setMock<T extends Mock>(T mock) => mocks.add(mock);
  Iterable<T> mockList<T extends Mock>() => mocks.whereType<T>();

  List<Mock> get mocks;
}
