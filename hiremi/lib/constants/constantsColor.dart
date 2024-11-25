import 'package:flutter/material.dart';

class AppColors {
  static List<Color> createGradient(Color darker, Color lighter) => [
        darker,
        Colors.white,
        lighter,
      ];

  static final Map<String, List<Color>> gradients = {
    'askExpert': createGradient(Color(0xFF9CCAFF), Color(0xFFCCE4FF)),
    'internship': createGradient(Color(0xFF8DDDB8), Color(0xFFCCEEDE)),
    'status': createGradient(Color(0xFFFFAAAA), Color(0xFFFFD6D6)),
    'freshers': createGradient(Color(0xFFFFBB8E), Color(0xFFFFE1D1)),
    'hiremi360': createGradient(Color(0xFFFFDB8E), Color(0xFFFFEED1)),
    'experience': createGradient(Color(0xFFC4A6FF), Color(0xFFE6D9FF)),
  };
}
