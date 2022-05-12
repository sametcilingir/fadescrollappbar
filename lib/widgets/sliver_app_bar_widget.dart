part of fade_scroll_app_bar;

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final FadeScrollAppBar widget;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: widget.appBarLeading,
      automaticallyImplyLeading: widget.appBarAutomaticallyImplyLeading,
      title: widget.appBarTitle,
      actions: widget.appBarActions,
      elevation: widget.elevation,
      shadowColor: widget.appBarShadowColor,
      forceElevated: widget.appBarForceElevated,
      backgroundColor: widget.backgroundColor,
      foregroundColor: widget.appBarForegroundColor,
      iconTheme: widget.appBarIconTheme,
      actionsIconTheme: widget.appBarActionsIconTheme,
      primary: widget.appBarPrimary,
      centerTitle: widget.appBarCenterTitle,
      excludeHeaderSemantics: widget.appBarExcludeHeaderSemantics,
      titleSpacing: widget.appBarTitleSpacing,
      expandedHeight: widget.expandedHeight,
      floating: widget.floating,
      pinned: widget.pinned,
      shape: widget.appBarShape,
      toolbarHeight: widget.toolbarHeight,
      leadingWidth: widget.appBarLeadingWidth,
      toolbarTextStyle: widget.appBarToolbarTextStyle,
      titleTextStyle: widget.appBarTitleTextStyle,
      systemOverlayStyle: widget.appBarSystemOverlayStyle,
      collapsedHeight: widget.collapsedHeight,
      snap: widget.snap,
      stretchTriggerOffset: widget.appBarStretchTriggerOffset,
      stretch: widget.appBarStretch,
      onStretchTrigger: widget.appBarOnStretchTrigger,
      
      flexibleSpace: FadeOutScrollWidget(
        scrollController: widget.scrollController,
        fullOpacityOffset: widget.fadeOffset,
        widget: widget,
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(widget.bottomWidgetHeight),
        child: widget.bottomWidget ?? const SizedBox.shrink(),
      ),
    );
  }
}
