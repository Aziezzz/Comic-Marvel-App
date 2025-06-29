import 'package:flutter/material.dart';
import 'package:marvel_comic_app/pages/about_character_pages.dart';
import 'package:marvel_comic_app/pages/favorite_pages.dart'; // Tambahkan import ini
import 'package:marvel_comic_app/pages/profile_pages.dart'; // Tambahkan ini
import 'search_pages.dart';

class HomePages extends StatelessWidget {
  const HomePages({Key? key}) : super(key: key);

  final int _selectedIndex = 0;

  // Data untuk Popular Marvel Characters
  final List<Map<String, String>> popularCharacters = const [
    {'title': 'Iron Man', 'image': 'assets/iron_man.jpg', 'year': '2023'},
    {
      'title': 'Spider-Man',
      'image': 'assets/spiderman_char.jpg',
      'year': '2023'
    },
    {
      'title': 'Captain America',
      'image': 'assets/captain_america.jpg',
      'year': '2023'
    },
    {'title': 'Thor', 'image': 'assets/thor.jpg', 'year': '2023'},
  ];

  // Data untuk Spider-Man Comics
  final List<Map<String, String>> spiderManComics = const [
    {
      'title': 'The Amazing Spider-Man #1',
      'image': 'assets/images/potrait_uncanny.jpg',
      'year': '2023'
    },
    {
      'title': 'Spider-Man: No Way Home',
      'image': 'assets/spiderman_nwh.jpg',
      'year': '2023'
    },
    {
      'title': 'Ultimate Spider-Man',
      'image': 'assets/ultimate_spiderman.jpg',
      'year': '2023'
    },
    {
      'title': 'Spider-Verse',
      'image': 'assets/spider_verse.jpg',
      'year': '2023'
    },
    {
      'title': 'Spider-Man 2099',
      'image': 'assets/spiderman_2099.jpg',
      'year': '2023'
    },
  ];

  // Data untuk Latest Marvel Comics
  final List<Map<String, String>> latestComics = const [
    {
      'title': 'X-Men: Phoenix - Warsong',
      'image': 'assets/phoenix_warsong.jpg',
      'year': '2024'
    },
    {
      'title': 'Avengers: Endgame',
      'image': 'assets/avengers_endgame.jpg',
      'year': '2024'
    },
    {
      'title': 'Doctor Strange: Multiverse',
      'image': 'assets/doctor_strange.jpg',
      'year': '2024'
    },
    {
      'title': 'Guardians of the Galaxy',
      'image': 'assets/guardians.jpg',
      'year': '2024'
    },
    {
      'title': 'Black Panther: Wakanda',
      'image': 'assets/black_panther.jpg',
      'year': '2024'
    },
    {
      'title': 'Thor: Love and Thunder',
      'image': 'assets/thor_lat.jpg',
      'year': '2024'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar custom
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Header di tengah
                const Center(
                  child: Text(
                    "MARVEL",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      letterSpacing: 2.0,
                    ),
                  ),
                ),
                // Welcome text di kiri atas
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Text(
                        'User',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section Popular Marvel Characters
                _buildSectionHeader(
                  'POPULER MARVELS CHARACTER',
                  onSeeAll: () {
                    // Navigate to see all popular characters
                  },
                ),
                const SizedBox(height: 16),
                _buildHorizontalCardList(popularCharacters, isCharacter: true),

                const SizedBox(height: 32),

                // Section Spider-Man Comics
                _buildSectionHeader(
                  'SPIDERMAN COMIC',
                  onSeeAll: () {
                    // Navigate to see all Spider-Man comics
                  },
                ),
                const SizedBox(height: 16),
                _buildHorizontalCardList(spiderManComics, isCharacter: false),

                const SizedBox(height: 32),

                // Section Latest Marvel Comics
                _buildSectionHeader(
                  'LATEST MARVEL COMICS',
                  onSeeAll: () {
                    // Navigate to see all latest comics
                  },
                ),
                const SizedBox(height: 16),
                _buildHorizontalCardList(latestComics, isCharacter: false),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red[800],
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorit",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profil",
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SearchPage()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FavoritePage()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilPages()),
            );
          }
          // Index 0 (Home) tidak perlu navigasi ulang
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title, {required VoidCallback onSeeAll}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        GestureDetector(
          onTap: onSeeAll,
          child: Row(
            children: [
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey[600],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalCardList(List<Map<String, String>> items,
      {required bool isCharacter}) {
    return SizedBox(
      height: 280,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutCharacterPages(
                    characterName: item['title'] ?? '',
                    characterImage: item['image'] ?? '',
                    characterDescription:
                        'Deskripsi untuk ${item['title']}', // Ganti sesuai kebutuhan
                  ),
                ),
              );
            },
            child: ComicCard(
              title: item['title']!,
              imagePath: item['image']!,
              year: item['year']!,
              isCharacter: isCharacter,
            ),
          );
        },
      ),
    );
  }
}

class ComicCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String year;
  final bool isCharacter;

  const ComicCard({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.year,
    this.isCharacter = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Card(
        elevation: 8,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Gambar comic/character
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: isCharacter
                          ? [
                              Colors.blue[800]!,
                              Colors.blue[600]!,
                              Colors.purple[600]!,
                            ]
                          : [
                              Colors.red[800]!,
                              Colors.red[600]!,
                              Colors.orange[600]!,
                            ],
                    ),
                  ),
                  child: Stack(
                    children: [
                      // Placeholder untuk gambar
                      Center(
                        child: Icon(
                          isCharacter ? Icons.person : Icons.menu_book,
                          size: 50,
                          // ignore: deprecated_member_use
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      // Marvel logo di pojok kiri atas
                      Positioned(
                        top: 8,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red[700],
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                // ignore: deprecated_member_use
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(0, 1),
                              ),
                            ],
                          ),
                          child: const Text(
                            'MARVEL',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Bagian text
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          year,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(
                          Icons.favorite_border,
                          size: 16,
                          color: Colors.grey[400],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
