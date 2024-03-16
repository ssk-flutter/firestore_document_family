# document_family

This package deletes a firestore document and all its sub-collections.

# Warnings
1. To delete a collection, all documents within that collection must be deleted first.
2. If the current document is deleted before its sub-collections, you will no longer be able to access these sub-collections.
3. Before attempting, you must stop all write operations to the document and collections.
4. Be careful of the deletion order to avoid permission issues. (Key data related to permissions should be deleted last.)

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