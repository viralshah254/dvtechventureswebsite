import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart'; // Package for animations
import 'dart:html' as html; // Import this for web link handling

void main() {
  runApp(DVTechVenturesWebsite());
}

class DVTechVenturesWebsite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DV Tech Ventures',
      theme: ThemeData(
        primaryColor: Color(0xFF004D40), // Dark green
        hintColor: Color(0xFFFFD700), // Gold
        textTheme: GoogleFonts.latoTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF004D40),
          elevation: 0,
        ),
      ),
      home: OnePageWebsite(),
    );
  }
}

class OnePageWebsite extends StatefulWidget {
  @override
  _OnePageWebsiteState createState() => _OnePageWebsiteState();
}

class _OnePageWebsiteState extends State<OnePageWebsite> {
  final GlobalKey topKey =
      GlobalKey(); // Added top key for scrolling to the top
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey productsKey = GlobalKey();
  final GlobalKey footerKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: _buildHeader(context),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              key: topKey, // Use topKey here to mark the very top of the page
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth > 600 ? 60.0 : 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeroSection(context, constraints),
                  _buildAnimatedSection(
                      'Our Mission',
                      'We operate as a venture studio and an incubator, providing a collaborative environment '
                          'that transforms ideas into impactful products. We plan to get into the venture capital space in mid-2025, '
                          'helping startups grow and succeed with our experience and dedication to innovation.'),
                  _buildAnimatedSection(
                      'Our Vision',
                      'We envision a future where innovative technology creates meaningful change in people\'s lives globally. '
                          'Our goal is to foster a thriving ecosystem of startups that solve real-world problems and contribute to a sustainable future.'),
                  _buildAboutUsSection(),
                  _buildProductsSection(),
                  _buildFooter(),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFFD700),
        child: Icon(Icons.arrow_upward, color: Colors.white),
        onPressed: () {
          _scrollToSection(
              topKey); // Scroll to the top key instead of the aboutKey
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return AppBar(
      title: Image.asset(
        '/Users/viralshah/Desktop/dvtechventures/dvtechwebsite/assets/dvtechventures.png',
        height: 50,
      ),
      actions: [
        _buildNavLink('About Us', () => _scrollToSection(aboutKey)),
        _buildNavLink('Products', () => _scrollToSection(productsKey)),
        _buildNavLink('Contact', () => _scrollToSection(footerKey)),
      ],
    );
  }

  Widget _buildNavLink(String title, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, BoxConstraints constraints) {
    return Container(
      height: constraints.maxWidth > 600 ? 600 : 400,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF1E90FF),
            Color(0xFF004D40)
          ], // Blue to Green gradient
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  'DV Tech Ventures - A Venture Studio for Tomorrow\'s Innovations',
                  textStyle: TextStyle(
                    fontSize: constraints.maxWidth > 600 ? 40 : 28,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.5),
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                  speed: Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 1,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _scrollToSection(aboutKey);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFD700), // Gold button
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text('Learn More'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedSection(String title, String content) {
    return AnimationConfiguration.staggeredList(
      position: 0,
      duration: const Duration(milliseconds: 500),
      child: SlideAnimation(
        verticalOffset: 50.0,
        child: FadeInAnimation(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFFD700)), // Gold for title
                ),
                SizedBox(height: 16),
                Text(
                  content,
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF004D40)), // Dark green for content
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAboutUsSection() {
    return Padding(
      key: aboutKey,
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Us',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFD700)),
          ),
          SizedBox(height: 16),
          Text(
            'DV Tech Ventures operates as a venture studio and incubator, committed to building and investing in transformative startups. '
            'We are passionate about innovation and dedicated to providing the resources, guidance, and capital necessary for success. '
            'With plans to enter the venture capital space in mid-2025, we look forward to expanding our impact.\n',
            style: TextStyle(fontSize: 18, color: Color(0xFF004D40)),
          ),
          Row(
            children: [
              _buildAboutCard('Venture Studio',
                  'We create and build ventures in-house, turning ideas into successful companies.'),
              SizedBox(width: 16),
              _buildAboutCard('Incubator',
                  'We help promising startups by providing resources and expertise.'),
              SizedBox(width: 16),
              _buildAboutCard('Venture Capital',
                  'Coming in mid-2025: We will invest in early-stage startups to accelerate their growth.'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAboutCard(String title, String description) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xFF1E90FF).withOpacity(0.1), // Light blue background
        elevation: 5,
        shadowColor: Colors.grey.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF004D40)), // Dark green title
              ),
              SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductsSection() {
    return Padding(
      key: productsKey,
      padding: const EdgeInsets.all(32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Our Products',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFD700)),
          ),
          SizedBox(height: 16),
          _buildProductCard(
              'Serenity - The Sober Social',
              'A community-driven platform for individuals seeking a sober lifestyle.',
              Colors.red,
              '/Users/viralshah/Desktop/dvtechventures/dvtechwebsite/assets/app_icon_serenity_logo.png'),
          _buildProductCard('Tamu', 'Coming Soon', Colors.green,
              '/Users/viralshah/Desktop/dvtechventures/dvtechwebsite/assets/tamulogo.png'),
          _buildProductCard(
              'Rage - Authentic Voices',
              'Coming Soon',
              Colors.blue,
              '/Users/viralshah/Desktop/dvtechventures/dvtechwebsite/assets/ragelogo.png'),
        ],
      ),
    );
  }

  Widget _buildProductCard(
      String title, String description, Color color, String? logoPath) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color:
          color.withOpacity(0.1), // Light color background for differentiation
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(0.5),
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          children: [
            if (logoPath != null)
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Image.asset(
                  logoPath,
                  height: 60,
                  width: 60,
                ),
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: color),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      key: footerKey,
      padding: EdgeInsets.all(32),
      color: Color(0xFF004D40), // Dark green background
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side of the footer with contact info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Have a great idea? Let\'s make it happen!',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                'If you\'re a startup with a great idea and are looking for the right partners to help you grow, reach out to us at:',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'hello@dvtechventures.co',
                style: TextStyle(
                  color: Color(0xFFFFD700),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          // Right side of the footer with LinkedIn link
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Follow us on',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  html.window.open(
                      'https://www.linkedin.com/company/dv-tech-ventures/about',
                      '_blank');
                },
                child: Image.asset(
                  '/Users/viralshah/Desktop/dvtechventures/dvtechwebsite/assets/linkedinicon.png',
                  height: 40,
                  width: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
