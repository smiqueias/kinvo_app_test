import 'package:get/get.dart';
import 'package:kinvo_mobile_test/data/repositories/pension_repository.dart';

class PensionController extends GetxController with StateMixin {
  final PensionRepository _repository;

  @override
  void onInit() {
    super.onInit();
    fetchPensions();
  }

  PensionController(this._repository);

  Future<void> fetchPensions() async {
    change([], status: RxStatus.loading());
    try {
      final pension = await _repository.getPension();
      change(pension, status: RxStatus.success());
    } catch (e) {
      print('Error in PensionController => $e');
      change([], status: RxStatus.error());
    }
  }
}
