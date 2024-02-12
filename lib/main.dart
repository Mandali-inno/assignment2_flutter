import 'package:flutter/material.dart';
import 'package:helloworld/calculator.dart';
import 'package:helloworld/home_page.dart';
import 'package:helloworld/profile_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  int selectedDrawerIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    CalculatorPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: const Text(
          'Flutter',
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.deepPurple[100],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text('Mandali'),
              accountEmail: const Text('mandaliinno@gmail.com'),
              currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                child: Image.asset('images/image1.jpg'),
              )),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('images/image1.jpg'),
                fit: BoxFit.cover,
              )),
            ),
            // ListTile(
            //   title: const Text('Home'),
            //   leading: const Icon(Icons.home, color: Colors.deepPurple),
            //   onTap: () {
            //     Navigator.of(context).push(
            //         MaterialPageRoute(builder: (context) => const HomePage()));
            //   },
            // ),
            // const ListTile(
            //   title: Text('Calculator'),
            //   leading: Icon(Icons.calculate, color: Colors.deepPurple),
            // ),
            // ListTile(
            //   title: const Text('Contacts'),
            //   leading:
            //       const Icon(Icons.person_2_sharp, color: Colors.deepPurple),
            //   // onTap: () {
            //   //   Navigator.of(context).push(MaterialPageRoute(
            //   //       builder: (context) => const ProfilePage()));
            //   // },
            // ),
            buildDrawerItem(0, 'Home', Icons.home),
            buildDrawerItem(1, 'Calculator', Icons.calculate),
            buildDrawerItem(2, 'Contacts', Icons.person),
          ],
        ),
      ),
      body: pages[currentPage],
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     debugPrint('Floating action pressed');
      //   },
      //   child: const Icon(Icons.add),
      // ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home, color: Colors.deepPurple),
            label: 'Home',
          ),
          NavigationDestination(
              icon: Icon(Icons.calculate, color: Colors.deepPurple),
              label: 'Calculator'),
          NavigationDestination(
              icon: Icon(Icons.person, color: Colors.deepPurple),
              label: 'Contacts'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }

  ListTile buildDrawerItem(int index, String title, IconData icon) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      onTap: () {
        // Navigate to the corresponding page and update the selected index
        Navigator.pop(context); // Close the drawer
        setState(() {
          currentPage = index;
          selectedDrawerIndex = index;
        });
      },
      selected: selectedDrawerIndex == index, // Highlight the selected item
    );
  }
}
