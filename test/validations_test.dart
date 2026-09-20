import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swi_core/swi_core.dart';

/// The two apps disagreed on which phone numbers to accept. These pin the
/// union that replaced both.
void main() {
  group('phoneValidator', () {
    test('accepts every Saudi prefix the two apps between them allowed', () {
      for (final prefix in ['05', '01', '92', '80', '70']) {
        expect(
          TextFormFieldValidations.phoneValidator('${prefix}12345678'),
          isNull,
          reason: '$prefix used to be accepted by at least one app',
        );
      }
    });

    test('rejects a prefix neither app allowed', () {
      expect(TextFormFieldValidations.phoneValidator('0312345678'), isNotNull);
    });

    test('holds the length at ten digits', () {
      expect(TextFormFieldValidations.phoneValidator('0512345'), contains('10'));
      expect(TextFormFieldValidations.phoneValidator('05123456789'), contains('10'));
    });

    test('tolerates surrounding whitespace', () {
      expect(TextFormFieldValidations.phoneValidator('  0512345678  '), isNull);
    });

    test('a null value is a missing required field', () {
      expect(TextFormFieldValidations.phoneValidator(null), contains('مطلوب'));
    });
  });

  group('other validators', () {
    test('required rejects blank and whitespace-only input', () {
      expect(TextFormFieldValidations.requiredValidator(null), isNotNull);
      expect(TextFormFieldValidations.requiredValidator('   '), isNotNull);
      expect(TextFormFieldValidations.requiredValidator('وحدة'), isNull);
    });

    test('the password message now matches the length it checks', () {
      expect(TextFormFieldValidations.passwordValidator('12345'), contains('6'));
      expect(TextFormFieldValidations.passwordValidator('123456'), isNull);
    });

    test('email', () {
      expect(TextFormFieldValidations.emailValidator('moh@example.com'), isNull);
      expect(TextFormFieldValidations.emailValidator('moh@example'), isNotNull);
      expect('moh@example.com'.isEmail, isTrue);
    });
  });

  test('the primary is the colour the logo uses', () {
    expect(AppColors.primary, const Color(0xFF014ED7));
    expect(AppColors.buttonPrimary, AppColors.primary);
  });
}
