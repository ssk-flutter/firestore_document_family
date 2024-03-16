import 'package:cloud_firestore/cloud_firestore.dart';

/// document 와 그 document 에 속한 collection 들을 모두 삭제하는 모듈
class DocumentFamily {
  final DocumentReference docRef;
  final List<Map<String, dynamic>> children;

  DocumentFamily(this.docRef, this.children);

  DocumentFamily.withPath(String path, this.children)
      : docRef = FirebaseFirestore.instance.doc(path);

  Future<void> delete() => _delete(docRef, children);

  Future<void> _delete(
    DocumentReference docRef,
    List<dynamic> children,
  ) async {
    for (final collection in children) {
      final String name = collection['collection'];
      final QuerySnapshot snapshot = await docRef.collection(name).get();

      for (final documentSnapshot in snapshot.docs) {
        await _delete(
          documentSnapshot.reference,
          collection['children'] ?? [],
        );
      }
    }
    await docRef.delete();
  }

  static Future<void> deleteExample() async {
    final DocumentReference docRef = FirebaseFirestore.instance
        .collection('some-collection')
        .doc('example123');
    final children = [
      {'collection': 'members'},
      {'collection': 'requestingMembers'},
      {
        'collection': 'tracking',
        'children': [
          {'collection': 'history'},
        ],
      },
    ];

    await DocumentFamily(docRef, children).delete();
  }
}
