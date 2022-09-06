import 'package:bottomstreet/Model/performance_model.dart';
import 'package:bottomstreet/Services/performance_service.dart';
import 'package:get/get.dart';


class PerformanceController extends GetxController
{
  var performanceList = <Performance>[].obs;

  @override
  void onInit()
  {
    fetchPerformance();
    super.onInit();
  }

  void fetchPerformance() async
  {
    var products = await PerformancesServices.fetchPerformances();
    if(products != null)
    {
      performanceList.value = products as List<Performance>;
    }
  }

}