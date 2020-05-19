import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/services/connection/api_manager/base_api.dart';
import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_deriv_api/services/dependency_injector/module_container.dart';

void main() {
  test('Injector test', () async {
    ModuleContainer().initialize(Injector.getInjector(), isMock: true);

    final BaseAPI _api = Injector.getInjector().get<BaseAPI>();

    expect(_api is MockAPI, true);
  });
}