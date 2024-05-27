import 'package:builder_pattern_app/types.dart';
import 'package:builder_pattern_app/un_favorite_command.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_favorite_data_source.dart';
import 'builders/provider_container_builder.dart';

void main() {
  late ProviderContainerBuilder containerBuilder;
  final MyAccount myAccount = MyAccount(id: AccountId('1'), name: 'test');
  late ProviderContainer container;
  late Account account;

  setUp(() => containerBuilder = ProviderContainerBuilder()..setMyAccount());

  group('操作対象のアカウントがMyAccountのとき', () {
    late MockFavoriteDataSource favoriteDataSource;
    late FavoriteItem targetItem;

    setUp(() {
      account = myAccount;
      favoriteDataSource = containerBuilder.setFavoriteDataSource(account);
      targetItem = containerBuilder.favoriteItem(account);
      when(() => favoriteDataSource.remove(targetItem)).thenAnswer((_) => Future.value());
      container = containerBuilder.build();
    });

    test('UnFavoriteできる', () async {
      await container.read(unFavoriteCommandProvider)(targetItem as UnFavoriteItem);
      verify(() => favoriteDataSource.remove(targetItem)).called(1);
    });
  });

  group('操作対象のアカウントがOtherAccountのとき', () {
    setUp(() => account = containerBuilder.accounts.first);

    test('UnFavoriteできない', () async {
      final targetItem = containerBuilder.favoriteItem(account);
      final container = containerBuilder.build();

      expectLater(
        () async => await container.read(unFavoriteCommandProvider)(targetItem as UnFavoriteItem),
        throwsA(isA<ArgumentError>()),
      );
    });
  });
}
