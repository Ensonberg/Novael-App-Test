import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novael/core/extensions/ui_extension.dart';

import 'core/routes/router.dart';
import 'core/styles/colors/color_pallet.dart';
import 'l10n/app_localizations.dart';

/// Main example app class
class RootApp extends StatelessWidget {
  /// Default constructor for Example app
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: ((ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      ColorScheme lightColorScheme;
      ColorScheme darkColorScheme;

      if (lightDynamic != null && darkDynamic != null) {
        // On Android S+ devices, use the provided dynamic color scheme.
        // (Recommended) Harmonize the dynamic color scheme' built-in semantic colors.
        lightColorScheme = lightDynamic.harmonized();
        // (Optional) Customize the scheme as desired. For example, one might
        // want to use a brand color to override the dynamic [ColorScheme.secondary].
        lightColorScheme = ColorPalette.lightColorScheme;
        // (Optional) If applicable, harmonize custom colors.
        // lightCustomColors = lightCustomColors.harmonized(lightColorScheme);

        // Repeat for the dark color scheme.
        darkColorScheme = darkDynamic.harmonized();
        darkColorScheme = ColorPalette.darkColorScheme;
      } else {
        // Otherwise, use fallback schemes.
        lightColorScheme = ColorPalette.lightColorScheme;
        darkColorScheme = ColorPalette.darkColorScheme;
      }
      return ScreenUtilInit(
          designSize: const Size(414, 896),
          //  minTextAdapt: true,
          splitScreenMode: true,
          builder: (child, widget) {
            return MaterialApp.router(
              // title: F.title,

              debugShowCheckedModeBanner: false,
              title: "Novael",

              theme: ThemeData(
                useMaterial3: true,
                fontFamily: GoogleFonts.sourceSansPro().fontFamily,
                // brightness: Brightness.light,
                colorScheme: lightColorScheme,
                // extensions: [lightCustomColors],
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                brightness: Brightness.dark,
                colorScheme: darkColorScheme,
                //  extensions: [darkCustomColors],
              ),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              routeInformationParser: router.routeInformationParser,
              routerDelegate: router.routerDelegate,
              routeInformationProvider: router.routeInformationProvider,
            );
          });
    }));
  }
}

// @immutable
// class CustomColors extends ThemeExtension<CustomColors> {
//   const CustomColors({
//     required this.danger,
//   });
//
//   final Color? danger;
//
//   @override
//   CustomColors copyWith({Color? danger}) {
//     return CustomColors(
//       danger: danger ?? this.danger,
//     );
//   }
//
//   @override
//   CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
//     if (other is! CustomColors) {
//       return this;
//     }
//     return CustomColors(
//       danger: Color.lerp(danger, other.danger, t),
//     );
//   }
//
//   CustomColors harmonized(ColorScheme dynamic) {
//     return copyWith(danger: danger!.harmonizeWith(dynamic.primary));
//   }
// }
