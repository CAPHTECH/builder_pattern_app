import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'test_target_director.dart';

extension WidgetBuilder<Args> on TestTargetDirector<Widget, Args> {
  void useProviderScope() =>
      addTargetArrangement((target) => UncontrolledProviderScope(container: container, child: target));
  void useMaterialApp() => addTargetArrangement((target) => MaterialApp(home: target));
  void useMaterial() => addTargetArrangement((target) => Material(child: target));
  void useDirectionality([TextDirection textDirection = TextDirection.ltr]) =>
      addTargetArrangement((target) => Directionality(textDirection: textDirection, child: target));
}

class ScreenWidgetDirector<Args> extends TestTargetDirector<Widget, Args> {
  @override
  Widget construct({Args? args}) {
    useProviderScope();
    useMaterialApp();
    return super.construct();
  }
}

class MaterialWidgetDirector<Args> extends TestTargetDirector<Widget, Args> {
  @override
  Widget construct({Args? args}) {
    useProviderScope();
    useMaterial();
    useDirectionality();
    return super.construct();
  }
}
