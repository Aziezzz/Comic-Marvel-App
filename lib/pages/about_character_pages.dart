// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';

class AboutCharacterPages extends StatefulWidget {
  final String characterName;
  final String characterImage;
  final String characterDescription;

  const AboutCharacterPages({
    super.key,
    this.characterName = 'Batman The Hero',
    this.characterImage = 'assets/batman.jpg',
    this.characterDescription =
        'Batman (manusia kelelawar) adalah tokoh pahlawan super fiksi yang diciptakan oleh seniman Bob Kane dan penulis Bill Finger dan diterbitkan oleh DC Comics. Tokoh ini pertama muncul di Detective Comics #27 (Mei 1939).',
  });

  @override
  State<AboutCharacterPages> createState() => _AboutCharacterPagesState();
}

class _AboutCharacterPagesState extends State<AboutCharacterPages> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 768;

    return Scaffold(
      backgroundColor: const Color(0xFF1a1a2e),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1a1a2e),
              Color(0xFF16213e),
              Color(0xFF0f3460),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Custom App Bar
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: 16,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          // ignore: duplicate_ignore
                          // ignore: deprecated_member_use
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            // ignore: deprecated_member_use
                            color: Colors.white.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const Spacer(),
                    const Text(
                      "MARVEL",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 3,
                      ),
                    ),
                    const Spacer(),
                    const SizedBox(width: 48), // Balance for back button
                  ],
                ),
              ),

              // Content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Character Card
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.1,
                          vertical: 20,
                        ),
                        child: Container(
                          width: isTablet ? 300 : screenWidth * 0.7,
                          height: isTablet ? 400 : screenHeight * 0.45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF8B5CF6),
                                Color(0xFF7C3AED),
                                Color(0xFF9333EA),
                                Color(0xFF7C3AED),
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                // ignore: deprecated_member_use
                                color: const Color(0xFF8B5CF6).withOpacity(0.3),
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              // Character Image Section
                              Expanded(
                                flex: 7,
                                child: Container(
                                  margin: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    // ignore: deprecated_member_use
                                    color: const Color.fromARGB(255, 19, 18, 18)
                                        .withOpacity(0.1),
                                  ),
                                  child: Stack(
                                    children: [
                                      // Image or placeholder
                                      Center(
                                        child: widget.characterImage.isNotEmpty
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: Image.asset(
                                                  widget.characterImage,
                                                  fit: BoxFit.cover,
                                                  width: double.infinity,
                                                  height: double.infinity,
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return _buildPlaceholderIcon();
                                                  },
                                                ),
                                              )
                                            : _buildPlaceholderIcon(),
                                      ),
                                      // Marvel Badge
                                      Positioned(
                                        top: 12,
                                        left: 12,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          decoration: BoxDecoration(
                                            // ignore: deprecated_member_use
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            border: Border.all(
                                              // ignore: duplicate_ignore
                                              // ignore: deprecated_member_use
                                              color:
                                                  Colors.white.withOpacity(0.3),
                                              width: 1,
                                            ),
                                          ),
                                          child: const Text(
                                            'MARVEL',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // Character Info Section
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        widget.characterName,
                                        style: TextStyle(
                                          fontSize: isTablet ? 18 : 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          height: 1.2,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            RegExp(r'\d{4}')
                                                    .firstMatch(widget
                                                        .characterDescription)
                                                    ?.group(0) ??
                                                '2023',
                                            style: TextStyle(
                                              fontSize: isTablet ? 14 : 12,
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isFavorite = !isFavorite;
                                              });
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(6),
                                              decoration: BoxDecoration(
                                                color: isFavorite
                                                    ? Colors.white
                                                        .withOpacity(0.2)
                                                    : Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Icon(
                                                isFavorite
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                size: 20,
                                                color: isFavorite
                                                    ? Colors.red[300]
                                                    : Colors.white
                                                        .withOpacity(0.7),
                                              ),
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
                      ),

                      // Description Section
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.08,
                          vertical: 16,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(isTablet ? 24 : 20),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.1),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Text(
                            widget.characterDescription,
                            style: TextStyle(
                              fontSize: isTablet ? 16 : 15,
                              color: Colors.white.withOpacity(0.9),
                              height: 1.6,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Action Buttons
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.08,
                        ),
                        child: Row(
                          children: [
                            // Favorite Button
                            Expanded(
                              child: _buildActionButton(
                                icon: isFavorite
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                                label: isFavorite ? "Favorited" : "Favorite",
                                onPressed: () {
                                  setState(() {
                                    isFavorite = !isFavorite;
                                  });
                                  _showSnackBar(
                                    isFavorite
                                        ? 'Added to favorites!'
                                        : 'Removed from favorites!',
                                  );
                                },
                                isTablet: isTablet,
                              ),
                            ),
                            const SizedBox(width: 16),
                            // Read Button
                            Expanded(
                              flex: 2,
                              child: _buildActionButton(
                                icon: Icons.menu_book,
                                label: "READ",
                                onPressed: () {
                                  _showSnackBar(
                                      'Opening ${widget.characterName} comics...');
                                },
                                isTablet: isTablet,
                                isPrimary: true,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholderIcon() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Icon(
          Icons.person,
          size: 80,
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
    required bool isTablet,
    bool isPrimary = false,
  }) {
    return SizedBox(
      height: isTablet ? 56 : 50,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary
              ? const Color(0xFF8B5CF6)
              : Colors.white.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: isPrimary
                  ? const Color(0xFF8B5CF6)
                  : Colors.white.withOpacity(0.2),
              width: 1,
            ),
          ),
          elevation: 0,
          padding: EdgeInsets.symmetric(
            vertical: isTablet ? 16 : 14,
            horizontal: 16,
          ),
        ),
        icon: Icon(
          icon,
          color: Colors.white,
          size: isTablet ? 22 : 20,
        ),
        label: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: isTablet ? 16 : 14,
            letterSpacing: isPrimary ? 1.0 : 0.5,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: const Color(0xFF8B5CF6),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
