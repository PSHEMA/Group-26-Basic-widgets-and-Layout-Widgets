import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DiscoverRwandaScreen(),
    );
  }
}

class DiscoverRwandaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Discover Rwanda'),
        actions: [
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Where are you going?',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Based on your location',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    LocationCard(
                      imageUrl: 'assets/kigali.jpg',
                      locationName: 'Kigali',
                    ),
                    LocationCard(
                      imageUrl: 'assets/nyungwe.jpg',
                      locationName: 'Nyungwe National Park',
                    ),
                    LocationCard(
                      imageUrl: 'assets/akagera.jpg',
                      locationName: 'Akagera National Park',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CategoryCard(
                    icon: Icons.nature,
                    categoryName: 'Nature',
                  ),
                  CategoryCard(
                    icon: Icons.museum,
                    categoryName: 'Culture',
                  ),
                  CategoryCard(
                    icon: Icons.emoji_nature,
                    categoryName: 'Adventure',
                  ),
                  CategoryCard(
                    icon: Icons.history,
                    categoryName: 'Historical',
                  ),
                ],
              ),
              SizedBox(height: 20),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Image.asset('assets/image1.jpg', fit: BoxFit.cover),
                  Image.asset('assets/image2.jpg', fit: BoxFit.cover),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LocationCard extends StatelessWidget {
  final String imageUrl;
  final String locationName;

  LocationCard({required this.imageUrl, required this.locationName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            locationName,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String categoryName;

  CategoryCard({required this.icon, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: Icon(icon, size: 30),
        ),
        SizedBox(height: 5),
        Text(
          categoryName,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}