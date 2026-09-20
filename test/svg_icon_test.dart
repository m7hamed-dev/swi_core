import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swi_core/swi_core.dart';

/// The icon used to read its tint from a Riverpod provider inside the app.
/// It now reads the ambient theme, so these pin that it still lands on the
/// right colour on both sides — and that a wrong theme brightness would show
/// up here rather than on a user's screen.
void main() {
  Future<SvgPictureFinder> tint(WidgetTester tester, {required Brightness brightness, Color? color}) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue, brightness: brightness)),
        home: Scaffold(body: SvgIcon(icon: 'assets/x.svg', color: color)),
      ),
    );
    return SvgPictureFinder(tester);
  }

  testWidgets('a light theme tints the icon with the dark ink', (tester) async {
    final found = await tint(tester, brightness: Brightness.light);
    expect(found.filterColor, AppColors.black);
  });

  testWidgets('a dark theme tints it with the light ink', (tester) async {
    final found = await tint(tester, brightness: Brightness.dark);
    expect(found.filterColor, AppColors.white);
  });

  testWidgets('an explicit colour beats the theme', (tester) async {
    final found = await tint(tester, brightness: Brightness.dark, color: AppColors.red);
    expect(found.filterColor, AppColors.red);
  });

  testWidgets('usingOriginalColor applies no filter at all', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: SvgIcon(icon: 'assets/x.svg', usingOriginalColor: true)),
      ),
    );
    expect(SvgPictureFinder(tester).colorFilter, isNull);
  });

  testWidgets('an empty path draws nothing rather than throwing', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SvgIcon(icon: ''))));

    expect(find.byType(SizedBox), findsWidgets);
    expect(tester.takeException(), isNull);
  });

  testWidgets('the override wins over a mismatched ambient theme', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
        home: const Scaffold(body: SvgIcon(icon: 'assets/x.svg', isDarkMode: true)),
      ),
    );
    expect(SvgPictureFinder(tester).filterColor, AppColors.white);
  });
}

/// Reads the colour filter off the rendered `SvgPicture`.
class SvgPictureFinder {
  SvgPictureFinder(this.tester);

  final WidgetTester tester;

  ColorFilter? get colorFilter {
    final widgets = tester.widgetList(find.byType(SvgIcon));
    if (widgets.isEmpty) return null;
    final picture = tester.widgetList(find.byWidgetPredicate((w) => w.runtimeType.toString() == 'SvgPicture'));
    if (picture.isEmpty) return null;
    return (picture.first as dynamic).colorFilter as ColorFilter?;
  }

  Color? get filterColor {
    final filter = colorFilter;
    if (filter == null) return null;
    // ColorFilter.mode prints as `ColorFilter.mode(Color(...), BlendMode.srcIn)`.
    final match = RegExp(r'0x([0-9a-fA-F]{8})').firstMatch(filter.toString());
    if (match != null) return Color(int.parse(match.group(1)!, radix: 16));
    final alpha = RegExp(r'alpha: ([\d.]+), red: ([\d.]+), green: ([\d.]+), blue: ([\d.]+)')
        .firstMatch(filter.toString());
    if (alpha == null) return null;
    int c(int g) => (double.parse(alpha.group(g)!) * 255).round();
    return Color.fromARGB(c(1), c(2), c(3), c(4));
  }
}
