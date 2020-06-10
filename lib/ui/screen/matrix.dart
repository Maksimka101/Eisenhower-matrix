import 'package:eisenhower_matrix/bloc/bloc.dart';
import 'package:eisenhower_matrix/models/ceil.dart';
import 'package:eisenhower_matrix/ui/widget/matrix_ceil.dart';
import 'package:eisenhower_matrix/utils/matrix_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class MatrixScreen extends StatefulWidget {
  @override
  _MatrixScreenState createState() => _MatrixScreenState();
}

class _MatrixScreenState extends State<MatrixScreen> {
  Widget _unknownState(Object state, BuildContext context) => Center(
        child: Column(
          children: <Widget>[Icon(PlatformIcons(context).info), Text('Unknown state: $state')],
        ),
      );

  @override
  void initState() {
    BlocProvider.of<MatrixBloc>(context).add(MatrixLatestFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = DefaultTextStyle.of(context).style;
    return DefaultTextStyle(
      style: TextStyle(
        fontSize: textStyle.fontSize - 2,
        height: 1,
      ),
      child: PlatformScaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Flexible(
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(
                          height: textStyle.fontSize,
                          width: textStyle.fontSize,
                        ),
                        Flexible(
                          flex: 1,
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 1),
                              alignment: Alignment.center,
                              color: getCeilTitleColor(CeilType.UrgentImportant),
                              child: Text(
                                'Urgent',
                                style: TextStyle(color: Colors.white),
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
                              padding: EdgeInsets.symmetric(vertical: 1),
                              alignment: Alignment.center,
                              color: getCeilTitleColor(CeilType.UrgentNotImportant),
                              child: Text(
                                'Not Urgent',
                                style: TextStyle(color: Colors.white),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 1),
                                  alignment: Alignment.center,
                                  color: getCeilTitleColor(CeilType.UrgentImportant),
                                  child: Text(
                                    'Important',
                                    style: TextStyle(color: Colors.white),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 1),
                                  alignment: Alignment.center,
                                  color: getCeilTitleColor(CeilType.NotUrgentImportant),
                                  child: Text(
                                    'Not Important',
                                    style: TextStyle(color: Colors.white),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  child: Column(
                                    children: <Widget>[
                                      Flexible(
                                        // UrgentImportant
                                        child: BlocBuilder<MatrixBloc, MatrixState>(
                                          condition: (previous, state) {
                                            if (state is MatrixInitial) {
                                              return true;
                                            }
                                            if (state is MatrixFetched &&
                                                previous is MatrixFetched) {
                                              return state.matrix.urgentAndImportant !=
                                                  previous.matrix.urgentAndImportant;
                                            } else {
                                              return true;
                                            }
                                          },
                                          builder: (context, urgentImportant) {
                                            final ceilType = CeilType.UrgentImportant;
                                            switch (urgentImportant.runtimeType) {
                                              case MatrixInitial:
                                                return MatrixCeilWidget(
                                                  ceil: Ceil(type: ceilType, items: []),
                                                );
                                              case MatrixFetched:
                                                return MatrixCeilWidget(
                                                  ceil: (urgentImportant as MatrixFetched)
                                                      .matrix
                                                      .urgentAndImportant,
                                                );
                                              default:
                                                return _unknownState(urgentImportant, context);
                                            }
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        // UrgentNotImportant
                                        child: BlocBuilder<MatrixBloc, MatrixState>(
                                          condition: (previous, state) {
                                            if (state is MatrixInitial) {
                                              return true;
                                            }
                                            if (state is MatrixFetched &&
                                                previous is MatrixFetched) {
                                              return state.matrix.urgentAndNotImportant !=
                                                  previous.matrix.urgentAndNotImportant;
                                            } else {
                                              return true;
                                            }
                                          },
                                          builder: (context, urgentImportant) {
                                            final ceilType = CeilType.UrgentNotImportant;
                                            switch (urgentImportant.runtimeType) {
                                              case MatrixInitial:
                                                return MatrixCeilWidget(
                                                  ceil: Ceil(type: ceilType, items: []),
                                                );
                                              case MatrixFetched:
                                                return MatrixCeilWidget(
                                                  ceil: (urgentImportant as MatrixFetched)
                                                      .matrix
                                                      .urgentAndNotImportant,
                                                );
                                              default:
                                                return _unknownState(urgentImportant, context);
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  child: Column(
                                    children: <Widget>[
                                      Flexible(
                                        // UrgentImportant
                                        child: BlocBuilder<MatrixBloc, MatrixState>(
                                          condition: (previous, state) {
                                            if (state is MatrixInitial) {
                                              return true;
                                            }
                                            if (state is MatrixFetched &&
                                                previous is MatrixFetched) {
                                              return state.matrix.notUrgentAndImportant !=
                                                  previous.matrix.notUrgentAndImportant;
                                            } else {
                                              return true;
                                            }
                                          },
                                          builder: (context, urgentImportant) {
                                            final ceilType = CeilType.NotUrgentImportant;
                                            switch (urgentImportant.runtimeType) {
                                              case MatrixInitial:
                                                return MatrixCeilWidget(
                                                  ceil: Ceil(type: ceilType, items: []),
                                                );
                                              case MatrixFetched:
                                                return MatrixCeilWidget(
                                                  ceil: (urgentImportant as MatrixFetched)
                                                      .matrix
                                                      .notUrgentAndImportant,
                                                );
                                              default:
                                                return _unknownState(urgentImportant, context);
                                            }
                                          },
                                        ),
                                      ),
                                      Flexible(
                                        // NotUrgentNotImportant
                                        child: BlocBuilder<MatrixBloc, MatrixState>(
                                          condition: (previous, state) {
                                            if (state is MatrixInitial) {
                                              return true;
                                            }
                                            if (state is MatrixFetched &&
                                                previous is MatrixFetched) {
                                              return state.matrix.notUrgentAndNotImportant !=
                                                  previous.matrix.notUrgentAndNotImportant;
                                            } else {
                                              return true;
                                            }
                                          },
                                          builder: (context, urgentImportant) {
                                            final ceilType = CeilType.NotUrgentNotImportant;
                                            switch (urgentImportant.runtimeType) {
                                              case MatrixInitial:
                                                return MatrixCeilWidget(
                                                  ceil: Ceil(type: ceilType, items: []),
                                                );
                                              case MatrixFetched:
                                                return MatrixCeilWidget(
                                                  ceil: (urgentImportant as MatrixFetched)
                                                      .matrix
                                                      .notUrgentAndNotImportant,
                                                );
                                              default:
                                                return _unknownState(urgentImportant, context);
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
