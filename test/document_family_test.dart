import 'package:flutter_test/flutter_test.dart';
import 'package:document_family/document_family.dart';
import 'package:document_family/document_family_platform_interface.dart';
import 'package:document_family/document_family_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDocumentFamilyPlatform
    with MockPlatformInterfaceMixin
    implements DocumentFamilyPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DocumentFamilyPlatform initialPlatform = DocumentFamilyPlatform.instance;

  test('$MethodChannelDocumentFamily is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDocumentFamily>());
  });

  test('getPlatformVersion', () async {
    DocumentFamily documentFamilyPlugin = DocumentFamily();
    MockDocumentFamilyPlatform fakePlatform = MockDocumentFamilyPlatform();
    DocumentFamilyPlatform.instance = fakePlatform;

    expect(await documentFamilyPlugin.getPlatformVersion(), '42');
  });
}
