import 'package:builder_pattern_app/queries.dart';
import 'package:builder_pattern_app/types.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class ProviderContainerBuilder {
  late ProviderContainer container;
  final MyAccount defaultMyAccount = MyAccount(id: AccountId('1'), name: 'test');
  MyAccount? myAccount;
  final List<Account> accounts = [
    OtherAccount(id: AccountId('2'), name: 'Following Account 1'),
    OtherAccount(id: AccountId('3'), name: 'Following Account 2'),
    OtherAccount(id: AccountId('4'), name: 'Following Account 3'),
    OtherAccount(id: AccountId('5'), name: 'Following Account 4'),
  ];

  final List<Override> _overrides = [];

  void addOverride(Override override) => _overrides.add(override);

  void setMyAccount([MyAccount? myAccount]) {
    final newMyAccount = myAccount ?? defaultMyAccount;
    this.myAccount = newMyAccount;
    accounts.add(newMyAccount);
    addOverride(myAccountProvider.overrideWith((_) => newMyAccount));
  }

  ProviderContainer build() {
    container = ProviderContainer(overrides: _overrides);
    addTearDown(container.dispose);
    return container;
  }
}
