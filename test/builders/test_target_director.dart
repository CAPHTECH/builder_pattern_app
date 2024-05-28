import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/src/mocktail.dart';

import 'args_builder.dart';
import 'override_builder.dart';
import 'provider_container_builder.dart';
import 'target_builder.dart';
import 'uses_mock_mixin.dart';

class TestTargetDirector<Target, Args>
    with
        UsesProviderContainerMixin,
        ProviderContainerWrapper,
        ArgsBuilder<Args>,
        OverrideBuilder,
        TargetBuilder<Target>,
        UsesMockMixin {
  @override
  final ProviderContainerBuilder containerBuilder = ProviderContainerBuilder();

  @override
  List<Mock> get mocks => containerBuilder.mocks;

  @override
  List<Override> get overrides => containerBuilder.overrides;

  @mustCallSuper
  Target construct() {
    buildArgs();
    buildOverrides();
    containerBuilder.build();
    return buildTarget();
  }
}
