import 'package:eisenhower_matrix/cubit/cubit.dart';
import 'package:eisenhower_matrix/models/ceil_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

class MatrixCeilItem extends StatefulWidget {
  final CeilItem item;
  final bool minimized;
  final EdgeInsetsGeometry padding;

  const MatrixCeilItem({
    @required Key key,
    @required this.item,
    @required this.minimized,
    this.padding = const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
  })  : assert(item != null && minimized != null),
        super(key: key);

  @override
  _MatrixCeilItemState createState() => _MatrixCeilItemState(minimized);
}

class _MatrixCeilItemState extends State<MatrixCeilItem> {
  bool _minimized;

  _MatrixCeilItemState(this._minimized);

  void _itemDeleted(BuildContext context) =>
      context.cubit<MatrixCubit>().matrixCeilItemDeleted(itemId: widget.item.id);

  void _doneTapped(BuildContext context) => context
      .cubit<MatrixCubit>()
      .matrixCeilItemSaved(item: widget.item.copyWith.call(done: !widget.item.done));

  void _changeMinimize() => setState(() => _minimized = !_minimized);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final done = widget.item.done ?? false;
    var titleTextStyle = theme.textTheme.bodyText1.copyWith(
      fontWeight: FontWeight.w400,
      decoration: done ? TextDecoration.lineThrough : null,
      fontStyle: done ? FontStyle.italic : null,
      color: done ? theme.disabledColor : null,
    );
    return GestureDetector(
      onTap: _changeMinimize,
      onLongPress: () => _doneTapped(context),
      child: Dismissible(
        key: Key(widget.item.id),
        direction: DismissDirection.startToEnd,
        background: Container(
          alignment: Alignment.centerLeft,
          color: Colors.red,
          padding: widget.padding,
        ),
        onDismissed: (_) => _itemDeleted(context),
        child: Padding(
          padding: widget.padding,
          child: Text(
            widget.item.title,
            style: titleTextStyle,
            maxLines: _minimized ? 1 : null,
            overflow: _minimized ? TextOverflow.ellipsis : null,
          ),
        ),
      ),
    );
  }
}
