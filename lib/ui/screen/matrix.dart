import 'package:eisenhower_matrix/bloc/bloc.dart';
import 'package:eisenhower_matrix/models/ceil.dart';
import 'package:eisenhower_matrix/ui/widget/matrix_ceil.dart';
import 'package:flutter/cupertino.dart';
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
        fontSize: 13,
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
                          height: textStyle.fontSize + 4,
                        ),
                        Flexible(
                          flex: 1,
                          child: RotatedBox(
                            quarterTurns: -1,
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 1),
                              alignment: Alignment.center,
                              color: CupertinoColors.systemRed,
                              child: Text(
                                'Important',
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
                              color: CupertinoColors.activeGreen,
                              child: Text(
                                'Not Important',
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
                              Flexible(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 1),
                                  alignment: Alignment.center,
                                  color: CupertinoColors.systemRed,
                                  child: Text(
                                    'Urgent',
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
                                  color: Colors.blue[400],
                                  child: Text(
                                    'Not Urgent',
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
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
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
                                      Expanded(
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
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
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
                                      Expanded(
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
