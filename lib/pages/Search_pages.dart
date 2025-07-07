// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:marvel_comic_app/pages/home_pages.dart';
import 'package:marvel_comic_app/pages/favorite_pages.dart';
import 'package:marvel_comic_app/pages/profile_pages.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  List<MarvelCharacter> _filteredCharacters = [];
  List<MarvelCharacter> _allCharacters = [];
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _initializeCharacters();
    _filteredCharacters = _allCharacters;

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
  }

  void _initializeCharacters() {
    _allCharacters = [
      MarvelCharacter(
        name: 'The Amazing Spider-Man #1',
        image: '',
        description:
            'Advanced Idea Mechanics - A scientific terrorist organization',
        powerLevel: 85,
      ),
      MarvelCharacter(
        name: 'Spider-Man: No Way Home',
        image: '',
        description: 'Gamma-powered monster with incredible strength',
        powerLevel: 92,
      ),
      MarvelCharacter(
        name: 'Deadpool',
        image: '',
        description: 'Can absorb properties of any material he touches',
        powerLevel: 88,
      ),
      MarvelCharacter(
        name: 'Venom',
        image: '',
        description: 'Mutant with teleportation and dimensional abilities',
        powerLevel: 79,
      ),
      MarvelCharacter(
        name: 'Hulk',
        image: '',
        description: 'Devoted followers of the master of magnetism',
        powerLevel: 72,
      ),
      MarvelCharacter(
        name: 'Loki',
        image: '',
        description: 'Immortal member of the mystical Destine family',
        powerLevel: 83,
      ),
    ];
  }

  void _filterCharacters(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredCharacters = _allCharacters;
      } else {
        _filteredCharacters = _allCharacters
            .where((character) =>
                character.name.toLowerCase().contains(query.toLowerCase()) ||
                character.description
                    .toLowerCase()
                    .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0F),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF1A1A2E).withOpacity(0.9),
                    const Color(0xFF16213E).withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),
        ),
        title: FadeTransition(
          opacity: _fadeAnimation,
          child: const Text(
            'Marvel Universe',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0A0A0F),
              Color(0xFF1A1A2E),
              Color(0xFF16213E),
              Color(0xFF0F3460),
            ],
            stops: [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 20),

                // Glassmorphic Search Bar
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.1),
                          Colors.white.withOpacity(0.05),
                        ],
                      ),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: _searchController,
                            onChanged: _filterCharacters,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                            decoration: InputDecoration(
                              hintText: 'Search Marvel comics...',
                              hintStyle: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 16,
                              ),
                              prefixIcon: Icon(
                                Icons.search_rounded,
                                color: Colors.white.withOpacity(0.7),
                                size: 24,
                              ),
                              suffixIcon: _searchController.text.isNotEmpty
                                  ? IconButton(
                                      icon: Icon(
                                        Icons.clear_rounded,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                      onPressed: () {
                                        _searchController.clear();
                                        _filterCharacters('');
                                      },
                                    )
                                  : null,
                              border: InputBorder.none,
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 18),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Results Counter
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: Row(
                    children: [
                      Text(
                        '${_filteredCharacters.length} Characters Found',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE53E3E).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color(0xFFE53E3E).withOpacity(0.3),
                          ),
                        ),
                        child: const Text(
                          'MARVEL',
                          style: TextStyle(
                            color: Color(0xFFE53E3E),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Characters Grid
                Expanded(
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: _filteredCharacters.length,
                      itemBuilder: (context, index) {
                        final character = _filteredCharacters[index];
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 300 + (index * 100)),
                          curve: Curves.easeOutBack,
                          child: CharacterCard(
                            character: character,
                            index: index,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFF1A1A2E).withOpacity(0.9),
              const Color(0xFF16213E),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: BottomNavigationBar(
              currentIndex: 1,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              selectedItemColor: const Color(0xFFE53E3E),
              unselectedItemColor: Colors.white.withOpacity(0.6),
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 11,
              ),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded, size: 24),
                  activeIcon: Icon(Icons.home_rounded, size: 28),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search_rounded, size: 24),
                  activeIcon: Icon(Icons.search_rounded, size: 28),
                  label: "Search",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_rounded, size: 24),
                  activeIcon: Icon(Icons.favorite_rounded, size: 28),
                  label: "Favorites",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_rounded, size: 24),
                  activeIcon: Icon(Icons.person_rounded, size: 28),
                  label: "Profile",
                ),
              ],
              onTap: (index) {
                if (index != 1) {
                  // Don't navigate if already on search page
                  Widget page;
                  switch (index) {
                    case 0:
                      page = const HomePages();
                      break;
                    case 2:
                      page = const FavoritePage();
                      break;
                    case 3:
                      page = const ProfilPages();
                      break;
                    default:
                      return;
                  }

                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          page,
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeTransition(
                          opacity: animation,
                          child: child,
                        );
                      },
                      transitionDuration: const Duration(milliseconds: 300),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    _animationController.dispose();
    super.dispose();
  }
}

class CharacterCard extends StatefulWidget {
  final MarvelCharacter character;
  final int index;

  const CharacterCard({
    super.key,
    required this.character,
    required this.index,
  });

  @override
  State<CharacterCard> createState() => _CharacterCardState();
}

class _CharacterCardState extends State<CharacterCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _hoverController;
  late Animation<double> _scaleAnimation;
  bool _isHovered = false;

  @override
  void initState() {
    super.initState();
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        // Handle character tap - navigate to detail page
        _showCharacterDialog(context);
      },
      onTapDown: (_) {
        setState(() => _isHovered = true);
        _hoverController.forward();
      },
      onTapUp: (_) {
        setState(() => _isHovered = false);
        _hoverController.reverse();
      },
      onTapCancel: () {
        setState(() => _isHovered = false);
        _hoverController.reverse();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.1),
                Colors.white.withOpacity(0.05),
              ],
            ),
            border: Border.all(
              color: _isHovered
                  ? const Color(0xFFE53E3E).withOpacity(0.5)
                  : Colors.white.withOpacity(0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: _isHovered
                    ? const Color(0xFFE53E3E).withOpacity(0.3)
                    : Colors.black.withOpacity(0.3),
                blurRadius: _isHovered ? 25 : 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Character Image/Icon Area
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: _getCharacterGradient(widget.character.name),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: _getCharacterWidget(widget.character.name),
                          ),
                          // Power Level Indicator
                          Positioned(
                            top: 12,
                            right: 12,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                ),
                              ),
                              child: Text(
                                '${widget.character.powerLevel}%',
                                style: const TextStyle(
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

                  // Character Info
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.character.name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 0.5,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Expanded(
                            child: Text(
                              widget.character.description,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white.withOpacity(0.7),
                                height: 1.3,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Power Level Bar
                          Container(
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: widget.character.powerLevel / 100,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFE53E3E),
                                      Color(0xFFFF6B6B),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showCharacterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A2E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text(
          widget.character.name,
          style: const TextStyle(color: Colors.white),
        ),
        content: Text(
          widget.character.description,
          style: TextStyle(color: Colors.white.withOpacity(0.8)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Close',
              style: TextStyle(color: Color(0xFFE53E3E)),
            ),
          ),
        ],
      ),
    );
  }

  LinearGradient _getCharacterGradient(String name) {
    switch (name.toLowerCase()) {
      case 'a.i.m.':
        return const LinearGradient(
          colors: [Color(0xFF4A90E2), Color(0xFF7BB3F0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'abomination':
        return const LinearGradient(
          colors: [Color(0xFF8B4513), Color(0xFFD2691E)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'absorbing man':
        return const LinearGradient(
          colors: [Color(0xFF708090), Color(0xFFC0C0C0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'abyss':
        return const LinearGradient(
          colors: [Color(0xFF4B0082), Color(0xFF8A2BE2)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'acolytes':
        return const LinearGradient(
          colors: [Color(0xFFDC143C), Color(0xFFFF6347)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      default:
        return const LinearGradient(
          colors: [Color(0xFFE53E3E), Color(0xFFFF6B6B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
    }
  }

  Widget _getCharacterWidget(String name) {
    IconData iconData;
    Color iconColor = Colors.white;

    switch (name.toLowerCase()) {
      case 'a.i.m.':
        iconData = Icons.science_rounded;
        break;
      case 'abomination':
        iconData = Icons.face_retouching_natural_rounded;
        break;
      case 'absorbing man':
        iconData = Icons.transform_rounded;
        break;
      case 'abyss':
        iconData = Icons.blur_on_rounded;
        break;
      case 'acolytes':
        iconData = Icons.groups_rounded;
        break;
      default:
        iconData = Icons.person_rounded;
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black.withOpacity(0.3),
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 2,
        ),
      ),
      child: Icon(
        iconData,
        size: 40,
        color: iconColor,
      ),
    );
  }

  @override
  void dispose() {
    _hoverController.dispose();
    super.dispose();
  }
}

class MarvelCharacter {
  final String name;
  final String image;
  final String description;
  final int powerLevel;

  MarvelCharacter({
    required this.name,
    required this.image,
    required this.description,
    required this.powerLevel,
  });
}
