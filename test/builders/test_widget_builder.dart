import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import 'provider_container_builder.dart';

class TestWidgetBuilder<Args> {
  final ProviderContainerBuilder containerBuilder = ProviderContainerBuilder();
  late Args args;

  Args Function()? _argsFactory;
  late Widget Function(Args args) _widgetFactory;

  final List<Override Function(Args)> _overrideFactories = [];

  final List<Mock> mocks = [];

  T mock<T extends Mock>() => mocks.whereType<T>().first;
  Iterable<T> mockList<T extends Mock>() => mocks.whereType<T>();

  void setArgsFactory(Args Function() argsFactory) => _argsFactory = argsFactory;
  void addOverride(Override Function(Args) overrideFactory) => _overrideFactories.add(overrideFactory);
  void setWidgetFactory(Widget Function(Args args) widgetFactory) => _widgetFactory = widgetFactory;

  Widget build({Args? args}) {
    final requiredArgs = args ?? _argsFactory?.call();
    if (requiredArgs == null && Args != voidType) {
      throw ArgumentError('args is required');
    }
    this.args = requiredArgs as Args;

    for (final overrideFactory in _overrideFactories) {
      containerBuilder.addOverride(overrideFactory(requiredArgs));
    }

    return UncontrolledProviderScope(
      container: containerBuilder.build(),
      child: MaterialApp(
        home: _widgetFactory(requiredArgs),
      ),
    );
  }
}

final voidType = _getType<void>();
Type _getType<T>() => T;
