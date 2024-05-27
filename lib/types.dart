sealed class Account {
  const Account({required this.id, required this.name});

  final AccountId id;
  final String name;

  @override
  int get hashCode => id.hashCode;
  
  @override
  bool operator ==(Object other) {
    if (other is Account) {
      return id == other.id;
    }
    return false;
  }
}

class MyAccount extends Account {
  const MyAccount({required super.id, required super.name});
}

class OtherAccount extends Account {
  const OtherAccount({required super.id, required super.name});
}

extension type AccountId(String value) {}

extension type PostId(String value) {}

class Post {
  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.account,
  });

  final PostId id;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Account account;
}

class FavoriteItem {
  FavoriteItem({required this.account, required this.post});

  final Account account;
  final Post post;
}

extension type UnFavoriteItem(FavoriteItem favoriteItem) implements FavoriteItem {
  bool get canUnFavorite => favoriteItem.account is MyAccount;
}
