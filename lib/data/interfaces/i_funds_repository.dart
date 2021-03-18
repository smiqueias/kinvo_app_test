import '../model/funds_model.dart';

abstract class IFundsRepository {
  Future<FundsModel> getFunds();
}
