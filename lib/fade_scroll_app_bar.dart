library mypackage;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part '../widgets/fade_out_scroll_widget.dart';
part '../widgets/sliver_app_bar_widget.dart';

class FadeScrollAppBar extends StatefulWidget {
  final Widget? appBarLeading;
  final bool appBarAutomaticallyImplyLeading;
  final Widget? appBarTitle;
  final List<Widget>? appBarActions;
  final Color? appBarShadowColor;
  final bool appBarForceElevated;
  final Color? appBarForegroundColor;
  final IconThemeData? appBarIconTheme;
  final IconThemeData? appBarActionsIconTheme;
  final bool appBarPrimary;
  final bool? appBarCenterTitle;
  final bool appBarExcludeHeaderSemantics;
  final double? appBarTitleSpacing;
  final ShapeBorder? appBarShape;
  final double? appBarLeadingWidth;
  final TextStyle? appBarToolbarTextStyle;
  final TextStyle? appBarTitleTextStyle;
  final SystemUiOverlayStyle? appBarSystemOverlayStyle;
  final double appBarStretchTriggerOffset;
  final bool appBarStretch;
  final Future<void> Function()? appBarOnStretchTrigger;
  //
  final ScrollController scrollController;
  final Widget fadeWidget;
  final Widget child;
  final double fadeOffset;
  final double toolbarHeight;
  final double? collapsedHeight;
  final double? expandedHeight;
  final bool floating;
  final bool pinned;
  final bool snap;
  final Color? backgroundColor;
  final double? elevation;
  final Widget? bottomWidget;
  final double bottomWidgetHeight;
  //

  const FadeScrollAppBar({
    Key? key,
    //
    required this.scrollController,
    required this.fadeWidget,
    required this.child,
    this.fadeOffset = 0,
    this.toolbarHeight = kToolbarHeight,
    this.collapsedHeight = 65,
    this.expandedHeight = 200,
    this.floating = false,
    this.pinned = false,
    this.snap = false,
    this.backgroundColor = Colors.white,
    this.elevation = 5,
    this.bottomWidget,
    this.bottomWidgetHeight = 0,
    //
    this.appBarOnStretchTrigger,
    this.appBarStretch = false,
    this.appBarStretchTriggerOffset = 100,
    this.appBarLeading,
    this.appBarAutomaticallyImplyLeading = false,
    this.appBarTitle,
    this.appBarActions,
    this.appBarShadowColor,
    this.appBarForceElevated = false,
    this.appBarForegroundColor,
    this.appBarIconTheme,
    this.appBarActionsIconTheme,
    this.appBarPrimary = true,
    this.appBarCenterTitle,
    this.appBarExcludeHeaderSemantics = false,
    this.appBarTitleSpacing,
    this.appBarShape,
    this.appBarLeadingWidth,
    this.appBarToolbarTextStyle,
    this.appBarTitleTextStyle,
    this.appBarSystemOverlayStyle,
    //
  }) : super(key: key);

  @override
  State<FadeScrollAppBar> createState() => _FadeScrollAppBarState();
}

class _FadeScrollAppBarState extends State<FadeScrollAppBar> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: widget.scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBarWidget(widget: widget),
        ];
      },
      body: widget.child,
    );
  }
}
