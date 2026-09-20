/// Form validators shared by both apps.
///
/// The two copies had drifted on which phone numbers they accepted: the
/// dashboard took `05`, `01`, `92`, `80` and `70`, the field app only `05`.
/// The union is the safe direction — it can never reject a number that used
/// to be accepted — and the extra prefixes are the landline and toll-free
/// ranges a store or a supplier legitimately has.
class TextFormFieldValidations {
  const TextFormFieldValidations._();

  /// Saudi prefixes: mobile, landline, and the toll-free and paid ranges.
  static const _phonePrefixes = ['05', '01', '92', '80', '70'];

  static String? phoneValidator(String? value) {
    return switch (value) {
      null => 'هذا الحقل مطلوب *',
      _ when !_phonePrefixes.any(value.trim().startsWith) =>
        'رقم الهاتف يجب أن يبدأ ب ${_phonePrefixes.join(' أو ')}',
      _ when value.trim().length != 10 => 'رقم الهاتف يجب أن يحتوي على 10 رقم',
      _ => null,
    };
  }

  static String? requiredValidator(String? value) {
    return switch (value) {
      null => 'هذا الحقل مطلوب *',
      _ when value.trim().isEmpty => 'هذا الحقل مطلوب *',
      _ => null,
    };
  }

  /// Six characters, which is what both apps enforced. The message said eight
  /// in one of them and did not match the check.
  static String? passwordValidator(String? value) {
    return switch (value) {
      null => 'هذا الحقل مطلوب *',
      _ when value.length < 6 => 'كلمة المرور يجب أن تكون على الأقل 6 أحرف',
      _ => null,
    };
  }

  static String? emailValidator(String? value) {
    return switch (value) {
      null => 'هذا الحقل مطلوب *',
      _ when !value.isEmail => 'البريد الإلكتروني غير صالح',
      _ => null,
    };
  }
}

extension EmailFormat on String {
  bool get isEmail => RegExp(r'^\w+@\w+\.\w+').hasMatch(this);
}
