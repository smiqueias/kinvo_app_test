import 'dart:io';

import 'package:get/get.dart';
import 'package:kinvo_mobile_test/data/interfaces/i_funds_repository.dart';

class FundsController extends GetxController with StateMixin {
  final IFundsRepository _repository;

  FundsController(
    this._repository,
  );

  @override
  void onInit() {
    super.onInit();
    fetchFunds();
  }

  Future<void> fetchFunds() async {
    change([], status: RxStatus.loading());
    try {
      final funds = await _repository.getFunds();
      change(funds, status: RxStatus.success());
    } on SocketException catch (e) {
      print('Error in StocksController => $e');
      change(
        [],
        status: RxStatus.error('Sem Internet'),
      );
    } on Exception catch (e) {
      print('Error in StocksController => $e');
      change(
        [],
        status: RxStatus.error('Aconteceu algum erro. Tente Novamente.'),
      );
    }
  }
}
