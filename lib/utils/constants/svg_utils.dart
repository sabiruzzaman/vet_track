import 'package:flutter/material.dart';

/// সহজে SvgPicture এ রঙ দেওয়ার জন্য colorFilter তৈরি করবে
ColorFilter svgColor(Color color) {
  return ColorFilter.mode(color, BlendMode.srcIn);
}
