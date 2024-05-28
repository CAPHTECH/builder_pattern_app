import 'package:builder_pattern_app/favorite_data_source.dart';
import 'package:builder_pattern_app/types.dart';
import 'package:builder_pattern_app/un_favorite_command.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'builders/account_builder.dart';
import 'builders/favorite_item_generator.dart';
import 'builders/test_target_director.dart';

// ignore: invalid_use_of_internal_member
class MockUnFavoriteDataSource extends BuildlessAutoDisposeNotifier<void> with Mock implements UnFavoriteDataSource {}

class UnFavoriteCommandBuilder extends TestTargetDirector<Future<void> Function(UnFavoriteItem), UnFavoriteItem>
    with AccountBuilder, FavoriteItemGenerator {
  void buildMockUnFavoriteDataSource() => addOverrideFactory(() {
        final dataSource = MockUnFavoriteDataSource();
        setMock(dataSource);
        when(() => dataSource.unFavorite(args)).thenAnswer((_) async {});
        return unFavoriteDataSourceProvider.overrideWith(() => dataSource);
      });
}

void main() {
  late UnFavoriteCommandBuilder builder;

  setUp(() => builder = UnFavoriteCommandBuilder()
    ..loggedIn()
    ..buildMockUnFavoriteDataSource()
    ..setTargetFactory(() => builder.read(unFavoriteCommandProvider)));

  group('When the target account is MyAccount', () {
    setUp(() => builder..setArgsFactory(() => UnFavoriteItem(builder.favoriteItem(AccountBuilder.defaultMyAccount))));

    test('Can UnFavorite', () async {
      final command = builder.construct();
      await command(builder.args);

      verify(() => builder.mock<MockUnFavoriteDataSource>().unFavorite(builder.args)).called(1);
    });
  });

  group('When the target account is OtherAccount', () {
    setUp(
        () => builder..setArgsFactory(() => UnFavoriteItem(builder.favoriteItem(AccountBuilder.otherAccounts.first))));

    test('Can not UnFavorite', () async {
      final command = builder.construct();

      expectLater(
        () async => await command(builder.args),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
