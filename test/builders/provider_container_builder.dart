import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'override_builder.dart';
import 'uses_mock_mixin.dart';

class ProviderContainerBuilder with OverrideBuilder, UsesMockMixin, ProviderContainerWrapper {
  ProviderContainer? _container;

  ProviderContainer build() {
    if (_container != null) return _container!;
    _container = ProviderContainer(overrides: overrides);
    addTearDown(_container!.dispose);
    return _container!;
  }

  @override
  ProviderContainerBuilder get containerBuilder => this;

  @override
  ProviderContainer get container => _container!;

  @override
  final List<Override> overrides = [];

  @override
  final List<Mock> mocks = [];
}

mixin ProviderContainerWrapper {
  ProviderContainerBuilder get containerBuilder;

  ProviderContainer get container => containerBuilder.container;

  Result read<Result>(ProviderListenable<Result> provider) => container.read(provider);
}

mixin UsesProviderContainerMixin implements ProviderContainerWrapper, OverrideBuilder, UsesMockMixin {}
