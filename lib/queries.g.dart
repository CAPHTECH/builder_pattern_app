// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myAccountHash() => r'41ff8de977a5e6fc54849845f5dba86e4eedb14a';

/// See also [myAccount].
@ProviderFor(myAccount)
final myAccountProvider = AutoDisposeFutureProvider<Account>.internal(
  myAccount,
  name: r'myAccountProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$myAccountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MyAccountRef = AutoDisposeFutureProviderRef<Account>;
String _$accountsHash() => r'37bec1f2e16913a8fd555d781a62ff6aa577fe0e';

/// See also [accounts].
@ProviderFor(accounts)
final accountsProvider = AutoDisposeFutureProvider<List<Account>>.internal(
  accounts,
  name: r'accountsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$accountsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AccountsRef = AutoDisposeFutureProviderRef<List<Account>>;
String _$postsHash() => r'79371defcae9777b70c6a1694bb8e5b889084370';

/// See also [posts].
@ProviderFor(posts)
final postsProvider = AutoDisposeFutureProvider<Iterable<Post>>.internal(
  posts,
  name: r'postsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$postsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PostsRef = AutoDisposeFutureProviderRef<Iterable<Post>>;
String _$postsByIdsHash() => r'1634c8659e0a7e4deea58c6f823e479bdd70873b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [postsByIds].
@ProviderFor(postsByIds)
const postsByIdsProvider = PostsByIdsFamily();

/// See also [postsByIds].
class PostsByIdsFamily extends Family<AsyncValue<List<Post>>> {
  /// See also [postsByIds].
  const PostsByIdsFamily();

  /// See also [postsByIds].
  PostsByIdsProvider call(
    List<PostId> postIds,
  ) {
    return PostsByIdsProvider(
      postIds,
    );
  }

  @override
  PostsByIdsProvider getProviderOverride(
    covariant PostsByIdsProvider provider,
  ) {
    return call(
      provider.postIds,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'postsByIdsProvider';
}

/// See also [postsByIds].
class PostsByIdsProvider extends AutoDisposeFutureProvider<List<Post>> {
  /// See also [postsByIds].
  PostsByIdsProvider(
    List<PostId> postIds,
  ) : this._internal(
          (ref) => postsByIds(
            ref as PostsByIdsRef,
            postIds,
          ),
          from: postsByIdsProvider,
          name: r'postsByIdsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postsByIdsHash,
          dependencies: PostsByIdsFamily._dependencies,
          allTransitiveDependencies:
              PostsByIdsFamily._allTransitiveDependencies,
          postIds: postIds,
        );

  PostsByIdsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postIds,
  }) : super.internal();

  final List<PostId> postIds;

  @override
  Override overrideWith(
    FutureOr<List<Post>> Function(PostsByIdsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostsByIdsProvider._internal(
        (ref) => create(ref as PostsByIdsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postIds: postIds,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Post>> createElement() {
    return _PostsByIdsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostsByIdsProvider && other.postIds == postIds;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postIds.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PostsByIdsRef on AutoDisposeFutureProviderRef<List<Post>> {
  /// The parameter `postIds` of this provider.
  List<PostId> get postIds;
}

class _PostsByIdsProviderElement
    extends AutoDisposeFutureProviderElement<List<Post>> with PostsByIdsRef {
  _PostsByIdsProviderElement(super.provider);

  @override
  List<PostId> get postIds => (origin as PostsByIdsProvider).postIds;
}

String _$favoriteItemsHash() => r'cdb1e7d1a0a2f8f0ec7694d3a45d087dc7eb7036';

/// See also [favoriteItems].
@ProviderFor(favoriteItems)
const favoriteItemsProvider = FavoriteItemsFamily();

/// See also [favoriteItems].
class FavoriteItemsFamily extends Family<AsyncValue<List<FavoriteItem>>> {
  /// See also [favoriteItems].
  const FavoriteItemsFamily();

  /// See also [favoriteItems].
  FavoriteItemsProvider call({
    required Account ofAccount,
  }) {
    return FavoriteItemsProvider(
      ofAccount: ofAccount,
    );
  }

  @override
  FavoriteItemsProvider getProviderOverride(
    covariant FavoriteItemsProvider provider,
  ) {
    return call(
      ofAccount: provider.ofAccount,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'favoriteItemsProvider';
}

/// See also [favoriteItems].
class FavoriteItemsProvider
    extends AutoDisposeFutureProvider<List<FavoriteItem>> {
  /// See also [favoriteItems].
  FavoriteItemsProvider({
    required Account ofAccount,
  }) : this._internal(
          (ref) => favoriteItems(
            ref as FavoriteItemsRef,
            ofAccount: ofAccount,
          ),
          from: favoriteItemsProvider,
          name: r'favoriteItemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$favoriteItemsHash,
          dependencies: FavoriteItemsFamily._dependencies,
          allTransitiveDependencies:
              FavoriteItemsFamily._allTransitiveDependencies,
          ofAccount: ofAccount,
        );

  FavoriteItemsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.ofAccount,
  }) : super.internal();

  final Account ofAccount;

  @override
  Override overrideWith(
    FutureOr<List<FavoriteItem>> Function(FavoriteItemsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FavoriteItemsProvider._internal(
        (ref) => create(ref as FavoriteItemsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        ofAccount: ofAccount,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<FavoriteItem>> createElement() {
    return _FavoriteItemsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FavoriteItemsProvider && other.ofAccount == ofAccount;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ofAccount.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FavoriteItemsRef on AutoDisposeFutureProviderRef<List<FavoriteItem>> {
  /// The parameter `ofAccount` of this provider.
  Account get ofAccount;
}

class _FavoriteItemsProviderElement
    extends AutoDisposeFutureProviderElement<List<FavoriteItem>>
    with FavoriteItemsRef {
  _FavoriteItemsProviderElement(super.provider);

  @override
  Account get ofAccount => (origin as FavoriteItemsProvider).ofAccount;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
