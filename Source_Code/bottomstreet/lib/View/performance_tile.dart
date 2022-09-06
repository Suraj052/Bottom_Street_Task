import 'package:bottomstreet/Model/performance_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:percent_indicator/percent_indicator.dart';


class PerformanceTile extends StatefulWidget {
  
  final Performance performance;
  const PerformanceTile(this.performance);
  
  @override
  State<PerformanceTile> createState() => _PerformanceTileState();
}

class _PerformanceTileState extends State<PerformanceTile> {

  
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Text(widget.performance.label,style: TextStyle(fontFamily: 'Productsans',fontSize: 15,color: Colors.black)),


            getwidget(),

            data()
     ],
    )
    );
  }

  Widget getwidget()
  {
    if(double.parse(widget.performance.changePercent.toStringAsFixed(2))>=100.00)
      {
        return
              LinearPercentIndicator(
                width: 150.0,
                lineHeight: 25.0,
                percent: 1.0,
                backgroundColor: HexColor('#ebeff5'),
                progressColor: Colors.green,
              );

      }

    else if(double.parse(widget.performance.changePercent.toStringAsFixed(2))>0.0)
    {
        return
              LinearPercentIndicator(
              width: 150.0,
              lineHeight: 25.0,
              percent: double.parse(widget.performance.changePercent.toStringAsFixed(2))/100.0,
              backgroundColor: HexColor('#ebeff5'),
              progressColor: Colors.green,
        );
    }

    else if(double.parse(widget.performance.changePercent.toStringAsFixed(2))<0.0)
      {
        return
              LinearPercentIndicator(
                width: 150.0,
                lineHeight: 25.0,
                percent: double.parse(widget.performance.changePercent.toStringAsFixed(2)).abs()/100.0,
                backgroundColor: HexColor('#ebeff5'),
                progressColor: Colors.redAccent,
              );

      }
    return const CircularProgressIndicator();
  }

  Widget data()
  {


    if(double.parse(widget.performance.changePercent.toStringAsFixed(2))>0.0)
    {
      return
            Row(
              children: [
                Icon(Icons.arrow_drop_up_rounded,color: Colors.green,size: 50),
                SizedBox(width: 0.2),
                Text('${widget.performance.changePercent.toStringAsFixed(2)} %',style: TextStyle(fontFamily: 'Productsans',fontSize: 15,color: Colors.green)),
              ],
            );
    }

    else if(double.parse(widget.performance.changePercent.toStringAsFixed(2))==399.02)
    {
      return
            Row(
              children: [
                Icon(Icons.arrow_drop_up_rounded,color: Colors.green,size: 50),
                SizedBox(width: 0.2),
                Text('${widget.performance.changePercent.toStringAsFixed(2)} %',style: TextStyle(fontFamily: 'Productsans',fontSize: 15,color: Colors.green)),
              ],
      );
    }
    else if(double.parse(widget.performance.changePercent.toStringAsFixed(2))<0.0)
    {
      return
            Row(
              children: [
                Icon(Icons.arrow_drop_down_rounded,color: Colors.red,size: 50),
                SizedBox(width: 0.2),
                Text('${widget.performance.changePercent.toStringAsFixed(2)} %',style: TextStyle(fontFamily: 'Productsans',fontSize: 15,color: Colors.red)),
              ],
            );
    }

    return const CircularProgressIndicator();
  }
}
