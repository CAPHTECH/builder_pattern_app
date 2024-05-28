import 'package:builder_pattern_app/types.dart';
import 'package:faker/faker.dart';

mixin FavoriteItemGenerator {
  FavoriteItem favoriteItem(Account account) => FavoriteItem(
        account: account,
        post: Post(
          id: PostId(faker.guid.guid()),
          title: faker.lorem.sentence(),
          content: faker.lorem.sentence(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          account: account,
        ),
      );
}
