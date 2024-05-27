import 'package:builder_pattern_app/favorite_data_source.dart';
import 'package:builder_pattern_app/types.dart';
import 'package:faker/faker.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'builders/provider_container_builder.dart';

extension MockFavoriteDataSourceHelper on ProviderContainerBuilder {
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

  MockFavoriteDataSource setFavoriteDataSource(Account account) {
    final dataSource = MockFavoriteDataSource();
    addOverride(favoriteDataSourceProvider(ofAccount: account).overrideWith(() => dataSource));
    return dataSource;
  }
}

// ignore: invalid_use_of_internal_member
class MockFavoriteDataSource extends BuildlessAutoDisposeAsyncNotifier<List<FavoriteItem>>
    with Mock
    implements FavoriteDataSource {
  MockFavoriteDataSource();
}
