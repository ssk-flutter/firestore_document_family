import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'document_family_method_channel.dart';

abstract class DocumentFamilyPlatform extends PlatformInterface {
  /// Constructs a DocumentFamilyPlatform.
  DocumentFamilyPlatform() : super(token: _token);

  static final Object _token = Object();

  static DocumentFamilyPlatform _instance = MethodChannelDocumentFamily();

  /// The default instance of [DocumentFamilyPlatform] to use.
  ///
  /// Defaults to [MethodChannelDocumentFamily].
  static DocumentFamilyPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DocumentFamilyPlatform] when
  /// they register themselves.
  static set instance(DocumentFamilyPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
