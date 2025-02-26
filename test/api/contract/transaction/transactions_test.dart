import 'package:flutter_deriv_api/services/connection/api_manager/mock_api.dart';
import 'package:flutter_deriv_api/services/dependency_injector/injector.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_deriv_api/api/api_initializer.dart';
import 'package:flutter_deriv_api/api/contract/transaction/transaction.dart';
import 'package:flutter_deriv_api/helpers/helpers.dart';

void main() {
  setUp(() => APIInitializer().initialize(api: MockAPI()));

  tearDown(() => Injector.getInjector().dispose());

  test('Transactions Subscription Test', () async {
    Transaction.subscribeTransactions().listen(
      expectAsync1(
        (Transaction? transaction) {
          expect(transaction!.symbol, 'frxAUDJPY');
          expect(transaction.balance, 9654.38);
          expect(transaction.barrier, 'S0P');
          expect(transaction.contractId, '80072336728');
          expect(transaction.currency, 'USD');
          expect(transaction.id, '9c3d0143-24ac-b8d9-c68b-06856b5f78d2');
          expect(transaction.purchaseTime, getDateTime(1587626678));

          expect(
            transaction.subscriptionInformation!.id,
            '9c3d0143-24ac-b8d9-c68b-06856b5f78d2',
          );
        },
      ),
    );
  });
}
