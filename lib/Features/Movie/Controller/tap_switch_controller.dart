import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppTabs {
  movieTab,
  sportTab,
  musicTap,
}

final switchTapProvider = StateProvider<AppTabs>((ref) => AppTabs.movieTab);

final movieFirstElementFocusProvider =
    StateProvider<FocusNode>((ref) => new FocusNode());
