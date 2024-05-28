import 'package:builder_pattern_app/favorite_item_cell.dart';
import 'package:builder_pattern_app/types.dart';
import 'package:builder_pattern_app/un_favorite_command.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'builders/account_builder.dart';
import 'builders/widget_directors.dart';
import 'mocks/mock_callback.dart';

typedef _MockUnFavoriteCommand = MockCallback<UnFavoriteItem, Future<void>>;

class FavoriteItemCellDirector extends MaterialWidgetDirector<FavoriteItem> with AccountBuilder {
  void setUnFavoriteMock() {
    addOverrideFactory(() {
      final callback = _MockUnFavoriteCommand();
      setMock(callback);
      when(() => callback.call(UnFavoriteItem(args))).thenAnswer((_) async {});
      return unFavoriteCommandProvider.overrideWithValue(callback.call);
    });
  }

  Finder get cell => find.byType(FavoriteItemCell);
  Finder get unFavoriteButton => find.byType(IconButton);
}

void main() {
  late FavoriteItemCellDirector widget;
  late final post = Post(
    id: PostId('1'),
    title: 'test',
    content: 'test',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    account: AccountBuilder.otherAccounts.first,
  );

  setUp(() => widget = FavoriteItemCellDirector()
    ..setTargetFactory(() => FavoriteItemCell(item: widget.args))
    ..setUnFavoriteMock());

  group('When item is favorited by me', () {
    setUp(() => widget..setArgsFactory(() => FavoriteItem(account: AccountBuilder.defaultMyAccount, post: post)));

    testWidgets('Cell is displayed', (tester) async {
      await tester.pumpWidget(widget.construct());
      await tester.pumpAndSettle();
      expect(widget.cell, findsOneWidget);
    });

    testWidgets('UnFavorite button is displayed and tapped, UnFavoriteCommand is executed', (tester) async {
      await tester.pumpWidget(widget.construct());
      await tester.pumpAndSettle();

      expect(widget.unFavoriteButton, findsOneWidget);
      await tester.tap(widget.unFavoriteButton);
      await tester.pumpAndSettle();

      verify(() => widget.mock<_MockUnFavoriteCommand>().call(UnFavoriteItem(widget.args))).called(1);
    });
  });

  group('When item is not favorited by other account', () {
    setUp(() => widget..setArgsFactory(() => FavoriteItem(account: AccountBuilder.otherAccounts.first, post: post)));

    testWidgets('Cell is displayed', (tester) async {
      await tester.pumpWidget(widget.construct());
      await tester.pumpAndSettle();
      expect(widget.cell, findsOneWidget);
    });

    testWidgets('UnFavorite button is not displayed', (tester) async {
      await tester.pumpWidget(widget.construct());
      await tester.pumpAndSettle();
      expect(widget.unFavoriteButton, findsNothing);
    });
  });
}
