mixin TargetBuilder<Target> {
  late final Target target;
  late Target Function() _targetFactory;
  final List<Target Function(Target)> _targetArrangements = [];

  void setTargetFactory(Target Function() targetFactory) => _targetFactory = targetFactory;
  void addTargetArrangement(Target Function(Target) arrangement) => _targetArrangements.add(arrangement);

  Target buildTarget() =>
      _targetArrangements.reversed.fold(_targetFactory(), (target, arrangement) => arrangement(target));
}
