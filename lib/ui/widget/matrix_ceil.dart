import 'package:eisenhower_matrix/bloc/bloc.dart';
import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/ui/screen/ceil.dart';
import 'package:eisenhower_matrix/ui/widget/common/matrix_ceil_item.dart';
import 'package:eisenhower_matrix/utils/matrix_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatrixCeilWidget extends StatelessWidget {
  final Ceil ceil;

  const MatrixCeilWidget({Key key, @required this.ceil})
      : assert(ceil != null),
        super(key: key);

  void _ceilOpened(BuildContext context) => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: BlocProvider.of<MatrixBloc>(context),
              ),
            ],
            child: CeilScreen(
              ceilType: ceil.type,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => _ceilOpened(context),
      child: Container(
        color: getCeilColor(ceil.type),
        child: ListView(
          padding: EdgeInsets.all(4),
          children: ceil.items
              .map<Widget>(
                (ceilItem) => MatrixCeilItem(
                  item: ceilItem,
                  inOneLine: true,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
