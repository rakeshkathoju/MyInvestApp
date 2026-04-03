import 'package:dio/dio.dart';
import 'package:myinvestapp/stocksdata/domain/domain_model.dart';



abstract class Function1<T1, R> {
  // Abstract method: Subclasses must implement this.
  R execute(T1 arg1,);
}



class DomainModelMapper implements Function1<Response, List<StockModel>> {
  @override
  List<StockModel> execute(Response response) {
  try {
    // 1. Cast response data to a List
    final List<dynamic> data = response.data;

    // 2. Map through the list and convert each item to a StockModel
    return data.map((item) => StockModel(
      id: item["id"],
      stockName: item["stock_name"],
      price: item["price"],
      target: item["target"],
      stopLoss: item["stop_loss"],
      quantity: item["quantity"],
      riskReward: item["risk_reward"],
      pnl: item["pnl"],
    )).toList();
    
  } catch (e) {
    // 3. Optional: log the actual error 'e' for easier debugging
    throw Exception("Failed to parse stock data: $e");
  }
}

}
