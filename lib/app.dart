import 'package:builder_pattern_app/favorite_item_list_screen.dart';
import 'package:builder_pattern_app/queries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp(
        home: switch (ref.watch(myAccountProvider)) {
          AsyncData(:final value) => FavoriteItemListScreen(account: value!),
          _ => const Center(child: CircularProgressIndicator()),
        },
      );
}
