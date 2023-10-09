import 'set_selected.welltested_test.mocks.dart';
import 'package:expense_manager/Backend/Appwrite_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';


@GenerateMocks([data_base])
void main() {
  late data_base database;

  setUp(() {
    database = Mockdata_base();
  });

  test('set_selected with true value', () {
    bool notifyListenersCalled = false;
    database.addListener(() => {notifyListenersCalled = true});

    database.set_selected(true);

    verify(database.set_selected(true)).called(1);
    expect(database.selected, true);
    expect(notifyListenersCalled, true);
  });

  test('set_selected with false value', () {
    bool notifyListenersCalled = false;
    database.addListener(() => {notifyListenersCalled = true});

    database.set_selected(false);

    verify(database.set_selected(false)).called(1);
    expect(database.selected, false);
    expect(notifyListenersCalled, true);
  });
}