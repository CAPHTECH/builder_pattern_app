// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_data_source.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$favoriteDataSourceHash() =>
    r'c622aab7a74724beac7609de05d9a8b814fc9378';

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

abstract class _$FavoriteDataSource
    extends BuildlessAutoDisposeAsyncNotifier<List<FavoriteItem>> {
  late final Account ofAccount;

  FutureOr<List<FavoriteItem>> build({
    required Account ofAccount,
  });
}

/// See also [FavoriteDataSource].
@ProviderFor(FavoriteDataSource)
const favoriteDataSourceProvider = FavoriteDataSourceFamily();

/// See also [FavoriteDataSource].
class FavoriteDataSourceFamily extends Family<AsyncValue<List<FavoriteItem>>> {
  /// See also [FavoriteDataSource].
  const FavoriteDataSourceFamily();

  /// See also [FavoriteDataSource].
  FavoriteDataSourceProvider call({
    required Account ofAccount,
  }) {
    return FavoriteDataSourceProvider(
      ofAccount: ofAccount,
    );
  }

  @override
  FavoriteDataSourceProvider getProviderOverride(
    covariant FavoriteDataSourceProvider provider,
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
  String? get name => r'favoriteDataSourceProvider';
}

/// See also [FavoriteDataSource].
class FavoriteDataSourceProvider extends AutoDisposeAsyncNotifierProviderImpl<
    FavoriteDataSource, List<FavoriteItem>> {
  /// See also [FavoriteDataSource].
  FavoriteDataSourceProvider({
    required Account ofAccount,
  }) : this._internal(
          () => FavoriteDataSource()..ofAccount = ofAccount,
          from: favoriteDataSourceProvider,
          name: r'favoriteDataSourceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$favoriteDataSourceHash,
          dependencies: FavoriteDataSourceFamily._dependencies,
          allTransitiveDependencies:
              FavoriteDataSourceFamily._allTransitiveDependencies,
          ofAccount: ofAccount,
        );

  FavoriteDataSourceProvider._internal(
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
  FutureOr<List<FavoriteItem>> runNotifierBuild(
    covariant FavoriteDataSource notifier,
  ) {
    return notifier.build(
      ofAccount: ofAccount,
    );
  }

  @override
  Override overrideWith(FavoriteDataSource Function() create) {
    return ProviderOverride(
      origin: this,
      override: FavoriteDataSourceProvider._internal(
        () => create()..ofAccount = ofAccount,
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
  AutoDisposeAsyncNotifierProviderElement<FavoriteDataSource,
      List<FavoriteItem>> createElement() {
    return _FavoriteDataSourceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FavoriteDataSourceProvider && other.ofAccount == ofAccount;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, ofAccount.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FavoriteDataSourceRef
    on AutoDisposeAsyncNotifierProviderRef<List<FavoriteItem>> {
  /// The parameter `ofAccount` of this provider.
  Account get ofAccount;
}

class _FavoriteDataSourceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<FavoriteDataSource,
        List<FavoriteItem>> with FavoriteDataSourceRef {
  _FavoriteDataSourceProviderElement(super.provider);

  @override
  Account get ofAccount => (origin as FavoriteDataSourceProvider).ofAccount;
}

String _$unFavoriteDataSourceHash() =>
    r'4abde1f3f7072a409e0af9da2e2aeacdb8d2f3ba';

/// See also [UnFavoriteDataSource].
@ProviderFor(UnFavoriteDataSource)
final unFavoriteDataSourceProvider =
    AutoDisposeNotifierProvider<UnFavoriteDataSource, void>.internal(
  UnFavoriteDataSource.new,
  name: r'unFavoriteDataSourceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$unFavoriteDataSourceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UnFavoriteDataSource = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
