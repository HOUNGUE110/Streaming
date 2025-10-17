import 'package:flutter/material.dart';

class AlbumStreaming extends StatelessWidget {
  final String tagStream;
  final String imageStream;
  final String NomStream;
  final String ChaineRadio;
  final String descriptionDetaillee;

  const AlbumStreaming({
    super.key,
    required this.tagStream,
    required this.imageStream,
    required this.NomStream,
    required this.ChaineRadio,
    required this.descriptionDetaillee,
  });

  @override
  Widget build(BuildContext context) {
    final double imageHeight = MediaQuery.of(context).size.height * 0.5;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(111, 0, 0, 0),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          splashColor: Colors.cyanAccent,
          tooltip: 'Retour',
          highlightColor: Colors.cyan.withOpacity(0.3),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: 'Likee',
            splashColor: Colors.cyanAccent,
            highlightColor: Colors.cyan.withOpacity(0.3),
            icon: const Icon(Icons.favorite, color: Colors.white),
          ),
        ],
      ),

      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: imageHeight,
            child: Hero(
              tag: tagStream,
              child: Image.asset(
                imageStream,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[900],
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.broken_image,
                      size: 80,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),

          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: imageHeight),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.indigo.shade900.withOpacity(0.9),
                        Colors.black,
                      ],
                      stops: const [0.0, 0.4],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        NomStream,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Chaîne : $ChaineRadio",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.indigo.shade200,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const Icon(Icons.speaker, color: Colors.white, size: 24),
                      const SizedBox(width: 10),
                      const Text(
                        "Au programme :",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    descriptionDetaillee,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.4,
                      color: Colors.white70,
                    ),
                  ),
                ),

                const SizedBox(height: 150),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
