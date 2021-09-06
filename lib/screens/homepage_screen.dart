import 'package:filmkuu/screens/favorite/favorite_screen.dart';
import 'package:filmkuu/screens/movies/movies_add_screen.dart';
import 'package:filmkuu/screens/movies/movies_search_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF060E3E),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Route route =
              MaterialPageRoute(builder: (context) => MoviesAddScreen());
          Navigator.push(context, route);
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(
            left: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Filmkuu',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),
                          onTap: () {
                            _showAlertDialogLogout(context);
                          },
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        GestureDetector(
                          onTap: () {
                            Route route = MaterialPageRoute(
                                builder: (context) => MoviesSearchScreen());
                            Navigator.push(context, route);
                          },
                          child: Container(
                            height: 40,
                            width: 50,
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20))),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Route route =
                      MaterialPageRoute(builder: (context) => FavoriteScreen());
                  Navigator.push(context, route);
                },
                child: Container(
                  width: 180,
                  height: 35,
                  padding: EdgeInsets.only(left: 7),
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Lihat Film Favoritmu',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.22,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 160.0,
                      color: Colors.red,
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.green,
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'Film Terbaru Menantimu',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.49,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  // This next line does the trick.
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    _showListView(),
                    _showListView(),
                    _showListView(),
                    _showListView(),
                    _showListView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showListView() {
    return Stack(
      children: [
        ClipRRect(
          child: Image.network(
            "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y29tcHV0ZXJ8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60",
            height: 120,
            width: 100,
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 116,
            top: 20,
            right: 16,
          ),
          child: Text(
            'Mulan Session 2  Battle Of Chi Bi',
            maxLines: 1,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 116,
            top: 40,
            right: 16,
          ),
          child: Text(
            'History, War',
            maxLines: 2,
            style: TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 116,
            top: 70,
            right: 16,
          ),
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 136,
        ),
      ],
    );
  }

  void _showAlertDialogLogout(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    _signOut(BuildContext context) async {
      await auth.signOut().then((_) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (Route<dynamic> route) => false);
      });
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Konfirmasi Logout'),
              Icon(
                Icons.logout,
                color: Colors.red,
              ),
            ],
          ),
          content: Text('Apa anda yakin ingin Logout dari akun anda ?'),
          actions: [
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              icon: Icon(Icons.check),
              onPressed: () => _signOut(context),
            ),
          ],
        );
      },
    );
  }
}
