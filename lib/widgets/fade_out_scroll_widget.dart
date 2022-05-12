part of fade_scroll_app_bar;

class FadeOutScrollWidget extends StatefulWidget {
  final ScrollController scrollController;
  final double zeroOpacityOffset;
  final double fullOpacityOffset;
  final FadeScrollAppBar widget;

  const FadeOutScrollWidget({
    Key? key,
    required this.scrollController,
    this.zeroOpacityOffset = 0,
    this.fullOpacityOffset = 0,
    required this.widget,
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
      child: widget.widget.fadeWidget,
    );
  }
}
