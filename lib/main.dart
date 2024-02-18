import 'package:flutter/material.dart';
import 'package:helloworld/calculator.dart';
import 'package:helloworld/home_page.dart';
import 'package:helloworld/profile_page.dart';
import 'package:helloworld/settings.dart';
import 'package:helloworld/page/sign_in.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      home: const RootPage(),
    );
  }
}

int currentPage = 0;
int selectedDrawerIndex = 0;

class RootPage extends StatefulWidget {
  const RootPage({super.key});
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<Widget> pages = [
    const HomePage(),
    CalculatorPage(),
    const ProfilePage(),
    Setting(),
    LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text(
          'Flutter',
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue[100],
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
            //   leading: const Icon(Icons.home, color: Colors.blue),
            //   onTap: () {
            //     Navigator.of(context).push(
            //         MaterialPageRoute(builder: (context) => const HomePage()));
            //   },
            // ),
            // const ListTile(
            //   title: Text('Calculator'),
            //   leading: Icon(Icons.calculate, color: Colors.blue),
            // ),
            // ListTile(
            //   title: const Text('Contacts'),
            //   leading:
            //       const Icon(Icons.person_2_sharp, color: Colors.blue),
            //   // onTap: () {
            //   //   Navigator.of(context).push(MaterialPageRoute(
            //   //       builder: (context) => const ProfilePage()));
            //   // },
            // ),
            buildDrawerItem(0, 'Home', Icons.home),
            buildDrawerItem(1, 'Calculator', Icons.calculate),
            buildDrawerItem(2, 'Contacts', Icons.person),
            ListTile(
              title: const Text('Settings'),
              leading: const Icon(Icons.settings),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Setting()));
              },
            ),
            const SizedBox(height: 40),
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),
            ListTile(
              title: const Text('Logout'),
              leading: const Icon(Icons.logout),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ),
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
            icon: Icon(Icons.home, color: Colors.blue),
            label: 'Home',
          ),
          NavigationDestination(
              icon: Icon(Icons.calculate, color: Colors.blue),
              label: 'Calculator'),
          NavigationDestination(
              icon: Icon(Icons.person, color: Colors.blue), label: 'Contacts'),
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
