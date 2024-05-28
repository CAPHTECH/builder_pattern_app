import 'package:builder_pattern_app/favorite_item_cell.dart';
import 'package:builder_pattern_app/queries.dart';
import 'package:builder_pattern_app/types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoriteItemListScreen extends ConsumerWidget {
  const FavoriteItemListScreen({super.key, required this.account});

  final Account account;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteItems = ref.watch(favoriteItemsProvider(ofAccount: account));

    return Scaffold(
      body: SafeArea(
        child: switch (favoriteItems) {
          AsyncData(:final value) => Center(
              child: ListView.builder(
                itemCount: value.length,
                itemBuilder: (context, index) => FavoriteItemCell(
                  key: ValueKey(value[index].post.id),
                  item: value[index],
                ),
              ),
            ),
          AsyncError(:final error) => Center(child: Text(error.toString())),
          _ => const Center(child: CircularProgressIndicator.adaptive()),
        },
      ),
    );
  }
}
