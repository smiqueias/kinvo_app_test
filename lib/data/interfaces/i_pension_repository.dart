import '../model/pension_model.dart';

abstract class IPensionRepository {
  Future<PensionModel> getPension();
}
