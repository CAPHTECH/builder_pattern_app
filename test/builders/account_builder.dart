import 'package:builder_pattern_app/queries.dart';
import 'package:builder_pattern_app/types.dart';

import 'override_builder.dart';

mixin AccountBuilder on OverrideBuilder {
  static final MyAccount defaultMyAccount = MyAccount(id: AccountId('1'), name: 'test');
  static final List<Account> otherAccounts = [
    OtherAccount(id: AccountId('2'), name: 'Other Account 1'),
    OtherAccount(id: AccountId('3'), name: 'Other Account 2'),
    OtherAccount(id: AccountId('4'), name: 'Other Account 3'),
    OtherAccount(id: AccountId('5'), name: 'Other Account 4'),
  ];
  MyAccount? _myAccount;

  void loggedIn([MyAccount? account]) {
    _myAccount = account ?? defaultMyAccount;

    addOverride(myAccountProvider.overrideWith((_) => _myAccount));
  }

  void loggedOut() {
    _myAccount = null;
    addOverride(myAccountProvider.overrideWith((_) => _myAccount));
  }
}
