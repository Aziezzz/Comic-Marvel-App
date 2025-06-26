import 'package:flutter/material.dart';
import 'search_pages.dart';

class HomePages extends StatelessWidget {
  const HomePages({Key? key}) : super(key: key);

  final int _selectedIndex = 0;

  // Data comics sesuai dengan gambar
  final List<Map<String, String>> comics = const [
    {
      'title': 'Official Handbook of the Marvel Universe Master Edition',
      'image': 'assets/marvel_handbook_1.jpg',
      'year': '2023'
    },
    {
      'title': 'Official Handbook of the Marvel Universe: Marvel Knights',
      'image': 'assets/marvel_knights.jpg',
      'year': '2023'
    },
    {
      'title': 'X-Men: Phoenix - Warsong (2006)',
      'image': 'assets/phoenix_warsong.jpg',
      'year': '2006'
    },
    {
      'title': 'Official Handbook of the Marvel Universe A to Z',
      'image': 'assets/marvel_handbook_2.jpg',
      'year': '2023'
    },
    {
      'title': 'Marvel Comics Presents',
      'image': 'assets/marvel_presents.jpg',
      'year': '2023'
    },
    {
      'title': 'The Amazing Spider-Man',
      'image': 'assets/spiderman.jpg',
      'year': '2023'
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
                    "Marvel Comics",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
                // Profil di kiri atas
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey[300]!,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.grey[200],
                      child: ClipOval(
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.blue[400]!,
                                Colors.blue[600]!,
                              ],
                            ),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.grey[50],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 kolom seperti di gambar
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.7, // Rasio tinggi lebih besar dari lebar
            ),
            itemCount: comics.length,
            itemBuilder: (context, index) {
              return ComicCard(
                title: comics[index]['title']!,
                imagePath: comics[index]['image']!,
                year: comics[index]['year']!,
              );
            },
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
          // Tambahkan navigasi lain jika diperlukan
        },
      ),
    );
  }
}

class ComicCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String year;

  const ComicCard({
    Key? key,
    required this.title,
    required this.imagePath,
    required this.year,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Gambar comic
          Expanded(
            flex: 4,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.red[800]!,
                      Colors.red[600]!,
                      Colors.orange[600]!,
                    ],
                  ),
                ),
                child: Stack(
                  children: [
                    // Placeholder untuk gambar comic
                    SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Icon(
                        Icons.menu_book,
                        size: 60,
                        // ignore: deprecated_member_use
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    // Marvel logo di pojok kiri atas
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red[700],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'MARVEL',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
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
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    year,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}