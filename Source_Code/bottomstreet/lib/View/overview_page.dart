import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;

//API_SERVICE FOR OVERVIEW
Future<Overview?> fetchOverviews() async
{
  var response = await
  http.get(Uri.parse('https://api.stockedge.com/Api/SecurityDashboardApi/GetCompanyEquityInfoForSecurity/5051?lang=en'));

  if(response.statusCode == 200)
  {
    return Overview.fromJson(jsonDecode(response.body));
  }
  else
  {
    throw Exception('Failed to load album');
  }
}

//MODEL FOR OVERVIEW
class Overview {

  Overview({
    required this.id,
    required this.security,
    required this.industryId,
    required this.industry,
    required this.sectorId,
    required this.sector,
    required this.mcap,
    required this.ev,
    required this.evDateEnd,
    required this.bookNavPerShare,
    required this.ttmpe,
    required this.ttmYearEnd,
    required this.welcomeYield,
    required this.yearEnd,
    required this.sectorSlug,
    required this.industrySlug,
    required this.securitySlug,
    required this.pegRatio,
  });

  final int id;
  final String security;
  final int industryId;
  final String industry;
  final int sectorId;
  final String sector;
  final double mcap;
  final dynamic ev;
  final dynamic evDateEnd;
  final double bookNavPerShare;
  final double ttmpe;
  final int ttmYearEnd;
  final double welcomeYield;
  final int yearEnd;
  final String sectorSlug;
  final String industrySlug;
  final String securitySlug;
  final double pegRatio;

  factory Overview.fromJson(Map<String, dynamic> json) => Overview(
    id: json["ID"],
    security: json["Security"],
    industryId: json["IndustryID"],
    industry: json["Industry"],
    sectorId: json["SectorID"],
    sector: json["Sector"],
    mcap: json["MCAP"].toDouble(),
    ev: json["EV"],
    evDateEnd: json["EVDateEnd"],
    bookNavPerShare: json["BookNavPerShare"].toDouble(),
    ttmpe: json["TTMPE"].toDouble(),
    ttmYearEnd: json["TTMYearEnd"],
    welcomeYield: json["Yield"].toDouble(),
    yearEnd: json["YearEnd"],
    sectorSlug: json["SectorSlug"],
    industrySlug: json["IndustrySlug"],
    securitySlug: json["SecuritySlug"],
    pegRatio: json["PEGRatio"].toDouble(),
  );

}


//SCREEN PAGE FOR OVERVIEW
class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {

  late Future<Overview?> futureOverview;

  @override
  void initState()
  {
    super.initState();
    futureOverview = fetchOverviews();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Center(
        child: FutureBuilder<Overview?>(
          future: futureOverview,
          builder: (context,snapshot){
            if(snapshot.hasData)
              {
                return Container(
                    height: 350,
                    width: 380,
                    child: Card(
                      elevation: 5,
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Sector',style: TextStyle(fontFamily: 'ProductSans',fontSize: 15)),
                                    Text('${snapshot.data!.sector}',style: TextStyle(fontFamily: 'ProductSans',fontSize: 15))
                                  ]
                              ),
                              SizedBox(height: 20),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Industry',style: TextStyle(fontFamily: 'ProductSans',fontSize: 15)),
                                    Text('${snapshot.data!.industry}',style: TextStyle(fontFamily: 'ProductSans',fontSize: 15))
                                  ]
                              ),
                              SizedBox(height: 20),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Market Cap.',style: TextStyle(fontFamily: 'ProductSans',fontSize: 15)),
                                    Text('${snapshot.data!.mcap} Cr',style: TextStyle(fontFamily: 'ProductSans',fontSize: 15))
                                  ]
                              ),
                              SizedBox(height: 20),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Enterprise value(EV)',style: TextStyle(fontFamily: 'ProductSans',fontSize: 15)),
                                    Text('${snapshot.data!.ev}',style: TextStyle(fontFamily: 'ProductSans',fontSize: 15))
                                  ]
                              ),
                              SizedBox(height: 20),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Book Value/ Share',style: TextStyle(fontFamily: 'ProductSans',fontSize: 15)),
                                    Text('${snapshot.data!.bookNavPerShare}',style: TextStyle(fontFamily: 'ProductSans',fontSize: 15))
                                  ]
                              ),
                              SizedBox(height: 20),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Price-Earning Ratio(PE)',style: TextStyle(fontFamily: 'ProductSans',fontSize: 15)),
                                    Text('${snapshot.data!.ttmpe.toStringAsFixed(2)}',style: TextStyle(fontFamily: 'ProductSans',fontSize: 15))
                                  ]
                              ),
                              SizedBox(height: 20),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('PEG Ratio',style: TextStyle(fontFamily: 'ProductSans',fontSize: 15)),
                                    Text('${snapshot.data!.pegRatio.toStringAsFixed(2)}',style: TextStyle(fontFamily: 'ProductSans',fontSize: 15))
                                  ]
                              ),
                              SizedBox(height: 20),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Dividend Yield',style: TextStyle(fontFamily: 'ProductSans',fontSize: 15)),
                                    Text('${snapshot.data!.welcomeYield.toStringAsFixed(2)}',style: TextStyle(fontFamily: 'ProductSans',fontSize: 15))
                                  ]
                              ),
                            ],
                          )
                      ),
                    ),
                );
              }
            else if(snapshot.hasError)
              {
                return Text('${snapshot.error}');
              }
            return const CircularProgressIndicator();
          },
        ),
    );
  }
}

