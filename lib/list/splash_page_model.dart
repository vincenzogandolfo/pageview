import 'package:flutter/material.dart';

// Rappresenta una Lista di 5 Componenti formati da Testo e Colore
class SplashPageModel {
  final String title;
  final Color backgroundColor;

  const SplashPageModel({required this.title, required this.backgroundColor});
}

final splashPages = [
  SplashPageModel(
    title: 'Pagina 1',
    backgroundColor: Colors.redAccent,
  ),
  SplashPageModel(
    title: 'Pagina 2',
    backgroundColor: Colors.greenAccent,
  ),
  SplashPageModel(
    title: 'Pagina 3',
    backgroundColor: Colors.purpleAccent,
  ),
  SplashPageModel(
    title: 'Pagina 4',
    backgroundColor: Colors.blueAccent,
  ),
  SplashPageModel(
    title: 'Pagina 5',
    backgroundColor: Colors.black,
  ),
];
