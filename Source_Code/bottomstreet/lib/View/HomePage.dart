import 'package:bottomstreet/View/performance_page.dart';
import 'package:bottomstreet/View/overview_page.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#091945"),
        title: Center(child: Text('HomePage',style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold))),
      ),
      body: ListView(
         children: [
            Padding
            (
              padding: const EdgeInsets.fromLTRB(8, 10, 0, 0),
              child: Text('Overview',style: TextStyle(color: HexColor("#091945"),fontFamily: 'ProductSans',fontSize: 18)),
            ),
            Divider(thickness: 0.3,color: HexColor("#091945"), indent: 10,endIndent: 10),
            OverviewPage(),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 0, 0),
              child: Text('Performance',style: TextStyle(color: HexColor("#091945"),fontFamily: 'ProductSans',fontSize: 18)),
            ),
            Divider(thickness: 0.3,color: HexColor("#091945"), indent: 10,endIndent: 10),
            PerformancePage(),
            // SizedBox(height: 10),
          ],
        //),
      )
    );
  }
}
