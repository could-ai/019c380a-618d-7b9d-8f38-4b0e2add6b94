import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Μπαμ και κάτω (Δομάζος)',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0057B7), // Greek Blue
          secondary: const Color(0xFFD4AF37), // Gold/Warm tone
          surface: const Color(0xFFF5F5F5), // Light stone/white
        ),
        useMaterial3: true,
        fontFamily: 'Georgia', // Serif font for tradition
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            const HeroSection(),
            const AboutSection(),
            const SignatureDishesSection(),
            const ReviewsSection(),
            const VisitUsSection(),
            const FooterSection(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Placeholder for call action
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Calling +30 2227 094032...')),
          );
        },
        label: const Text('Call to Order'),
        icon: const Icon(Icons.phone),
        backgroundColor: const Color(0xFF0057B7),
        foregroundColor: Colors.white,
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Μπαμ και κάτω',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0057B7),
            ),
          ),
          Row(
            children: [
              TextButton(onPressed: () {}, child: const Text('Menu')),
              const SizedBox(width: 16),
              TextButton(onPressed: () {}, child: const Text('Contact')),
            ],
          ),
        ],
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1555396273-367ea4eb4db5?q=80&w=1974&auto=format&fit=crop'), // Greek food placeholder
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Authentic Greek Flavors,\nCooked with Tradition',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
                shadows: [Shadow(blurRadius: 10, color: Colors.black)],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              'Traditional taverna serving homemade Greek dishes in a warm and welcoming atmosphere.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0057B7),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text('View Menu'),
              ),
              const SizedBox(width: 16),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.white, width: 2),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text('Book a Table'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.white,
      child: Column(
        children: [
          const Text(
            'Our Story',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
          ),
          const SizedBox(height: 16),
          const Text(
            'Located in Spathari, "Μπαμ και κάτω (Δομάζος)" is more than just a restaurant; it is a celebration of Greek tradition. We pride ourselves on hospitality, simplicity, and using only the highest quality local ingredients. Come as a guest, leave as family.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, height: 1.5, color: Color(0xFF666666)),
          ),
          const SizedBox(height: 20),
          const Icon(Icons.restaurant_menu, color: Color(0xFF0057B7), size: 40),
        ],
      ),
    );
  }
}

class SignatureDishesSection extends StatelessWidget {
  const SignatureDishesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      color: const Color(0xFFF9F9F9),
      child: Column(
        children: [
          const Text(
            'Signature Dishes',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildDishCard(
                'Kokoretsi (Κοκορέτσι)',
                'Traditional rotisserie offal dish, seasoned to perfection.',
                'https://images.unsplash.com/photo-1544025162-d76690b67f11?q=80&w=1000&auto=format&fit=crop',
              ),
              _buildDishCard(
                'Grilled Lamb',
                'Succulent "Provatina", grilled slowly for maximum flavor.',
                'https://images.unsplash.com/photo-1603360946369-dc9bb6258143?q=80&w=1000&auto=format&fit=crop',
              ),
              _buildDishCard(
                'Greek Salad',
                'Fresh tomatoes, cucumbers, olives, and feta cheese.',
                'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?q=80&w=1000&auto=format&fit=crop',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDishCard(String title, String description, String imageUrl) {
    return SizedBox(
      width: 300,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (ctx, err, stack) => Container(
                height: 200,
                color: Colors.grey[300],
                child: const Center(child: Icon(Icons.broken_image, size: 50, color: Colors.grey)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(description, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      color: Colors.white,
      child: Column(
        children: [
          const Text(
            'Why People Love Us',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              Icon(Icons.star, color: Colors.amber),
              SizedBox(width: 8),
              Text('4.9 (96+ Reviews)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 30),
          _buildReviewTile('Maria K.', 'Best lamb chops I have ever had! The atmosphere is so cozy.'),
          const Divider(),
          _buildReviewTile('John D.', 'Authentic Greek experience. Great prices and huge portions.'),
          const Divider(),
          _buildReviewTile('Eleni P.', 'A hidden gem in Spathari. Highly recommended!'),
        ],
      ),
    );
  }

  Widget _buildReviewTile(String name, String comment) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xFF0057B7),
        child: Text(name[0], style: const TextStyle(color: Colors.white)),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(comment),
    );
  }
}

class VisitUsSection extends StatelessWidget {
  const VisitUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      color: const Color(0xFFF0F4F8),
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            'Visit Us',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF333333)),
          ),
          const SizedBox(height: 20),
          const Icon(Icons.location_on, color: Color(0xFF0057B7), size: 40),
          const SizedBox(height: 10),
          const Text(
            'Spathari 340 04, Greece',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          const Icon(Icons.access_time, color: Color(0xFF0057B7), size: 40),
          const SizedBox(height: 10),
          const Text('Open Daily: 12:00 PM - 11:00 PM', style: TextStyle(fontSize: 16)),
          const SizedBox(height: 30),
          // Placeholder for Map
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[400]!),
            ),
            child: const Center(
              child: Text('Google Maps Embed Placeholder', style: TextStyle(color: Colors.grey)),
            ),
          ),
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: const Color(0xFF333333),
      width: double.infinity,
      child: Column(
        children: [
          const Text(
            'Μπαμ και κάτω (Δομάζος)',
            style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            '© 2024 All Rights Reserved',
            style: TextStyle(color: Colors.white54, fontSize: 12),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.facebook, color: Colors.white)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.camera_alt, color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
