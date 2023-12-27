import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:focusable_control_builder/focusable_control_builder.dart';
import 'package:movie_app/Features/Movie/Presentation/Screens/movie_item_detail.dart';
import '/Core/Constants/firebase_constants.dart';
import '../../Controller/movie_controller.dart';
import '/Core/Constants/arrow_intents.dart';
import '/Features/Movie/Presentation/Screens/play_movie.dart';
import '/Core/Constants/colors.dart';
import '/Core/Constants/dummy_videos_links.dart';
import '/Features/Movie/Presentation/Components/movie_item.dart';
import '../../../../Core/Components/category_title.dart';
import '../Components/movie_banner.dart';
import 'package:flutter_list_view/flutter_list_view.dart';

class MovieHome extends ConsumerStatefulWidget {
  MovieHome();
  @override
  ConsumerState<MovieHome> createState() => _MovieHomeState();
}

class _MovieHomeState extends ConsumerState<MovieHome> {
  late FlutterListViewController _releaseController;
  late FlutterListViewController _dramaController;
  late FlutterListViewController _actionController;
  late FlutterListViewController _animationController;
  late FlutterListViewController _romanticController;
  late FlutterListViewController _contiueWatchingController;

  bool isFirstElementFocsued = false;
  @override
  void initState() {
    super.initState();
    _releaseController = FlutterListViewController();
    _dramaController = FlutterListViewController();
    _actionController = FlutterListViewController();
    _animationController = FlutterListViewController();
    _romanticController = FlutterListViewController();
    _contiueWatchingController = FlutterListViewController();
  }

  @override
  void dispose() {
    _releaseController.dispose();
    _dramaController.dispose();
    _animationController.dispose();
    _actionController.dispose();
    _romanticController.dispose();
    _contiueWatchingController.dispose();
    super.dispose();
  }

  Widget _getMovieCategoryList(
      {required FlutterListViewController controller,
      required int itemLenth,
      required List<Object> items,
      required String category}) {
    return Container(
      height: 280,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: FlutterListView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        delegate: FlutterListViewDelegate(
          initIndex: 0,
          firstItemAlign: FirstItemAlign.start,
          childCount: itemLenth,
          (context, index) => FocusableControlBuilder(
            shortcuts: {
              LogicalKeySet(LogicalKeyboardKey.select): EnterButtonIntent(),
              LogicalKeySet(LogicalKeyboardKey.enter): EnterButtonIntent(),
            },
            actions: {
              EnterButtonIntent: CallbackAction(
                onInvoke: (intent) {
                  if (category != "Banner")
                    Navigator.of(context).push(CupertinoPageRoute(builder: (_) {
                      return MovieItemDetail(
                        imageUrl: items[index].toString(),
                        category: category,
                      );
                    }));
                  return;
                },
              )
            },
            builder: (context, state) {
              return MovieItem(
                isFocused: state.isFocused,
                imageUrl: items[index].toString(),
                category: category,
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.appBackgroundColor,
      child: FocusTraversalGroup(
        policy: OrderedTraversalPolicy(),
        child: FlutterListView(
          delegate: SliverChildListDelegate([
            MovieBanner(),
            CategoryTitle(title: "New Release"),
            FocusTraversalOrder(
              order: NumericFocusOrder(1),
              child: _getMovieCategoryList(
                  controller: _releaseController,
                  itemLenth: ReleaseImageUrl.releaseImageUrls.length,
                  items: ReleaseImageUrl.releaseImageUrls,
                  category: "Release"),
            ),
            CategoryTitle(title: "Drama"),
            FocusTraversalOrder(
              order: NumericFocusOrder(2),
              child: _getMovieCategoryList(
                controller: _dramaController,
                itemLenth: DramaImageUrl.drameImageUrl.length,
                items: DramaImageUrl.drameImageUrl,
                category: "Drama",
              ),
            ),
            CategoryTitle(title: "Romantic"),
            FocusTraversalOrder(
              order: NumericFocusOrder(3),
              child: _getMovieCategoryList(
                controller: _romanticController,
                itemLenth: RomanticImageUrl.romanticImageUrls.length,
                items: RomanticImageUrl.romanticImageUrls,
                category: "Romantic",
              ),
            ),
            CategoryTitle(title: "Animation"),
            FocusTraversalOrder(
              order: NumericFocusOrder(4),
              child: _getMovieCategoryList(
                controller: _animationController,
                itemLenth: AnimationImageUrl.animationImageUrls.length,
                items: AnimationImageUrl.animationImageUrls,
                category: "Animation",
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
