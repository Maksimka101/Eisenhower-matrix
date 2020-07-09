import 'dart:async';

import 'package:eisenhower_matrix/models/models.dart';
import 'package:eisenhower_matrix/models/user.dart';
import 'package:eisenhower_matrix/repository/mock_repository/matrix_local_repository.dart';
import 'package:eisenhower_matrix/repository/mock_repository/matrix_web_repository.dart';
import 'package:eisenhower_matrix/repository/mock_repository/user_local_repository.dart';
import 'package:eisenhower_matrix/repository/mock_repository/user_sign_in_repository.dart';
import 'package:eisenhower_matrix/repository/repository.dart';
import 'package:eisenhower_matrix/utils/connection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final defaultUrgImpItem = CeilItem(
    id: 'id1',
    ceilType: CeilType.UrgentImportant,
    title: 'title',
    index: 0,
    doneInfo: DoneInfo(done: false),
  );
  final defaultUrgNotImpItem = CeilItem(
    id: 'id2',
    ceilType: CeilType.UrgentNotImportant,
    title: 'title',
    index: 1,
    doneInfo: DoneInfo(done: false),
  );
  final defaultNotUrgNotImpItem = CeilItem(
    id: 'id3',
    ceilType: CeilType.NotUrgentNotImportant,
    title: 'title',
    index: 2,
    doneInfo: DoneInfo(done: false),
  );
  final defaultNotUrgImpItem = CeilItem(
    id: 'id4',
    ceilType: CeilType.NotUrgentImportant,
    title: 'title',
    index: 3,
    doneInfo: DoneInfo(done: false),
  );

  group('Test save, delete and fetch in offline', () {
    final connectionStream = StreamController<bool>();
    final connection = MockConnectivityConnection(
      connected: false,
      connectionStream: connectionStream,
    );

    test('Test save', () async {
      final matrixRepository = mockMatrixRepository(
          userRepository:
              mockUserRepository(connection: connection, signed: true, anonymously: false),
          connection: connection,
          localMatrix: Matrix.empty(),
          webMatrix: Matrix.empty(),
          unSyncCeilItems: [],
          unSyncDeletedItems: []);

      // subscribe on first matrix change
      var lastFetchedMatrix = matrixRepository.matrixStream.first;

      // change matrix
      await matrixRepository.saveCeilItem(defaultUrgImpItem);

      // wait for subscribed matrix and compare with expected
      expect(
          (await lastFetchedMatrix),
          Matrix.fromCeilItems([
            defaultUrgImpItem,
          ]));

      lastFetchedMatrix = matrixRepository.matrixStream.first;

      await matrixRepository.saveCeilItem(defaultNotUrgImpItem);

      expect(
          await lastFetchedMatrix,
          Matrix.fromCeilItems([
            defaultUrgImpItem,
            defaultNotUrgImpItem,
          ]));

      lastFetchedMatrix = matrixRepository.matrixStream.first;

      await matrixRepository.saveCeilItem(defaultNotUrgNotImpItem);

      expect(
          await lastFetchedMatrix,
          Matrix.fromCeilItems([
            defaultUrgImpItem,
            defaultNotUrgImpItem,
            defaultNotUrgNotImpItem,
          ]));

      lastFetchedMatrix = matrixRepository.matrixStream.first;

      await matrixRepository.saveCeilItem(defaultUrgNotImpItem);

      expect(
          await lastFetchedMatrix,
          Matrix.fromCeilItems([
            defaultUrgImpItem,
            defaultNotUrgImpItem,
            defaultNotUrgNotImpItem,
            defaultUrgNotImpItem,
          ]));
    });
  });

  group('Test save, delete and fetch in online', () {});
}

/// Fast way to mock matrix repository with full customization
MatrixRepository mockMatrixRepository({
  @required UserRepository userRepository,
  @required Connection connection,
  @required Matrix localMatrix,
  @required Matrix webMatrix,
  @required List<String> unSyncCeilItems,
  @required List<String> unSyncDeletedItems,
}) {
  return MatrixRepository(
    idGenerator: (item) => item.id,
    connection: connection,
    userRepository: userRepository,
    matrixWebRepository: MockMatrixWebRepository(
      matrix: webMatrix,
    ),
    matrixLocalRepository: MockMatrixLocalRepository(
        matrix: localMatrix,
        unSyncCeilItem: unSyncCeilItems,
        unSyncDeletedCeilItem: unSyncDeletedItems),
  );
}

/// Fast way to mock user repository with large customization and less code
UserRepository mockUserRepository(
    {@required Connection connection, @required bool signed, @required bool anonymously}) {
  final user = signed
      ? User(
          id: '',
          name: '',
          signInProvider: anonymously ? SignInProvider.Anonymous : SignInProvider.Google)
      : null;
  return UserRepository(
    connection: connection,
    userSignInRepository: MockUserSignInRepository(user: user),
    userLocalRepository: MockUserLocalRepository(user: user, signSynced: true),
  );
}
