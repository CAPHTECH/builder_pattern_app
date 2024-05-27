import 'package:builder_pattern_app/types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorite_data_source.g.dart';

final _myAccount = MyAccount(id: AccountId('1'), name: 'My Account');
final _otherAccounts = [
  OtherAccount(id: AccountId('1'), name: 'Account 1'),
  OtherAccount(id: AccountId('2'), name: 'Account 2'),
];
final _favorites = {
  _myAccount: [
    FavoriteItem(
      account: _myAccount,
      post: Post(
          id: PostId('1'),
          title: 'Post 1',
          content: 'Content 1',
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          account: _otherAccounts[0]),
    ),
    FavoriteItem(
      account: _myAccount,
      post: Post(
        id: PostId('2'),
        title: 'Post 2',
        content: 'Content 2',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        account: _otherAccounts[1],
      ),
    ),
    FavoriteItem(
      account: _myAccount,
      post: Post(
        id: PostId('3'),
        title: 'Post 3',
        content: 'Content 3',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        account: _otherAccounts[1],
      ),
    ),
  ],
};

@riverpod
class FavoriteDataSource extends _$FavoriteDataSource {
  @override
  Future<List<FavoriteItem>> build({required Account ofAccount}) async => _favorites[ofAccount] ?? [];

  Future<void> remove(FavoriteItem favoriteItem) async {
    await future;
    state = AsyncData([...state.value!..removeWhere((element) => element.post.id == favoriteItem.post.id)]);
  }
}

@riverpod
class UnFavoriteDataSource extends _$UnFavoriteDataSource {
  @override
  void build() {}

  // 本来は非同期処理なのでFutureで返す
  Future<void> unFavorite(UnFavoriteItem unFavoriteItem) async {
    await ref.read(favoriteDataSourceProvider(ofAccount: unFavoriteItem.account).notifier).remove(unFavoriteItem);
  }
}
