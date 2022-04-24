library mypackage;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FadeSliver extends StatefulWidget {
  final Widget? leading;

  final bool automaticallyImplyLeading;

  final Widget? title;

  final List<Widget>? actions;

  final Color? shadowColor;

  final bool forceElevated;

  final Color? foregroundColor;

  final IconThemeData? iconTheme;

  final IconThemeData? actionsIconTheme;

  final bool primary;

  final bool? centerTitle;

  final bool excludeHeaderSemantics;

  final double? titleSpacing;

  final ShapeBorder? shape;

  final double? leadingWidth;

  final TextStyle? toolbarTextStyle;

  final TextStyle? titleTextStyle;

  final SystemUiOverlayStyle? systemOverlayStyle;

  //
  final ScrollController controller;
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
  final double bottomHeight;
  //

  const FadeSliver({
    Key? key,
    //
    required this.controller,
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
    this.bottomHeight = 0,
    //
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.shadowColor,
    this.forceElevated = false,
    this.foregroundColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.primary = true,
    this.centerTitle,
    this.excludeHeaderSemantics = false,
    this.titleSpacing,
    this.shape,
    this.leadingWidth,
    this.toolbarTextStyle,
    this.titleTextStyle,
    this.systemOverlayStyle,
  }) : super(key: key);

  @override
  State<FadeSliver> createState() => _FadeSliverState();
}

class _FadeSliverState extends State<FadeSliver> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: widget.controller,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            leading: widget.leading,
            automaticallyImplyLeading: widget.automaticallyImplyLeading,
            title: widget.title,
            actions: widget.actions,
            elevation: widget.elevation,
            shadowColor: widget.shadowColor,
            forceElevated: widget.forceElevated,
            backgroundColor: widget.backgroundColor,
            foregroundColor: widget.foregroundColor,
            iconTheme: widget.iconTheme,
            actionsIconTheme: widget.actionsIconTheme,
            primary: widget.primary,
            centerTitle: widget.centerTitle,
            excludeHeaderSemantics: widget.excludeHeaderSemantics,
            titleSpacing: widget.titleSpacing,
            expandedHeight: widget.expandedHeight,
            floating: widget.floating,
            pinned: widget.pinned,
            shape: widget.shape,
            toolbarHeight: widget.toolbarHeight,
            leadingWidth: widget.leadingWidth,
            toolbarTextStyle: widget.toolbarTextStyle,
            titleTextStyle: widget.titleTextStyle,
            systemOverlayStyle: widget.systemOverlayStyle,
            flexibleSpace: SingleChildScrollView(
              child: FadeOutScrollWidget(
                scrollController: widget.controller,
                fullOpacityOffset: widget.fadeOffset,
                child: widget.fadeWidget,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(widget.bottomHeight),
              child: widget.bottomWidget ?? const SizedBox.shrink(),
            ),
          ),
        ];
      },
      body: widget.child,
    );
  }
}

class FadeOutScrollWidget extends StatefulWidget {
  final ScrollController scrollController;
  final double zeroOpacityOffset;
  final double fullOpacityOffset;
  final Widget child;

  const FadeOutScrollWidget({
    Key? key,
    required this.scrollController,
    required this.child,
    this.zeroOpacityOffset = 0,
    this.fullOpacityOffset = 0,
  }) : super(key: key);

  @override
  _FadeOutScrollWidgetState createState() => _FadeOutScrollWidgetState();
}

class _FadeOutScrollWidgetState extends State<FadeOutScrollWidget> {
  late double _offset;

  @override
  initState() {
    super.initState();
    _offset = widget.scrollController.offset;
    widget.scrollController.addListener(_setOffset);
  }

  @override
  dispose() {
    widget.scrollController.removeListener(_setOffset);
    super.dispose();
  }

  void _setOffset() {
    setState(() {
      _offset = widget.scrollController.offset;
    });
  }

  double _calculateOpacity() {
    if (widget.fullOpacityOffset == widget.zeroOpacityOffset) {
      return 0;
    } else if (widget.fullOpacityOffset > widget.zeroOpacityOffset) {
      // fading in
      if (_offset <= widget.zeroOpacityOffset) {
        return 1;
      } else if (_offset >= widget.fullOpacityOffset) {
        return 0;
      } else {
        return (_offset - widget.fullOpacityOffset) /
            (widget.zeroOpacityOffset - widget.fullOpacityOffset);
      }
    } else {
      // fading out
      if (_offset <= widget.fullOpacityOffset) {
        return 0;
      } else if (_offset >= widget.zeroOpacityOffset) {
        return 1;
      } else {
        return (_offset - widget.zeroOpacityOffset) /
            (widget.fullOpacityOffset - widget.zeroOpacityOffset);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _calculateOpacity(),
      child: widget.child,
    );
  }
}
