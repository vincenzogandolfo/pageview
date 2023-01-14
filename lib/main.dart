import 'package:flutter/material.dart';
import 'list/splash_page_model.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // Variabile utilizzata per Controllare (controller) la Schermata attuale
  final PageController pageViewController = PageController(initialPage: 0);

  // Variabile che indica l'Indice attuale, inizialmente Zero (0)
  int currentPageIndex = 0;

  // Funzione che Cambia il numero dell' Indice attuale in base alla Schermata
  void onPageChange(int currentPageIndex) {
    setState(() {
      this.currentPageIndex = currentPageIndex;
    });
  }

  // Funzione che Cambia la Schermata in base al Click sul rispettivo Pallino
  void onIndicatorpressed(int indicatorIndexPressed) {
    setState(() {
      pageViewController.jumpToPage(indicatorIndexPressed);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('PageView')),
        ),
        body: Stack(
          children: [
            PageView.builder(
              // Funzione utilizzata per mostrare la Schermata dopo il Click sul Pallino
              controller: pageViewController,
              // Funzione utilizzata per tenere conto del Cambiamento delle Schermate
              onPageChanged: onPageChange,
              // Quantità di Schermate Create
              itemCount: splashPages.length,
              // Rappresentazione Visiva delle Schermate
              itemBuilder: (contex, index) => SplashScreen(splashPages[index]),
            ),
            // Rappresentazione dei Pallini dell' Indice
            Positioned(
                bottom: 100,
                left: 0,
                right: 0,
                child: PageViewIndicators(
                  // Proprietà che Colora di Bianco il Pallino in base all'Indice
                  pageViewIndex: currentPageIndex,
                  // Proprietà che fa Apparire la rispettiva Schermata in base al click sul Pallino
                  onIndicatorPressed: onIndicatorpressed,
                )),
          ],
        ),
      ),
    );
  }
}

// Rappresenta il Modello Base di ogni Schermata
class SplashScreen extends StatelessWidget {
  // Utilizzato per prendere come riferimento l'Indice della Schermata
  final SplashPageModel splashPageModel;
  const SplashScreen(this.splashPageModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        // Prende il Colore in base all' Indice (index)
        color: splashPageModel.backgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
            child: Text(
              // Prende il Titolo in base all' Indice (index)
              splashPageModel.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Rappresenta i Pallini dell' Indice della Pagina
class PageViewIndicators extends StatelessWidget {
  // Variabile utilizzata per Indicare quale Pallino rappresenta l' Indice
  final int pageViewIndex;
  final void Function(int index) onIndicatorPressed;
  const PageViewIndicators({
    required this.pageViewIndex,
    required this.onIndicatorPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        splashPages.length,
        (index) => GestureDetector(
          // Cliccando su un Pallino si va alla rispettiva Schermata
          onTap: () => onIndicatorPressed(index),
          child: Container(
            height: 15,
            width: 15,
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // Se l'Indice del Pallino (pageViewIndex) è uguale all'Indice della Schermata (index)
              // Colora il Pallino di Bianco (white), altrimenti di Trasparente (white54)
              color: pageViewIndex == index ? Colors.white : Colors.white54,
            ),
          ),
        ),
      ),
    );
  }
}
