import 'package:app/common/themes/color_schemes.g.dart';
import 'package:flutter/material.dart';

const LIGHT_BG = Color(0xFFFDFDF5);
const DARK_BG = Color(0xFF1A1C18);
const LIGHT_TEXT = Color(0xFF1A1C18);
const DARK_TEXT = Color(0xFFE3E3DC);
const LIGHT_PRIMARY = Color(0xFF396A1E);
const DARK_PRIMARY = Color(0xFF9ED67D);
const LIGHT_OUTLINE = Color(0xFF74796D);
const DARK_OUTLINE = Color(0xFF8D9286);

var customThemeMode = ThemeMode.system;
var lightThemeData = ThemeData(
  useMaterial3: true,
  colorScheme: lightColorScheme,
  textTheme: lightTextTheme,
  fontFamily: 'Pretendard',
);
var darkThemeData = ThemeData(
  useMaterial3: true,
  colorScheme: darkColorScheme,
  textTheme: darkTextTheme,
  fontFamily: 'Pretendard',
);
var lightTextStyle = const TextStyle(
    fontFamily: 'Pretendard', color: LIGHT_TEXT, fontSize: 13.0);
var darkTextStyle = lightTextStyle.copyWith(
  color: DARK_TEXT,
);
var lightTextTheme = const TextTheme(
  headline1: TextStyle(
    fontSize: 30.0,
    color: LIGHT_TEXT,
    fontWeight: FontWeight.w800,
  ),
  headline2: TextStyle(
    fontSize: 25.0,
    color: LIGHT_TEXT,
    fontWeight: FontWeight.w700,
  ),
  headline3: TextStyle(
    fontSize: 20.0,
    color: LIGHT_TEXT,
    fontWeight: FontWeight.w600,
  ),
  subtitle1: TextStyle(
    fontSize: 25.0,
    color: LIGHT_OUTLINE,
    fontWeight: FontWeight.w600,
  ),
  subtitle2: TextStyle(
    fontSize: 20.0,
    color: LIGHT_OUTLINE,
    fontWeight: FontWeight.w500,
  ),
  bodyText1: TextStyle(
    fontSize: 14.0,
    color: LIGHT_TEXT,
  ),
  bodyText2: TextStyle(
    fontSize: 10.0,
    color: LIGHT_TEXT,
  ),
  caption: TextStyle(
    fontSize: 13.0,
    color: LIGHT_TEXT,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w700,
  ),
);

var darkTextTheme = const TextTheme(
  headline1: TextStyle(
    fontSize: 30.0,
    color: DARK_TEXT,
    fontWeight: FontWeight.w800,
  ),
  headline2: TextStyle(
    fontSize: 25.0,
    color: DARK_TEXT,
    fontWeight: FontWeight.w700,
  ),
  headline3: TextStyle(
    fontSize: 20.0,
    color: DARK_TEXT,
    fontWeight: FontWeight.w600,
  ),
  subtitle1: TextStyle(
    fontSize: 25.0,
    color: DARK_OUTLINE,
    fontWeight: FontWeight.w600,
  ),
  subtitle2: TextStyle(
    fontSize: 20.0,
    color: DARK_OUTLINE,
    fontWeight: FontWeight.w500,
  ),
  bodyText1: TextStyle(
    fontSize: 14.0,
    color: DARK_TEXT,
  ),
  bodyText2: TextStyle(
    fontSize: 10.0,
    color: DARK_TEXT,
  ),
  caption: TextStyle(
    fontSize: 13.0,
    color: DARK_TEXT,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w700,
  ),
);

var lightInput = InputDecoration(
  focusColor: lightColorScheme.secondary,
  isCollapsed: true,
  iconColor: lightColorScheme.primary,
  prefixIconColor: lightColorScheme.primary,
  suffixIconColor: lightColorScheme.primary,
  contentPadding: const EdgeInsets.all(16.0),
  errorMaxLines: 1,
  hintStyle: TextStyle(
    color: LIGHT_OUTLINE,
    fontSize: 13.0,
  ),
  errorStyle: TextStyle(
    color: lightColorScheme.error,
    fontSize: 12.0,
  ),
  fillColor: DARK_TEXT,
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: lightColorScheme.primary,
      width: 1.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: lightColorScheme.primaryContainer,
      width: 1.0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: lightColorScheme.primary,
      width: 1.0,
    ),
  ),
);
var darkInput = lightInput.copyWith(
  focusColor: darkColorScheme.secondary,
  iconColor: darkColorScheme.primary,
  prefixIconColor: darkColorScheme.primary,
  suffixIconColor: darkColorScheme.primary,
  fillColor: LIGHT_TEXT,
  hintStyle: lightInput.hintStyle!.copyWith(
    color: DARK_OUTLINE,
  ),
  errorStyle: lightInput.errorStyle!.copyWith(
    color: darkColorScheme.primary,
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: darkColorScheme.primary,
      width: 1.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: darkColorScheme.primaryContainer,
      width: 1.0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: darkColorScheme.primary,
      width: 1.0,
    ),
  ),
);
