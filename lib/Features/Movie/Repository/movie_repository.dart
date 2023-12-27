import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/Core/Constants/firebase_constants.dart';
import '/Core/Utitlies/exception_handling.dart';

// create a provider for this class
final movieRepositoryProvider = Provider(
    (ref) => MovieRepository(firebaseFirestore: ref.watch(firestoreProvider)));

class MovieRepository {
  FirebaseFirestore _firebaseFirestore;

  MovieRepository({required FirebaseFirestore firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore;

  //get reference of Movie collection
  CollectionReference get _getMovieCollectionRef =>
      _firebaseFirestore.collection(AppCollections.Movies.name);

  // get all Movie vidoes
  Future<Either<ExceptionManager, QuerySnapshot<Object?>>> getMovies(
      {required MovieDocumentIds categoryDocId,
      required MovieSubCollections subcollectionId}) async {
    try {
      return Right(await _getMovieCollectionRef
          .doc(categoryDocId.name)
          .collection(subcollectionId.name)
          .get());
    } catch (exception) {
      return Left(ExceptionManager(errorMessage: exception.toString()));
    }
  }
}
