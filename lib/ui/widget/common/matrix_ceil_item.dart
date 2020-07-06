import 'package:eisenhower_matrix/cubit/cubit.dart';
import 'package:eisenhower_matrix/models/ceil_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

class MatrixCeilItem extends StatelessWidget {
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

  void _itemDeleted(BuildContext context) =>
      context.cubit<MatrixCubit>().matrixCeilItemDeleted(itemId: item.id);

  void _doneTapped(BuildContext context) {
    final done = item.done ?? false;
    context.cubit<MatrixCubit>().matrixCeilItemSaved(item: item.copyWith.call(done: !done));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final done = item.done ?? false;
    var titleTextStyle = theme.textTheme.bodyText1.copyWith(
      fontWeight: FontWeight.w400,
      decoration: done ? TextDecoration.lineThrough : null,
      fontStyle: done ? FontStyle.italic : null,
      color: done ? theme.disabledColor : null,
    );
    return Dismissible(
      key: Key(item.id),
      onDismissed: (_) => _itemDeleted(context),
      direction: DismissDirection.startToEnd,
      background: Container(
        alignment: Alignment.centerLeft,
        color: Colors.red,
        child: Icon(CupertinoIcons.delete),
      ),
      child: CupertinoContextMenu(
        actions: <Widget>[
          CupertinoContextMenuAction(
            child: Text('Delete'),
            onPressed: () {
              Future.delayed(Duration(milliseconds: 500)).then((_) => _itemDeleted(context));
              Navigator.of(context).pop();
            },
            isDefaultAction: true,
            trailingIcon: CupertinoIcons.delete,
          ),
          CupertinoContextMenuAction(
            child: Text('Done'),
            trailingIcon: Icons.done,
            onPressed: () {
              _doneTapped(context);
              Navigator.of(context).pop();
            },
          ),
        ],
        previewBuilder: (context, _, __) => Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.title,
              style: titleTextStyle,
            ),
          ),
        ),
        child: Padding(
          padding: padding,
          child: Text(
            item.title,
            style: titleTextStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
