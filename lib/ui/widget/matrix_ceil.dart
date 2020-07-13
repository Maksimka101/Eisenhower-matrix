import 'package:eisenhower_matrix/cubit/matrix_cubit.dart';
import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/ui/screen/ceil.dart';
import 'package:eisenhower_matrix/ui/widget/common/matrix_ceil_item.dart';
import 'package:eisenhower_matrix/utils/matrix_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/platform/platform_circular_progress_indicator.dart';

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
              BlocProvider<MatrixCubit>.value(
                value: context.bloc<MatrixCubit>(),
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
        color: getCeilColor(context),
        child: ListView(
          children: ceil.items
              .map<Widget>(
                (ceilItem) => MatrixCeilItem(
                  key: Key(ceilItem.id),
                  item: ceilItem,
                  minimized: true,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class MatrixCeilLoadingWidget extends StatelessWidget {
  final CeilType ceilType;

  const MatrixCeilLoadingWidget({Key key, @required this.ceilType})
      : assert(ceilType != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(2),
        color: getCeilColor(context),
        child: PlatformCircularProgressIndicator(),
      ),
    );
  }
}
