import 'package:dio/dio.dart';
import 'package:kinvo_mobile_test/core/utils/constants/api_urls.dart';
import 'package:kinvo_mobile_test/data/interfaces/i_stocks_repository.dart';
import 'package:kinvo_mobile_test/data/model/stocks_model.dart';

class StocksRepository implements IStocksRepository {
  final Dio _dio;

  StocksRepository(
    this._dio,
  );

  @override
  Future<StocksrModel> getStocks() async {
    final response = await _dio.get(
      apiBody + 'stocks',
    );

    try {
      return StocksrModel.fromJson(response.data);
    } catch (e) {
      print('Error in repository: $e');
      rethrow;
    }
  }
}
