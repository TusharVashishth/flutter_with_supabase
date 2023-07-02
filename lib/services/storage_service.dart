import 'package:get_storage/get_storage.dart';
import 'package:promptia/util/storage_constants.dart';

class StorageService {
  // * Initilize the storage instance
  static final GetStorage box = GetStorage();

  // * Read user session
  static dynamic userSession = box.read(authUserKey);
}
