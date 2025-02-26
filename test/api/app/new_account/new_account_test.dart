import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/app/new_account/new_account_real.dart';
import 'package:flutter_deriv_api/api/app/new_account/new_account_virtual.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  group('New Account Group ->', () {
    test('Open New Account Real Test', () async {
      final NewAccountReal newAccountReal =
          await NewAccountReal.openNewRealAccount(
        const NewAccountRealRequest(
          accountOpeningReason: 'Speculative',
          accountTurnover: 'Less than \$25,000',
          addressCity: 'Melbourne',
          addressLine1: '20 Broadway Av',
          addressLine2: 'East Melbourne VIC',
          addressPostcode: '3002',
          addressState: 'Victoria',
          dateOfBirth: '1980-01-31',
          firstName: 'Peter',
          lastName: 'Pan',
          nonPepDeclaration: 1,
          phone: '+6123456789',
          placeOfBirth: 'id',
          residence: 'au',
          salutation: 'Mr',
          secretAnswer: 'Jones',
          secretQuestion: 'Mothers maiden name',
          taxIdentificationNumber: '012142545',
          taxResidence: 'ar,sg',
        ),
      );

      expect(newAccountReal.clientId, 'CR0000');
      expect(newAccountReal.landingCompany, 'landing_company');
      expect(newAccountReal.landingCompanyShort, 'landing_company_short');
      expect(newAccountReal.oauthToken, 'sample_token');
      expect(newAccountReal.refreshToken, 'refresh_token');
    });

    test('Open New Account Virtual Test', () async {
      final NewAccountVirtual newAccountVirtual =
          await NewAccountVirtual.openNewVirtualAccount(
        const NewAccountVirtualRequest(
          clientPassword: 'Abc123de',
          residence: 'id',
          type: 'trading',
          verificationCode: 'uoJvVuQ6',
        ),
      );

      expect(newAccountVirtual.balance, 250.0);
      expect(newAccountVirtual.clientId, 'VRTC0000');
      expect(newAccountVirtual.currency, 'USD');
      expect(newAccountVirtual.email, 'test@email.com');
      expect(newAccountVirtual.oauthToken, 'sample_token');
      expect(newAccountVirtual.refreshToken, 'refresh_token');
    });
  });
}
