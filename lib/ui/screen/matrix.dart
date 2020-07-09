import 'package:eisenhower_matrix/cubit/matrix_cubit.dart';
import 'package:eisenhower_matrix/models/ceil.dart';
import 'package:eisenhower_matrix/ui/widget/matrix_ceil.dart';
import 'package:eisenhower_matrix/utils/matrix_colors.dart';
import 'package:eisenhower_matrix/utils/platform_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cubit/flutter_cubit.dart';

class MatrixScreen extends StatefulWidget {
  final Function(bool fullScreen) onChangeScreenMode;
  final bool fullScreenMode;

  const MatrixScreen({
    Key key,
    @required this.onChangeScreenMode,
    @required this.fullScreenMode,
  }) : super(key: key);

  @override
  _MatrixScreenState createState() => _MatrixScreenState();
}

class _MatrixScreenState extends State<MatrixScreen> {
  @override
  void initState() {
    context.cubit<MatrixCubit>().matrixFetchLatest();
    super.initState();
  }

  void _onChangeScreenMode() {
    widget.onChangeScreenMode(!widget.fullScreenMode);
  }

  Widget _buildMatrix({
    @required double dividerSize,
    @required double paddingSize,
    @required EdgeInsets titlePadding,
    @required TextStyle titleTextStyle,
    @required bool withBorders,
  }) {
    final dividerColor = Colors.transparent;
    return Scaffold(
      backgroundColor: getCeilTitleColor(context),
      body: SafeArea(
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: _onChangeScreenMode,
              child: Column(
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(paddingSize),
                      child: Text(
                        '',
                        style: titleTextStyle.copyWith(color: Colors.transparent),
                      ),
                    ),
                  ),
                  Expanded(
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: Container(
                        padding: titlePadding,
                        alignment: Alignment.center,
                        child: Text(
                          'Urgent',
                          style: titleTextStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: Container(
                        padding: titlePadding,
                        alignment: Alignment.center,
                        child: Text(
                          'Not Urgent',
                          style: titleTextStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  if (withBorders)
                    Container(
                      padding: titlePadding,
                      child: Text(
                        '',
                        style: titleTextStyle.copyWith(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: _onChangeScreenMode,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: titlePadding,
                            alignment: Alignment.center,
                            child: Text(
                              'Important',
                              style: titleTextStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: titlePadding,
                            alignment: Alignment.center,
                            child: Text(
                              'Not Important',
                              style: titleTextStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                // UrgentImportant
                                child: CubitBuilder<MatrixCubit, MatrixState>(
                                  buildWhen: (previous, state) {
                                    if (state is Initial) {
                                      return true;
                                    }
                                    if (state is Fetched && previous is Fetched) {
                                      return state.matrix.urgentAndImportant !=
                                          previous.matrix.urgentAndImportant;
                                    } else {
                                      return true;
                                    }
                                  },
                                  builder: (context, urgentImportant) {
                                    const ceilType = CeilType.UrgentImportant;
                                    return urgentImportant.when(
                                      initial: () => MatrixCeilLoadingWidget(
                                        ceilType: ceilType,
                                      ),
                                      fetched: (matrix) => MatrixCeilWidget(
                                        ceil: matrix.urgentAndImportant,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                height: dividerSize,
                                color: dividerColor,
                              ),
                              Expanded(
                                // UrgentNotImportant
                                child: CubitBuilder<MatrixCubit, MatrixState>(
                                  buildWhen: (previous, state) {
                                    if (state is Initial) {
                                      return true;
                                    }
                                    if (state is Fetched && previous is Fetched) {
                                      return state.matrix.urgentAndNotImportant !=
                                          previous.matrix.urgentAndNotImportant;
                                    } else {
                                      return true;
                                    }
                                  },
                                  builder: (context, urgentImportant) {
                                    final ceilType = CeilType.UrgentNotImportant;
                                    return urgentImportant.when(
                                      initial: () => MatrixCeilLoadingWidget(
                                        ceilType: ceilType,
                                      ),
                                      fetched: (matrix) => MatrixCeilWidget(
                                        ceil: matrix.urgentAndImportant,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: dividerSize,
                          color: dividerColor,
                        ),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                // UrgentImportant
                                child: CubitBuilder<MatrixCubit, MatrixState>(
                                  buildWhen: (previous, state) {
                                    if (state is Initial) {
                                      return true;
                                    }
                                    if (state is Fetched && previous is Fetched) {
                                      return state.matrix.notUrgentAndImportant !=
                                          previous.matrix.notUrgentAndImportant;
                                    } else {
                                      return true;
                                    }
                                  },
                                  builder: (context, urgentImportant) {
                                    final ceilType = CeilType.NotUrgentImportant;
                                    return urgentImportant.when(
                                      initial: () => MatrixCeilLoadingWidget(
                                        ceilType: ceilType,
                                      ),
                                      fetched: (matrix) => MatrixCeilWidget(
                                        ceil: matrix.urgentAndImportant,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Container(
                                height: dividerSize,
                                color: dividerColor,
                              ),
                              Expanded(
                                // NotUrgentNotImportant
                                child: CubitBuilder<MatrixCubit, MatrixState>(
                                  buildWhen: (previous, state) {
                                    if (state is Initial) {
                                      return true;
                                    }
                                    if (state is Fetched && previous is Fetched) {
                                      return state.matrix.notUrgentAndNotImportant !=
                                          previous.matrix.notUrgentAndNotImportant;
                                    } else {
                                      return true;
                                    }
                                  },
                                  builder: (context, urgentImportant) {
                                    final ceilType = CeilType.NotUrgentNotImportant;
                                    return urgentImportant.when(
                                      initial: () => MatrixCeilLoadingWidget(
                                        ceilType: ceilType,
                                      ),
                                      fetched: (matrix) => MatrixCeilWidget(
                                        ceil: matrix.urgentAndImportant,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (withBorders)
                    Container(
                      padding: titlePadding,
                      child: Text(
                        '',
                        style: titleTextStyle.copyWith(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            if (withBorders)
              RotatedBox(
                quarterTurns: -1,
                child: Container(
                  padding: titlePadding,
                  child: Text(
                    '',
                    style: titleTextStyle.copyWith(
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (PlatformSize.isSmallScreen(context)) {
      final dividerSize = 3.0;
      const paddingSize = 1.5;
      const titlePadding = EdgeInsets.only(top: 0, bottom: paddingSize);
      final titleTextStyle = Theme.of(context).textTheme.subtitle2;
      return _buildMatrix(
        dividerSize: dividerSize,
        paddingSize: paddingSize,
        titlePadding: titlePadding,
        titleTextStyle: titleTextStyle,
        withBorders: false,
      );
    } else {
      final textStyle = DefaultTextStyle.of(context).style;
      if (PlatformSize.isLargeScreen(context)) {
        final dividerSize = 12.0;
        const paddingSize = 20.0;
        const titlePadding = EdgeInsets.only(top: paddingSize, bottom: paddingSize * 0.4);
        final titleTextStyle =
            Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.w600);
        return DefaultTextStyle(
          style: textStyle.copyWith(fontSize: textStyle.fontSize + 2),
          child: _buildMatrix(
            dividerSize: dividerSize,
            paddingSize: paddingSize,
            titlePadding: titlePadding,
            titleTextStyle: titleTextStyle,
            withBorders: true,
          ),
        );
        // Middle screen size
      } else {
        final dividerSize = 15.0;
        const paddingSize = 40.0;
        const titlePadding = EdgeInsets.only(top: paddingSize, bottom: paddingSize * 0.25);
        final titleTextStyle =
            Theme.of(context).textTheme.subtitle1.copyWith(fontWeight: FontWeight.w600);
        return DefaultTextStyle(
          style: textStyle.copyWith(fontSize: textStyle.fontSize + 2),
          child: _buildMatrix(
            dividerSize: dividerSize,
            paddingSize: paddingSize,
            titlePadding: titlePadding,
            titleTextStyle: titleTextStyle,
            withBorders: true,
          ),
        );
      }
    }
  }
}
