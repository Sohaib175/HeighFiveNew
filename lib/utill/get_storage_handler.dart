import 'package:get_storage/get_storage.dart';

class GetStorageHandler {
  final getStorage = GetStorage();

  setUserId(String userId) {
    getStorage.write("userId", userId);
  }

  String getUserId() {
    var data = getStorage.read("userId");
    return data ?? "";
  }

  deleteUserId() {
    getStorage.remove("userId");
  }
}
