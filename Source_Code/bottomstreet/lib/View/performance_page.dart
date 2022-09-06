import 'package:bottomstreet/Controller/performance_controller.dart';
import 'package:bottomstreet/View/performance_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PerformancePage extends StatefulWidget {
  const PerformancePage({Key? key}) : super(key: key);

  @override
  State<PerformancePage> createState() => _PerformancePageState();
}

class _PerformancePageState extends State<PerformancePage> {

  final PerformanceController performanceController = Get.put(PerformanceController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 370,
        width: 380,
        child: Card(
          elevation: 5,
          child: Column(
              children: [
                Expanded(
                    child: Obx(()=> ListView.separated(
                        itemCount: performanceController.performanceList.length,
                        separatorBuilder: (context, index)=>Container(height: 8),
                        itemBuilder: (context,index)
                        {
                          return PerformanceTile(performanceController.performanceList[index]);
                        }
                    )
                    ),
                )
            ]
          ),
        ),
      ),
    );
  }
}
