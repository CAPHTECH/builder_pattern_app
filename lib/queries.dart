import 'package:builder_pattern_app/favorite_data_source.dart';
import 'package:builder_pattern_app/types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'queries.g.dart';

@riverpod
Future<Account?> myAccount(MyAccountRef ref) async => MyAccount(id: AccountId('1'), name: 'Ryoichi Izumita');

@riverpod
Future<List<Account>> followingAccounts(FollowingAccountsRef ref) async => [
      OtherAccount(id: AccountId('2'), name: 'Following Account 1'),
      OtherAccount(id: AccountId('3'), name: 'Following Account 2'),
      OtherAccount(id: AccountId('4'), name: 'Following Account 3'),
      OtherAccount(id: AccountId('5'), name: 'Following Account 4'),
    ];

@riverpod
Future<Iterable<Post>> posts(PostsRef ref) async {
  final posts = [
    {
      'id': '1',
      'title': 'Post 1',
      'content': 'Content 1',
      'createdAt': DateTime.now(),
      'updatedAt': DateTime.now(),
      'accountId': '1',
    },
    {
      'id': '2',
      'title': 'Post 2',
      'content': 'Content 2',
      'createdAt': DateTime.now(),
      'updatedAt': DateTime.now(),
      'accountId': '2',
    },
    {
      'id': '3',
      'title': 'Post 3',
      'content': 'Content 3',
      'createdAt': DateTime.now(),
      'updatedAt': DateTime.now(),
      'accountId': '2',
    },
    {
      'id': '4',
      'title': 'Post 4',
      'content': 'Content 4',
      'createdAt': DateTime.now(),
      'updatedAt': DateTime.now(),
      'accountId': '4',
    },
    {
      'id': '5',
      'title': 'Post 5',
      'content': 'Content 5',
      'createdAt': DateTime.now(),
      'updatedAt': DateTime.now(),
      'accountId': '4',
    },
  ];

  final accounts = await ref.watch(followingAccountsProvider.future);

  return posts.map((post) => Post(
        id: post['id'] as PostId,
        title: post['title'] as String,
        content: post['content'] as String,
        createdAt: post['createdAt'] as DateTime,
        updatedAt: post['updatedAt'] as DateTime,
        account: accounts.firstWhere((account) => account.id == post['accountId']),
      ));
}

@riverpod
Future<List<Post>> postsByIds(PostsByIdsRef ref, List<PostId> postIds) async {
  final posts = await ref.watch(postsProvider.future);
  return posts.where((post) => postIds.contains(post.id)).toList();
}

@riverpod
Future<List<FavoriteItem>> favoriteItems(FavoriteItemsRef ref, {required Account ofAccount}) =>
    ref.watch(favoriteDataSourceProvider(ofAccount: ofAccount).future);
