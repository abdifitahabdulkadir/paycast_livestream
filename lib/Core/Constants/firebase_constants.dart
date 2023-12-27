import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firestoreProvider =
    Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

enum MovieDocumentIds {
  action,
  drama,
  romantic,
  animation,
  release,
}

enum MovieSubCollections {
  action_videos,
  drama_videos,
  romantic_videos,
  animation_videos,
  release_videos,
}

enum AppCollections {
  Movies,
  Sports,
  Musics,
}
