import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/Features/Movie/Repository/movie_repository.dart';
import 'package:movie_app/Models/movie_model.dart';
import '../../../Core/Constants/firebase_constants.dart';

final movieControllerProvider = Provider((ref) =>
    MovieController(repository: ref.watch(movieRepositoryProvider), ref: ref));

final movieCategoryProvider =
    StateProvider<MovieDocumentIds>((ref) => MovieDocumentIds.release);
final movieSubCollectionIdProvider = StateProvider<MovieSubCollections>(
    (ref) => MovieSubCollections.release_videos);

// futureProvider for movie
final movieVideosProvider = FutureProvider(
  (ref) => ref.watch(movieControllerProvider).getMovies(
        categoryDocId: ref.watch(movieCategoryProvider),
        subcollectionId: ref.watch(movieSubCollectionIdProvider),
      ),
);

class MovieController {
  final MovieRepository _MovieRepository;
  final Ref _ref;

  MovieController({required MovieRepository repository, required Ref ref})
      : _MovieRepository = repository,
        _ref = ref;

  Future<List<MovieModel>> getMovies(
      {required MovieDocumentIds categoryDocId,
      required MovieSubCollections subcollectionId}) async {
    final getMovies = await _MovieRepository.getMovies(
        categoryDocId: categoryDocId, subcollectionId: subcollectionId);
    List<MovieModel> movieslists = [];
    movieslists = getMovies.fold((l) {
      // showSnackBarException(l.errorMessage, context);
      return movieslists;
    }, (moviesData) {
      movieslists = moviesData.docs.map((e) {
        return MovieModel.fromMap(e.data() as Map<String, dynamic>);
      }).toList();
      return movieslists;
    });

    return movieslists;
  }
}
