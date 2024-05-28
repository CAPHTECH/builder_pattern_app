import 'package:builder_pattern_app/favorite_data_source.dart';
import 'package:builder_pattern_app/favorite_item_list_screen.dart';
import 'package:builder_pattern_app/queries.dart';
import 'package:builder_pattern_app/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'builders/account_builder.dart';
import 'builders/favorite_item_generator.dart';
import 'builders/widget_directors.dart';

// ignore: invalid_use_of_internal_member
class MockFavoriteDataSource extends BuildlessAutoDisposeAsyncNotifier<List<FavoriteItem>>
    with Mock
    implements FavoriteDataSource {}

class FavoriteItemListScreenBuilder extends ScreenWidgetDirector<Account> with AccountBuilder, FavoriteItemGenerator {
  void setFavoriteDataSource(int itemCount) {
    addOverrideFactory(() {
      final dataSource = MockFavoriteDataSource();
      setMock(dataSource);
      when(() => dataSource.build(ofAccount: args))
          .thenAnswer((_) async => List.generate(itemCount, (i) => favoriteItem(args)));
      return favoriteDataSourceProvider(ofAccount: args).overrideWith(() => dataSource);
    });
  }
}

void main() {
  late FavoriteItemListScreenBuilder widget;

  setUp(() {
    widget = FavoriteItemListScreenBuilder()
      ..loggedIn()
      ..setTargetFactory(() => FavoriteItemListScreen(account: widget.args));
  });

  group('Displayed account is MyAccount', () {
    setUp(() => widget.setArgsFactory(() => AccountBuilder.defaultMyAccount));

    group('FavoriteItem has 10 items', () {
      setUp(() => widget.setFavoriteDataSource(10));

      testWidgets('FavoriteItem is displayed 10 times', (tester) async {
        await tester.pumpWidget(widget.construct());
        await tester.pumpAndSettle();

        final items = await widget.read(favoriteItemsProvider(ofAccount: widget.args).future);
        for (final item in items) {
          await tester.scrollUntilVisible(find.byKey(ValueKey(item.post.id)), 50);
        }
      });
    });
  });

  group('Displayed account is OtherAccount', () {
    setUp(() => widget.setArgsFactory(() => AccountBuilder.otherAccounts.first));

    group('FavoriteItem has 10 items', () {
      setUp(() => widget.setFavoriteDataSource(10));

      testWidgets('FavoriteItem is displayed 10 times', (tester) async {
        await tester.pumpWidget(widget.construct());
        await tester.pumpAndSettle();

        final items = await widget.read(favoriteItemsProvider(ofAccount: widget.args).future);
        for (final item in items) {
          await tester.scrollUntilVisible(find.byKey(ValueKey(item.post.id)), 50);
        }
      });

      testWidgets('UnFavorite button is not displayed', (tester) async {
        await tester.pumpWidget(widget.construct());
        await tester.pumpAndSettle();

        final items = await widget.read(favoriteItemsProvider(ofAccount: widget.args).future);
        final cell = find.byKey(ValueKey(items.first.post.id));
        final button = find.descendant(of: cell, matching: find.byType(IconButton));
        expect(button, findsNothing);
      });
    });
  });
}
