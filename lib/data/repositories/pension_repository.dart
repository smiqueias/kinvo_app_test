import 'package:dio/dio.dart';
import 'package:kinvo_mobile_test/core/utils/constants/api_urls.dart';
import 'package:kinvo_mobile_test/data/interfaces/i_pension_repository.dart';
import 'package:kinvo_mobile_test/data/model/pension_model.dart';

class PensionRepository implements IPensionRepository {
  final Dio _dio;

  PensionRepository(this._dio);

  @override
  Future<PensionModel> getPension() async {
    try {
      final response = await _dio.get(
        apiBody + 'pension',
      );
      return PensionModel.fromJson(response.data);
    } catch (e) {
      print('Error in PensionRepository: $e');
      rethrow;
    }
  }
}
