#ifndef FLUTTER_PLUGIN_DOCUMENT_FAMILY_PLUGIN_H_
#define FLUTTER_PLUGIN_DOCUMENT_FAMILY_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace document_family {

class DocumentFamilyPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  DocumentFamilyPlugin();

  virtual ~DocumentFamilyPlugin();

  // Disallow copy and assign.
  DocumentFamilyPlugin(const DocumentFamilyPlugin&) = delete;
  DocumentFamilyPlugin& operator=(const DocumentFamilyPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace document_family

#endif  // FLUTTER_PLUGIN_DOCUMENT_FAMILY_PLUGIN_H_
