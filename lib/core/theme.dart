import 'package:flutter/material.dart';

var lightTheme = ThemeData(
    textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
            color: Color.fromARGB(255, 58, 58, 58)
        ),
        titleMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
            color: Color.fromARGB(255, 167, 167, 167)
        ),
        labelLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Roboto',
            color: Colors.white
        ),
      labelSmall: TextStyle(
        color: Color.fromARGB(255, 207, 207, 207)
      )
    ),
    filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 5, 96, 250),
            disabledBackgroundColor: Color.fromARGB(255, 167, 167, 167),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)
            )
        )
    )
);

var darkTheme = ThemeData(
    textTheme: TextTheme(
        titleLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
            color: Color.fromARGB(255, 58, 58, 58)
        ),
        titleMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Roboto',
            color: Color.fromARGB(255, 167, 167, 167)
        ),
        labelMedium: TextStyle(
            color: Color.fromARGB(255, 5, 96, 250)
        ),
        labelLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            fontFamily: 'Roboto',
            color: Colors.white
        )
    ),
    filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 5, 96, 250),
            disabledBackgroundColor: Color.fromARGB(255, 167, 167, 167),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)
            )
        )
    )
);