import 'package:eisenhower_matrix/bloc/bloc.dart';
import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/ui/widget/common/custom_platform_icon_button.dart';
import 'package:eisenhower_matrix/ui/widget/common/matrix_ceil_item.dart';
import 'package:eisenhower_matrix/ui/widget/common/platform_size_adapter.dart';
import 'package:eisenhower_matrix/utils/matrix_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CeilScreen extends StatefulWidget {
  final CeilType ceilType;

  const CeilScreen({Key key, @required this.ceilType})
      : assert(ceilType != null),
        super(key: key);

  @override
  _CeilScreenState createState() => _CeilScreenState();
}

class _CeilScreenState extends State<CeilScreen> {
  var _editingEnabled = false;
  final _focusNode = FocusNode();
  var _itemsCount = 0;

  void _addItemTapped() => setState(() {
        _editingEnabled = !_editingEnabled;
        Future.delayed(Duration.zero).then((value) => _focusNode.canRequestFocus
            ? _focusNode.requestFocus()
            : () {
                debugPrint('Can not request focus in CeilScreen');
              });
      });

  void _itemAdded(String title) {
    if (title.trim().isNotEmpty) {
      BlocProvider.of<MatrixBloc>(context).add(
        MatrixCeilItemSaved(
          item: CeilItem(
            title: title,
            index: _itemsCount + 1,
            ceilType: widget.ceilType,
            id: null,
          ),
        ),
      );
    }
    setState(() {
      _editingEnabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cursorColor = Theme.of(context).dividerColor;
    return PlatformScaffold(
      backgroundColor: getCeilColor(context),
      body: GestureDetector(
        onDoubleTap: () {
          Navigator.pop(context);
        },
        child: Column(
          children: <Widget>[
            Container(
              color: getCeilTitleColor(context),
              child: SafeArea(
                bottom: false,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    PlatformBackButton(),
                    Flexible(
                      child: GestureDetector(
                        onTap: _addItemTapped,
                        onDoubleTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Expanded(
                              child: Center(
                                child: Text(
                                  () {
                                    switch (widget.ceilType) {
                                      case CeilType.UrgentImportant:
                                        return 'Urgent And Important';
                                      case CeilType.NotUrgentImportant:
                                        return 'Not Urgent And Important';
                                      case CeilType.UrgentNotImportant:
                                        return 'Urgent And Not Important';
                                      case CeilType.NotUrgentNotImportant:
                                        return 'Not Urgent And Not Important';
                                    }
                                    return 'Lol what?!';
                                  }(),
                                ),
                              ),
                            ),
                            Icon(
                              PlatformIcons(context).add,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: PlatformSizeAdapter(
                child: BlocBuilder<MatrixBloc, MatrixState>(
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case MatrixFetched:
                        List<CeilItem> items;
                        switch (widget.ceilType) {
                          case CeilType.UrgentImportant:
                            items = (state as MatrixFetched).matrix.urgentAndImportant.items;
                            break;
                          case CeilType.UrgentNotImportant:
                            items = (state as MatrixFetched).matrix.urgentAndNotImportant.items;
                            break;
                          case CeilType.NotUrgentImportant:
                            items = (state as MatrixFetched).matrix.notUrgentAndImportant.items;
                            break;
                          case CeilType.NotUrgentNotImportant:
                            items = (state as MatrixFetched).matrix.notUrgentAndNotImportant.items;
                            break;
                        }
                        _itemsCount = items.length;
                        return ListView(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          children: [
                            SizedBox(height: 3),
                            ...items
                                .map<Widget>(
                                  (item) => MatrixCeilItem(
                                    key: Key(item.id),
                                    item: item,
                                    minimized: false,
                                  ),
                                )
                                .toList(),
                            if (_editingEnabled)
                              TextField(
                                style: Theme.of(context).textTheme.subtitle1.copyWith(
                                      fontSize: DefaultTextStyle.of(context).style.fontSize,
                                    ),
                                textCapitalization: TextCapitalization.sentences,
                                focusNode: _focusNode,
                                maxLines: 1,
                                onSubmitted: _itemAdded,
                                decoration: InputDecoration(
                                  hintText: 'Write your task here...',
                                  fillColor: Colors.transparent,
                                  border: InputBorder.none,
                                ),
                                cursorColor: cursorColor,
                              ),
                          ],
                        );
                      default:
                        debugPrint('Unknown state in CeilScreen: $state');
                        return Container();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
