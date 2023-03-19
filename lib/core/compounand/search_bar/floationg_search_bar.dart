import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class FloatingSearchBarApp extends StatelessWidget {
  final Function(String)? onQueryChangedCalled;
  final Function(String)? onSubmittedCalled;
  final Function(bool)? onFocusChanged;
  final Widget resultBuilder;
  final List<Widget> actions;
  final FloatingSearchBarController controller;
  final EdgeInsets? edgeInsetsMargin;
  final String? hint;
  final String title;
  final bool withBackButton;
  final borderRaduisSearch;

  FloatingSearchBarApp(
      {super.key,
      this.onQueryChangedCalled,
      required this.resultBuilder,
      required this.actions,
      required this.controller,
      this.edgeInsetsMargin,
      this.hint,
      this.borderRaduisSearch,
      required this.withBackButton,
      this.onSubmittedCalled,
      required this.title,
      this.onFocusChanged});

  var progressIndicator = false;
  var isSearchedPlaceMarkerClicked = false;
  var isTimeAndDistanceVisible = false;

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      controller: controller,
      elevation: 2,
      title: hint == null
          ? Text(
              title,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade200,
                  fontWeight: FontWeight.w500),
            )
          : Text(hint!),
      automaticallyImplyBackButton: withBackButton,
      borderRadius: borderRaduisSearch,
      onFocusChanged: (isFocused) => onFocusChanged!(isFocused),
      onSubmitted: (query) => onSubmittedCalled!(query),
      hintStyle: TextStyle(fontSize: 18, color: Colors.grey.shade200),
      queryStyle: const TextStyle(fontSize: 18),
      hint: hint ?? "Area, Compound, Developer",
      border: const BorderSide(style: BorderStyle.none),
      margins: edgeInsetsMargin ?? const EdgeInsets.fromLTRB(10, 70, 10, 0),
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      height: 52,
      iconColor: Colors.black,
      leadingActions: [Container()],
      automaticallyImplyDrawerHamburger: withBackButton,
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 600),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      progress: progressIndicator,
      onQueryChanged: (qurey) => onQueryChangedCalled!(qurey),
      transition: CircularFloatingSearchBarTransition(),
      actions: actions,
      builder: (context, transition) {
        return resultBuilder;
      },
    );
  }
}
