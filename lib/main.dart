import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Flutter',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MenuPage(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}


class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Menu Latihan Flutter")),
      body: ListView(
        children: [
          _menuButton(context, "Latihan 1 - Scaffold", const Latihan1()),
          _menuButton(context, "Latihan 2 - Row Icon", const Latihan2()),
          _menuButton(context, "Latihan 3 - Container", const Latihan3()),
          _menuButton(context, "Latihan 4 - Stack Profile", const Latihan4()),
          _menuButton(context, "Latihan 5 - ListView", const Latihan5()),
          _menuButton(context, "Latihan 6 & 8 - Navigation", const HomePage()),
          _menuButton(context, "Latihan 7 - Settings (Named Route)", const SettingsButton()),
          _menuButton(context, "Latihan 9 - Bottom Navigation", const BottomNavPage()),
        ],
      ),
    );
  }

  Widget _menuButton(BuildContext context, String title, Widget page) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}

class Latihan1 extends StatelessWidget {
  const Latihan1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil Pengguna")),
      body: const Center(child: Text("Ini contoh Scaffold")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.email),
      ),
    );
  }
}

class Latihan2 extends StatelessWidget {
  const Latihan2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Row Icon")),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home, size: 40),
            SizedBox(width: 20),
            Icon(Icons.star, size: 40),
            SizedBox(width: 20),
            Icon(Icons.person, size: 40),
          ],
        ),
      ),
    );
  }
}

class Latihan3 extends StatelessWidget {
  const Latihan3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Container")),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Text(
            "Kotak Hijau",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

class Latihan4 extends StatelessWidget {
  const Latihan4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stack Profile")),
      body: Center(
        child: Stack(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage("https://picsum.photos/200"),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Latihan5 extends StatelessWidget {
  const Latihan5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Teman")),
      body: ListView(
        children: const [
          ListTile(leading: Icon(Icons.person), title: Text("Ahmad")),
          ListTile(leading: Icon(Icons.person), title: Text("Budi")),
          ListTile(leading: Icon(Icons.person), title: Text("Rizky")),
          ListTile(leading: Icon(Icons.person), title: Text("Dani")),
          ListTile(leading: Icon(Icons.person), title: Text("Fajar")),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Ke About Page"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const AboutPage(pesan: "Selamat Datang dari Home"),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  final String pesan;

  const AboutPage({super.key, required this.pesan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(pesan, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text("Kembali"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: const Center(
        child: Text(
          "Ini Halaman Settings",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Latihan 7")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
          child: const Text("Buka Settings"),
        ),
      ),
    );
  }
}

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    Center(child: Text("Halaman Chat", style: TextStyle(fontSize: 22))),
    Center(child: Text("Halaman Status", style: TextStyle(fontSize: 22))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bottom Navigation")),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.circle),
            label: "Status",
          ),
        ],
      ),
    );
  }
}