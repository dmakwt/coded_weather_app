import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cityController = TextEditingController();

  var tempCity = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: isLoading
          ? Center(
              child: CupertinoActivityIndicator(),
            )
          : Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    controller: cityController,
                    decoration: InputDecoration(
                      hintText: 'City',
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    try {
                      setState(() {
                        isLoading = true;
                      });

                      var response = await Dio().get(
                        'http://api.weatherstack.com/current?access_key=afe27c8314fee09a44128a27988797d5&query=${cityController.text}',
                      );

                      final temp = response.data['current']['temperature'];

                      setState(() {
                        tempCity = temp.toString();
                        isLoading = false;
                      });
                      print(temp);
                    } catch (error) {
                      print(error);
                    }
                  },
                  icon: Icon(Icons.search),
                  label: Text(
                    'Search',
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Stack(
                  children: [
                    Text(
                      tempCity,
                      style: TextStyle(
                        fontSize: 120,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Positioned(
                      right: 1,
                      child: Text(
                        '°',
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
