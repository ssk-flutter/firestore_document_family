# document_family

firestore 문서와 하위 collection 들을 모두 제거하는 플러그인입니다.

## Getting Started

```dart
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
```

