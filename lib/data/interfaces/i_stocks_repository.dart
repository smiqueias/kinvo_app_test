import 'package:kinvo_mobile_test/data/model/stocks_model.dart';

abstract class IStocksRepository {
  Future<StocksrModel> getStocks();
}
