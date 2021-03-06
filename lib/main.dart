import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class ImageView extends StatelessWidget {

  final Function(File) onSelectImage;

  const ImageView({Key key, this.onSelectImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    onSelectImage(File());

    return Container();
  }
}


class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          ImageView(
            onSelectImage: (image){

            },
          ),
          TextFIelds(

          ),
          Password(

          )

        ],
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {

  final List<Widget> list = [
    Container(
      color: Colors.yellowAccent,
    ),
    Container(
      color: Colors.redAccent,
    ),
    Container(
      color: Colors.greenAccent,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<MyProvider>(
        create: (context) => MyProvider(),
        child: Consumer<MyProvider>(
          builder: (context, provider, child){
            return Scaffold(

              body: list[provider.index],

              bottomNavigationBar: BottomNavigationBar(
                currentIndex: provider.index,
                onTap: (index){
                  provider.setIndex(index);
                },
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(
                          Icons.star
                      ),
                      label: 'Yellow'
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                          Icons.star
                      ),
                      label: 'Red'
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                          Icons.star
                      ),
                      label: 'Green'
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class MyProvider extends ChangeNotifier{

  int index = 0;

  Future setIndex(int value) async{
    this.index = value;
    this.notifyListeners();
  }

}
