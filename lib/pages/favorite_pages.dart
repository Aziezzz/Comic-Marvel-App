import 'package:flutter/material.dart';
import 'package:marvel_comic_app/pages/home_pages.dart';
import 'package:marvel_comic_app/pages/search_pages.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  int _selectedIndex = 2; // Index untuk "Favorit"

  final TextEditingController _searchController = TextEditingController();
  
  // Sample Marvel comics data
  final List<Map<String, dynamic>> _marvelComics = [
    {
      'title': 'Amazing Spider-Man',
      'author': 'Stan Lee',
      'category': 'Superhero',
      'rating': 5,
      'image': 'assets/images/spiderman.jpg',
      'color': Colors.red.shade400,
    },
    {
      'title': 'Iron Man: Extremis',
      'author': 'Warren Ellis',
      'category': 'Superhero',
      'rating': 4,
      'image': 'assets/images/ironman.jpg',
      'color': Colors.yellow.shade700,
    },
    {
      'title': 'Thor: God of Thunder',
      'author': 'Jason Aaron',
      'category': 'Fantasy',
      'rating': 5,
      'image': 'assets/images/thor.jpg',
      'color': Colors.blue.shade600,
    },
    {
      'title': 'Black Widow',
      'author': 'Mark Waid',
      'category': 'Action',
      'rating': 4,
      'image': 'assets/images/blackwidow.jpg',
      'color': Colors.black87,
    },
    {
      'title': 'Guardians of the Galaxy',
      'author': 'Brian Michael Bendis',
      'category': 'Sci-Fi',
      'rating': 4,
      'image': 'assets/images/guardians.jpg',
      'color': Colors.purple.shade600,
    },
  ];

  List<Map<String, dynamic>> _filteredComics = [];

  @override
  void initState() {
    super.initState();
    _filteredComics = _marvelComics;
  }

  void _filterComics(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredComics = _marvelComics;
      } else {
        _filteredComics = _marvelComics
            .where((comic) =>
                comic['title'].toLowerCase().contains(query.toLowerCase()) ||
                comic['author'].toLowerCase().contains(query.toLowerCase()) ||
                comic['category'].toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  Widget _buildStarRating(int rating) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < rating ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 16,
        );
      }),
    );
  }

  Widget _buildComicCard(Map<String, dynamic> comic) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Comic cover with Marvel-style design
            Container(
              width: 70,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    comic['color'],
                    comic['color'].withOpacity(0.7),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: comic['color'].withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  // Marvel logo placeholder
                  Positioned(
                    top: 4,
                    left: 4,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Text(
                        'MARVEL',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Character silhouette or icon
                  Center(
                    child: Icon(
                      Icons.person,
                      // ignore: deprecated_member_use
                      color: Colors.white.withOpacity(0.8),
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // Comic details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comic['title'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Author: ${comic['author']}',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    comic['category'],
                    style: TextStyle(
                      fontSize: 12,
                      color: comic['color'],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildStarRating(comic['rating']),
                ],
              ),
            ),
            // Favorite button
            IconButton(
              onPressed: () {
                // Handle favorite toggle
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${comic['title']} removed from favorites'),
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.red[700],
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white, // Icon back jadi putih
        ),
        title: const Text(
          'Marvel Favorites',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search bar
            Container(
              color: Colors.red[700],
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _filterComics,
                  decoration: const InputDecoration(
                    hintText: 'Search Marvel comics...',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                ),
              ),
            ),
            // Comics list
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75,
              child: _filteredComics.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 64,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No comics found',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Try searching with different keywords',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      itemCount: _filteredComics.length,
                      itemBuilder: (context, index) {
                        return _buildComicCard(_filteredComics[index]);
                      },
                    ),
            ),
          ],
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
          setState(() {
            _selectedIndex = index;
          });
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePages()),
            );
          }
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const SearchPage()),
            );
          }
          // index 2 = halaman ini sendiri
          // index 3 = profil (tambahkan jika ada halaman profil)
        },
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}