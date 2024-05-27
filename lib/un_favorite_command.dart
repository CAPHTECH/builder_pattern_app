import 'package:builder_pattern_app/favorite_data_source.dart';
import 'package:builder_pattern_app/types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'un_favorite_command.g.dart';

@riverpod
Future<void> Function(UnFavoriteItem) unFavoriteCommand(UnFavoriteCommandRef ref) => (unFavoriteItem) async {
      if (!unFavoriteItem.canUnFavorite) throw ArgumentError('UnFavoriteItem is not favorite');
      await ref.read(unFavoriteDataSourceProvider.notifier).unFavorite(unFavoriteItem);
    };
