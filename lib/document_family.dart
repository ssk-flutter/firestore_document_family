import 'package:cloud_firestore/cloud_firestore.dart';

/// document 와 그 document 에 속한 collection 들을 모두 삭제하는 모듈
/// 주의1. collection 은 document 와 별개로 존재하므로, collection 을 삭제하기 전에
///       해당 collection 에 속한 document 들을 모두 삭제해야 한다.
/// 주의2. 하위 collection 을 삭제하지 않고 document 를 먼저 삭제하면,
///       하위 collection 에 접근할 수 없다.
///       firestore console 에서 직접 처리하거나 정확한 경로를 지정해야 가능함.
/// 주의3. 시도하기 전에, document 와 collection 에 쓰기 동작을 멈추어야 한다.
/// 주의4. 권한에 문제가 없도록 삭제 순서의 주의한다. (권한 관련 collection 은 마지막에 삭제)
///
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

      if ('log 출력을 하고 싶지 않으면 이 조건을 지우세요'.isNotEmpty) {
        print(
            '### docRef: ${docRef.path} collection: $name docs.length: ${snapshot.docs.length}');
      }

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
