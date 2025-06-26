import 'package:flutter/material.dart';
import 'package:marvel_comic_app/pages/home_pages.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<MarvelCharacter> _filteredCharacters = [];
  List<MarvelCharacter> _allCharacters = [];

  @override
  void initState() {
    super.initState();
    _initializeCharacters();
    _filteredCharacters = _allCharacters;
  }

  void _initializeCharacters() {
    _allCharacters = [
      MarvelCharacter(
        name: 'A.I.M.',
        image: 'assets/images/aim.jpg',
        description: 'Advanced Idea Mechanics',
      ),
      MarvelCharacter(
        name: 'Abomination (Emil Blonsky)',
        image: 'assets/images/abomination.jpg',
        description: 'Gamma-powered monster',
      ),
      MarvelCharacter(
        name: 'Absorbing Man',
        image: 'assets/images/absorbing_man.jpg',
        description: 'Can absorb properties of any material',
      ),
      MarvelCharacter(
        name: 'Abyss',
        image: 'assets/images/abyss.jpg',
        description: 'Mutant with teleportation abilities',
      ),
      MarvelCharacter(
        name: 'Acotytes',
        image: 'assets/images/acotytes.jpg',
        description: 'Followers of Magneto',
      ),
      MarvelCharacter(
        name: 'Adam Destine',
        image: 'assets/images/adam_destine.jpg',
        description: 'Member of the Destine family',
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
                character.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'All Marvel Characters',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _filterCharacters,
                decoration: InputDecoration(
                  hintText: 'Search characters e.g. Iron-man',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            
            // Characters Grid
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85,
                ),
                itemCount: _filteredCharacters.length,
                itemBuilder: (context, index) {
                  final character = _filteredCharacters[index];
                  return CharacterCard(character: character);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Search tab aktif
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
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePages()),
            );
          }
          // Tambahkan navigasi lain jika diperlukan
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

class CharacterCard extends StatelessWidget {
  final MarvelCharacter character;

  const CharacterCard({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle character tap
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Character Image
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: _getCharacterGradient(character.name),
                  ),
                  child: _getCharacterWidget(character.name),
                ),
              ),
              
              // Character Name
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: Text(
                    character.name,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  LinearGradient _getCharacterGradient(String name) {
    switch (name) {
      case 'A.I.M.':
        return const LinearGradient(
          colors: [Color(0xFF4A90E2), Color(0xFF7BB3F0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'Abomination (Emil Blonsky)':
        return const LinearGradient(
          colors: [Color(0xFFD4AF37), Color(0xFFB8860B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'Absorbing Man':
        return const LinearGradient(
          colors: [Color(0xFF4A90E2), Color(0xFF6495ED)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'Abyss':
        return const LinearGradient(
          colors: [Color(0xFF2E8B57), Color(0xFF90EE90)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      default:
        return const LinearGradient(
          colors: [Color(0xFFE6E6FA), Color(0xFFDDA0DD)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
    }
  }

  Widget _getCharacterWidget(String name) {
    switch (name) {
      case 'A.I.M.':
        return const Center(
          child: Icon(
            Icons.groups,
            size: 60,
            color: Colors.yellow,
          ),
        );
      case 'Abomination (Emil Blonsky)':
        return const Center(
          child: Icon(
            Icons.face,
            size: 60,
            color: Colors.brown,
          ),
        );
      case 'Absorbing Man':
        return const Center(
          child: Icon(
            Icons.face_retouching_natural,
            size: 60,
            color: Colors.red,
          ),
        );
      case 'Abyss':
        return const Center(
          child: Icon(
            Icons.person,
            size: 60,
            color: Colors.black,
          ),
        );
      default:
        return const Center(
          child: Icon(
            Icons.person,
            size: 60,
            color: Colors.white,
          ),
        );
    }
  }
}

class MarvelCharacter {
  final String name;
  final String image;
  final String description;

  MarvelCharacter({
    required this.name,
    required this.image,
    required this.description,
  });
}