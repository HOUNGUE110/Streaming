import 'package:flutter/material.dart';
import 'albumStream.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MonApplication(),
    );
  }
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vos émissions en streaming', style: TextStyle()),
        centerTitle: true,
        backgroundColor: Colors.amber,
        leading: IconButton(
          icon: const Icon(Icons.search, color: Colors.blueGrey),
          tooltip: 'Rechercher',
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            tooltip: 'Liste de diffusion',
            onPressed: () {},
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.blue),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.blue),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.blue),
            label: 'Profil',
          ),
        ],
      ),
      body: const partieGrilleImage(),
    );
  }
}

class IdentificationStreaming extends StatelessWidget {
  final String tagStream;
  final String imageStream;
  final String NomStream;
  final String ChaineRadio;
  final String descriptionDetaillee;

  const IdentificationStreaming({
    super.key,
    required this.tagStream,
    required this.imageStream,
    required this.NomStream,
    required this.ChaineRadio,
    required this.descriptionDetaillee,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumStreaming(
              tagStream: tagStream,
              imageStream: imageStream,
              NomStream: NomStream,
              ChaineRadio: ChaineRadio,
              descriptionDetaillee: descriptionDetaillee,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: tagStream,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imageStream,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 150,
                    color: Colors.grey[200],
                    alignment: Alignment.center,
                    child: const Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            NomStream,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            ChaineRadio,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class partieGrilleImage extends StatelessWidget {
  const partieGrilleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        12.0,
      ), // Ajout de la marge autour de la grille
      child: ResponsiveGridList(
        minItemWidth: 150,
        children: const [
          IdentificationStreaming(
            tagStream: 'Stream1',
            imageStream: 'img/image1.jpg',
            NomStream: 'Documentaire',
            ChaineRadio: 'Radio 4',
            descriptionDetaillee:
                'Une série captivante sur les mystères de la nature sauvage et les expéditions oubliées, avec des images spectaculaires.',
          ),
          IdentificationStreaming(
            tagStream: 'Stream2',
            imageStream: 'img/image2.jpg',
            NomStream: 'Tendances Mode',
            ChaineRadio: 'Radio 3',
            descriptionDetaillee:
                'Les derniers défilés de Paris et Milan analysés par nos experts. Ne manquez pas les conseils de stylisme et les interviews exclusives avec les créateurs du moment !',
          ),
          IdentificationStreaming(
            tagStream: 'Stream3',
            imageStream: 'img/image3.jpeg',
            NomStream: 'Enquêtes criminelles',
            ChaineRadio: 'Radio 2',
            descriptionDetaillee:
                'Plongez au cœur des affaires non résolues et des méthodes de la police scientifique. Une exploration glaçante des motivations humaines.',
          ),
          IdentificationStreaming(
            tagStream: 'Stream4',
            imageStream: 'img/image4.jpeg',
            NomStream: 'Match de Foot',
            ChaineRadio: 'Radio 5',
            descriptionDetaillee:
                'Le grand match de la semaine en direct ! Analyses d\'avant-match et commentaires exclusifs avec nos légendes du football mondial.',
          ),
          IdentificationStreaming(
            tagStream: 'Stream5',
            imageStream: 'img/image5.jpg',
            NomStream: 'Streaming Météo',
            ChaineRadio: 'Radio 1',
            descriptionDetaillee:
                'Le bulletin météo complet avec des prévisions à 7 jours, l\'évolution des phénomènes climatiques majeurs et l\'impact sur votre région.',
          ),
          IdentificationStreaming(
            tagStream: 'Stream6',
            imageStream: 'img/image6.jpg',
            NomStream: 'Que des News',
            ChaineRadio: 'Radio 4',
            descriptionDetaillee:
                'Toute l\'actualité politique, économique et internationale condensée en 30 minutes. L\'information sans détour, analysée par nos journalistes.',
          ),
        ],
      ),
    );
  }
}
