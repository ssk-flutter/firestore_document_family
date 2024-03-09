#include "include/document_family/document_family_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "document_family_plugin.h"

void DocumentFamilyPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  document_family::DocumentFamilyPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
