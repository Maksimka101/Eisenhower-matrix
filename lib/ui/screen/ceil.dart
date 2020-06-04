import 'package:eisenhower_matrix/bloc/bloc.dart';
import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/ui/widget/common/matrix_ceil_item.dart';
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
    setState(() {
      _editingEnabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text(widget.ceilType.toString().split('.')[1]),
        trailingActions: <Widget>[
          GestureDetector(
            child: Icon(PlatformIcons(context).add),
            onTap: _addItemTapped,
          ),
        ],
      ),
      backgroundColor: getCeilColor(widget.ceilType),
      body: BlocBuilder<MatrixBloc, MatrixState>(
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
                children: [
                  SizedBox(height: 5),
                  ...items
                      .map<Widget>(
                        (item) => Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 3,
                          ),
                          child: MatrixCeilItem(
                            item: item,
                            inOneLine: false,
                          ),
                        ),
                      )
                      .toList(),
                  if (_editingEnabled)
                    PlatformTextField(
                      material: (_, __) => MaterialTextFieldData(
                        decoration: InputDecoration(fillColor: Colors.transparent),
                      ),
                      cupertino: (_, __) => CupertinoTextFieldData(
                        decoration: BoxDecoration(color: Colors.transparent),
                      ),
                      style: TextStyle(color: Colors.black),
                      textCapitalization: TextCapitalization.sentences,
                      focusNode: _focusNode,
                      maxLines: 1,
                      onSubmitted: _itemAdded,
                    ),
                ],
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
