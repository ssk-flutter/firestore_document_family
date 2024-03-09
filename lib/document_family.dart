
import 'document_family_platform_interface.dart';

class DocumentFamily {
  Future<String?> getPlatformVersion() {
    return DocumentFamilyPlatform.instance.getPlatformVersion();
  }
}
