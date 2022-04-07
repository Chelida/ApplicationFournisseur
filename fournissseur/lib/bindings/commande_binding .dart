import 'package:get/get.dart';
import '../controllers/CommandeController.dart';



class CommandeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommanderController>(
      () => CommanderController(),
    );
  }
}
