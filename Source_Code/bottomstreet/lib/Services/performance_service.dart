
import 'package:http/http.dart' as http ;
import '../Model/performance_model.dart';


class PerformancesServices
{
  static var client = http.Client();

  static Future<List<Performance>?> fetchPerformances() async
  {
    var response = await
    client.get(Uri.parse('https://api.stockedge.com/Api/SecurityDashboardApi/GetTechnicalPerformanceBenchmarkForSecurity/5051?lang=en'));

    if(response.statusCode == 200)
    {
      var jsonString = response.body;
      return performanceFromJson(jsonString);
    }
    else
    {
      return null;
    }
  }

}