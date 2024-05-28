import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'provider_container_builder.dart';

mixin OverrideBuilder implements ProviderContainerWrapper {
  List<Override> get overrides;

  final List<Override Function()> _overrideFactories = [];

  void addOverride(Override override) => overrides.add(override);
  void addOverrideFactory(Override Function() overrideFactory) => _overrideFactories.add(overrideFactory);

  void buildOverrides() {
    for (final overrideFactory in _overrideFactories) {
      containerBuilder.addOverride(overrideFactory());
    }
  }
}
