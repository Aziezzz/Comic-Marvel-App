// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:marvel_comic_app/pages/about_character_pages.dart';
import 'package:marvel_comic_app/pages/favorite_pages.dart';
import 'package:marvel_comic_app/pages/profile_pages.dart';
import 'search_pages.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  int _selectedIndex = 0;

  @override
  void dispose() {
    super.dispose();
  }

  // Data untuk Popular Marvel Characters
  final List<Map<String, String>> popularCharacters = const [
    {'title': 'Iron Man', 'image': 'assets/images/ironman.jpg', 'year': '2023'},
    {
      'title': 'Spider-Man',
      'image': 'assets/images/spiderman_char.jpg',
      'year': '2023'
    },
    {
      'title': 'Captain America',
      'image': 'assets/images/captain_america.jpg',
      'year': '2023'
    },
    {'title': 'Venom', 'image': 'assets/images/venom.jpg', 'year': '2023'},
  ];

  // Data untuk Spider-Man Comics
  final List<Map<String, String>> spiderManComics = const [
    {
      'title': 'The Amazing Spider-Man #1',
      'image': 'assets/images/potrait_uncnany.jpg',
      'year': '2023'
    },
    {
      'title': 'Spider-Man: No Way Home',
      'image': 'assets/images/spiderman_nwh.jpg',
      'year': '2023'
    },
    {
      'title': 'Ultimate Spider-Man',
      'image': 'assets/images/ultimate_spiderman.jpg',
      'year': '2023'
    },
    {
      'title': 'Spider-Verse',
      'image': 'assets/images/spider_verse.jpg',
      'year': '2023'
    },
    {
      'title': 'Spider-Man 2099',
      'image': 'assets/images/spiderman_2099.jpg',
      'year': '2023'
    },
    {
      'title': 'Spider-Man: Across',
      'image': 'assets/images/spider_across.jpg',
      'year': '2023'
    },
  ];

  // Data untuk Latest Marvel Comics
  final List<Map<String, String>> latestComics = const [
    {
      'title': 'X-Men: Phoenix - Warsong',
      'image': 'assets/images/phoenix_warsong.jpg',
      'year': '2024'
    },
    {
      'title': 'Avengers: Endgame',
      'image': 'assets/images/avengers_endgame.jpg',
      'year': '2024'
    },
    {
      'title': 'Doctor Strange: Multiverse',
      'image': 'assets/images/doctor_strange.jpg',
      'year': '2024'
    },
    {
      'title': 'Guardians of the Galaxy',
      'image': 'assets/images/guardians.jpg',
      'year': '2024'
    },
    {
      'title': 'Black Panther',
      'image': 'assets/images/black_panther.jpg',
      'year': '2024'
    },
    {
      'title': 'Thor Love and Thunder',
      'image': 'assets/images/thor_lat.jpg',
      'year': '2024'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isLargeScreen = screenWidth > 600;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1A1A2E),
              Color(0xFF16213E),
              Color(0xFF0F3460),
            ],
          ),
        ),
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              // Modern App Bar
              SliverAppBar(
                expandedHeight: 120,
                floating: false,
                pinned: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF1A1A2E),
                          Color(0xFF16213E),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Welcome back',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Marvel Fan',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFE53E3E),
                                      Color(0xFFFC8181)
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFFE53E3E)
                                          .withOpacity(0.3),
                                      spreadRadius: 0,
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: const Text(
                                  'MARVEL',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 1.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Content
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isLargeScreen ? 32 : 20,
                    vertical: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Section Popular Marvel Characters
                      _buildModernSectionHeader(
                        'Popular Characters',
                        'Discover the most beloved Marvel heroes',
                        onSeeAll: () {},
                      ),
                      const SizedBox(height: 20),
                      _buildResponsiveCardGrid(
                        popularCharacters,
                        isCharacter: true,
                        isLargeScreen: isLargeScreen,
                      ),

                      const SizedBox(height: 40),

                      // Section Spider-Man Comics
                      _buildModernSectionHeader(
                        'Spider-Man Comics',
                        'Your friendly neighborhood web-slinger',
                        onSeeAll: () {},
                      ),
                      const SizedBox(height: 20),
                      _buildHorizontalScrollList(spiderManComics,
                          isCharacter: false),

                      const SizedBox(height: 40),

                      // Section Latest Marvel Comics
                      _buildModernSectionHeader(
                        'Latest Comics',
                        'Stay up to date with the newest releases',
                        onSeeAll: () {},
                      ),
                      const SizedBox(height: 20),
                      _buildHorizontalScrollList(latestComics,
                          isCharacter: false),

                      const SizedBox(height: 100), // Space for bottom nav
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildModernBottomNav(context),
    );
  }

  Widget _buildModernSectionHeader(String title, String subtitle,
      {required VoidCallback onSeeAll}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.7),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: onSeeAll,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildResponsiveCardGrid(List<Map<String, String>> items,
      {required bool isCharacter, required bool isLargeScreen}) {
    if (items.isEmpty) {
      return const Center(
        child: Text(
          'No data available',
          style: TextStyle(color: Colors.white70),
        ),
      );
    }

    if (isLargeScreen) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.7,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          if (index >= items.length) {
            return const SizedBox.shrink();
          }
          final item = items[index];
          return _buildModernCard(context, item, isCharacter: isCharacter);
        },
      );
    } else {
      return _buildHorizontalScrollList(items, isCharacter: isCharacter);
    }
  }

  Widget _buildHorizontalScrollList(List<Map<String, String>> items,
      {required bool isCharacter}) {
    if (items.isEmpty) {
      return const SizedBox(
        height: 300,
        child: Center(
          child: Text(
            'No data available',
            style: TextStyle(color: Colors.white70),
          ),
        ),
      );
    }

    return SizedBox(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        itemCount: items.length,
        separatorBuilder: (context, index) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          if (index >= items.length) {
            return const SizedBox.shrink();
          }
          final item = items[index];
          return _buildModernCard(context, item, isCharacter: isCharacter);
        },
      ),
    );
  }

  Widget _buildModernCard(BuildContext context, Map<String, String>? item,
      {required bool isCharacter}) {
    if (item == null) {
      return const SizedBox(
        width: 160,
        height: 300,
        child: Center(
          child: Text(
            'No data',
            style: TextStyle(color: Colors.white70),
          ),
        ),
      );
    }

    final title = item['title'] ?? 'Unknown Title';
    final imagePath = item['image'] ?? '';
    final year = item['year'] ?? 'Unknown';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AboutCharacterPages(
              characterName: title,
              characterImage: imagePath,
              characterDescription: 'Description for $title',
            ),
          ),
        );
      },
      child: ModernComicCard(
        title: title,
        imagePath: imagePath,
        year: year,
        isCharacter: isCharacter,
      ),
    );
  }

  Widget _buildModernBottomNav(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0F3460),
            Color(0xFF16213E),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: const Color(0xFFE53E3E),
        unselectedItemColor: Colors.white.withOpacity(0.6),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 11,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: "Favorites",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: "Profile",
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });

          switch (index) {
            case 0:
              // Already on home, do nothing
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoritePage()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilPages()),
              );
              break;
          }
        },
      ),
    );
  }
}

class ModernComicCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String year;
  final bool isCharacter;

  const ModernComicCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.year,
    this.isCharacter = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            imagePath.isNotEmpty
                ? Image.asset(
                    imagePath, // PENTING: Tidak menambah prefix apapun!
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return _buildErrorWidget();
                    },
                  )
                : _buildErrorWidget(),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.8)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.5, 1.0],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            year,
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: Icon(
                            Icons.favorite_border_rounded,
                            size: 16,
                            color: Colors.white.withOpacity(0.8),
                          ),
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

  Widget _buildErrorWidget() {
    return Container(
      color: Colors.grey[800],
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.broken_image,
            color: Colors.white54,
            size: 50,
          ),
          SizedBox(height: 8),
          Text(
            'Image not found',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
