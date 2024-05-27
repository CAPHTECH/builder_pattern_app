import 'package:builder_pattern_app/queries.dart';
import 'package:builder_pattern_app/types.dart';
import 'package:builder_pattern_app/un_favorite_command.dart';
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

class FavoriteItemCell extends ConsumerWidget {
  const FavoriteItemCell({
    super.key,
    required this.item,
  });

  final FavoriteItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unFavoriteItem = UnFavoriteItem(item);

    return ListTile(
      title: Text(item.post.title),
      subtitle: Text(
        item.post.content,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: unFavoriteItem.canUnFavorite
          ? IconButton(
              onPressed: () => ref.read(unFavoriteCommandProvider)(unFavoriteItem),
              icon: const Icon(Icons.favorite),
            )
          : null,
    );
  }
}
