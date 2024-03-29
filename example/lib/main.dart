import 'package:document_family/document_family.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Center(
            child: ElevatedButton(
              onPressed: () async {
                final DocumentFamily plugin = DocumentFamily.withPath(
                  '/collection-a/sampledoc',
                  [
                    {'collection': 'sub-collection-a'},
                    {'collection': 'sub-collection-b'},
                    {
                      'collection': 'sub-collection-c',
                      'children': [
                        {'collection': 'child-collection-a'},
                        {'collection': 'child-collection-b'},
                      ],
                    },
                  ],
                );
                await plugin.delete();
              },
              child: const Text('Delete Document Family'),
            ),
          )),
    );
  }
}
