import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utiils/weather_helper.dart';
import '../modal/weather_model.dart';
import '../provider/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeProvider? providertrue;
  HomeProvider? providerfalse;

  @override
  Widget build(BuildContext context) {
    providertrue = Provider.of<HomeProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
                height: 500,
                width: 500,
                child: Image.asset(
                  "assets/img/download.jpg",
                  fit: BoxFit.fill,
                )),

            FutureBuilder(
              future: Api_http().weatherdata(providertrue!.city == null
                  ? "Surat"
                  : "${providertrue!.city}"),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                }
                if (snapshot.hasData) {
                  Homemodel? h1 = snapshot.data;
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            controller: providertrue!.txtcity,
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              suffixIcon: InkWell(
                                onTap: () {
                                  providertrue!.search();
                                },
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                              ),
                              label: Text(
                                "Search",
                                style: TextStyle(color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  ),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  ),
                            ),
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        SizedBox(
                          height: 350,
                        ),
                        SizedBox(height: 20),
                        Container(
                            height: 0.7,
                            width: double.infinity,
                            color: Colors.black),
                        SizedBox(height: 5,),
                        Container(
                            height: 0.7,
                            width: double.infinity,
                            color: Colors.black),
                        Center(
                          child: Text(
                            " 🏳‍${h1!.name}🏳",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Container(
                            height: 0.7,
                            width: double.infinity,
                            color: Colors.black),
                        SizedBox(height: 5,),
                        Container(
                            height: 0.7,
                            width: double.infinity,
                            color: Colors.black),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${(h1.main!.temp! - 273).toStringAsFixed(0)}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 90,
                                  fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 72),
                              child: Text(
                                ".",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 75),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 11),
                              child: Text(
                                "c",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 45),

                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
