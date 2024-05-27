import 'package:builder_pattern_app/favorite_data_source.dart';
import 'package:builder_pattern_app/favorite_item_list_screen.dart';
import 'package:builder_pattern_app/queries.dart';
import 'package:builder_pattern_app/types.dart';
import 'package:builder_pattern_app/un_favorite_command.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'builders/test_widget_builder.dart';
import 'mock_favorite_data_source.dart';

void main() {
  late TestWidgetBuilder<Account> widgetBuilder;
  final MyAccount myAccount = MyAccount(id: AccountId('1'), name: 'test');
  late Account account = myAccount;

  setUpAll(() {
    registerFallbackValue(
      UnFavoriteItem(
        FavoriteItem(
          account: account,
          post: Post(
            id: PostId('1'),
            title: 'title',
            content: 'content',
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            account: account,
          ),
        ),
      ),
    );
  });

  setUp(() {
    widgetBuilder = TestWidgetBuilder<Account>()
      ..containerBuilder.setMyAccount()
      ..setArgsFactory(() => throw UnimplementedError())
      ..setWidgetFactory((account) => FavoriteItemListScreen(account: account))
      ..setUnFavoriteMock();
  });

  group('FavoriteのアカウントがMyAccountである', () {
    setUp(() => widgetBuilder.setArgsFactory(() => myAccount));

    group('FavoriteItemが10個ある', () {
      setUp(() => widgetBuilder.setFavoriteDataSource());

      testWidgets('FavoriteItemが10個表示される', (tester) async {
        final screen = widgetBuilder.build();
        await tester.pumpWidget(screen);
        await tester.pumpAndSettle();

        final items = await widgetBuilder.containerBuilder.container
            .read(favoriteItemsProvider(ofAccount: widgetBuilder.args).future);
        for (final item in items) {
          await tester.scrollUntilVisible(find.byKey(ValueKey(item.post.id)), 50);
        }
      });

      testWidgets('UnFavoriteボタンをタップするとunFavoriteCommandが実行される', (tester) async {
        final screen = widgetBuilder.build();
        await tester.pumpWidget(screen);
        await tester.pumpAndSettle();

        final items = await widgetBuilder.containerBuilder.container
            .read(favoriteItemsProvider(ofAccount: widgetBuilder.args).future);

        final cell = find.byKey(ValueKey(items.first.post.id));
        final button = find.descendant(of: cell, matching: find.byType(IconButton));
        await tester.tap(button);
        await tester.pumpAndSettle();

        verify(() => widgetBuilder.mock<MockCallback<UnFavoriteItem, Future<void>>>().call(UnFavoriteItem(items.first)))
            .called(1);
      });
    });
  });

  group('表示するAccountがOtherAccountである', () {
    setUp(() => widgetBuilder.setArgsFactory(() => OtherAccount(id: AccountId('2'), name: 'test')));

    group('FavoriteItemが10個ある', () {
      setUp(() => widgetBuilder.setFavoriteDataSource());

      testWidgets('FavoriteItemが10個表示される', (tester) async {
        final screen = widgetBuilder.build();
        await tester.pumpWidget(screen);
        await tester.pumpAndSettle();

        final items = await widgetBuilder.containerBuilder.container
            .read(favoriteItemsProvider(ofAccount: widgetBuilder.args).future);
        for (final item in items) {
          await tester.scrollUntilVisible(find.byKey(ValueKey(item.post.id)), 50);
        }
      });

      testWidgets('UnFavoriteボタンが表示されない', (tester) async {
        final screen = widgetBuilder.build();
        await tester.pumpWidget(screen);
        await tester.pumpAndSettle();

        final items = await widgetBuilder.containerBuilder.container
            .read(favoriteItemsProvider(ofAccount: widgetBuilder.args).future);
        final cell = find.byKey(ValueKey(items.first.post.id));
        final button = find.descendant(of: cell, matching: find.byType(IconButton));
        expect(button, findsNothing);
      });
    });
  });
}

extension on TestWidgetBuilder<Account> {
  MockFavoriteDataSource setFavoriteDataSource() {
    final dataSource = MockFavoriteDataSource();
    mocks.add(dataSource);
    addOverride((account) {
      when(() => dataSource.build(ofAccount: account))
          .thenAnswer((_) async => List.generate(10, (i) => containerBuilder.favoriteItem(account)));
      return favoriteDataSourceProvider(ofAccount: account).overrideWith(() => dataSource);
    });
    return dataSource;
  }

  void setUnFavoriteMock() {
    final callback = MockCallback<UnFavoriteItem, Future<void>>();
    mocks.add(callback);
    when(() => callback.call(any())).thenAnswer((_) async {});
    addOverride((account) => unFavoriteCommandProvider.overrideWithValue(callback.call));
  }
}

class MockCallback<Arg, Result> extends Mock {
  Result call(Arg arg);
}
