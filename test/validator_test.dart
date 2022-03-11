
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rasan_flutter_assessment/data/validation/validator.dart';
import 'package:rasan_flutter_assessment/domain/cubit/form_cubit.dart';
import 'package:rasan_flutter_assessment/main.dart';
import 'package:rasan_flutter_assessment/presentation/color_form_ui.dart';


void main() {
  late FormValidator _validator;
  setUp((){
   _validator = FormValidator();
  });
  tearDown((){});
  group('Form Text Field Validation', () {

    test("test all possible cases for the 1st TextFormField", () {
      expect(_validator.textFormField1Validator("55"), "you must enter characters");
      expect(_validator.textFormField1Validator("aa"), "less than 5 characters");
      expect(_validator.textFormField1Validator("ahmed mohamed"), "more than 9 characters");
      expect(_validator.textFormField1Validator("ahmed12"),null);
    });

    test("test if textFormField2 is visible or not", () {
      expect(_validator.textFormField2State("ahmed"),false);
      expect(_validator.textFormField2State("mohamed"),true);
    });
  });

  testWidgets('Test My Form Widget', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    final myTextField = find.byKey(const Key("TextFormField4"));
    //context.read<FormCubit>().loadSuggestData();
    final titleFinder = find.text('Navigate to new Screen');
    expect(titleFinder, findsOneWidget);
    expect(myTextField, findsOneWidget);
  });
}