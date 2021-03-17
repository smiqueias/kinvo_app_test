import 'dart:io';
import 'package:get/get.dart';
import 'package:kinvo_mobile_test/data/interfaces/i_stocks_repository.dart';
import 'package:kinvo_mobile_test/data/model/stocks_model.dart';

class StocksController extends GetxController with StateMixin {
  @override
  void onInit() {
    super.onInit();
    fetchStocks();
  }

  final IStocksRepository _repository;

  Rx<StocksrModel> stocksModel = StocksrModel().obs;

  StocksController(this._repository);

  Future<void> fetchStocks() async {
    change([], status: RxStatus.loading());
    try {
      final stocks = await _repository.getStocks();
      change(stocks, status: RxStatus.success());
    } on SocketException catch (e) {
      print(e);
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
