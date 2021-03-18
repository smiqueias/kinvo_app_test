import 'package:dio/dio.dart';
import 'package:kinvo_mobile_test/core/utils/constants/api_urls.dart';
import 'package:kinvo_mobile_test/data/interfaces/i_funds_repository.dart';
import 'package:kinvo_mobile_test/data/model/funds_model.dart';

class FundsRepository implements IFundsRepository {
  final Dio _dio;

  FundsRepository(this._dio);

  @override
  Future<FundsModel> getFunds() async {
    try {
      final response = await _dio.get(
        apiBody + 'funds',
      );
      return FundsModel.fromJson(response.data);
    } catch (e) {
      print('Error in FundsRepository: $e');
      rethrow;
    }
  }
}
