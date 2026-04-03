class StockModel {
    StockModel({
        required this.id,
        required this.stockName,
        required this.price,
        required this.target,
        required this.stopLoss,
        required this.quantity,
        required this.riskReward,
        required this.pnl,
    });

    final int? id;
    final String? stockName;
    final dynamic price;
    final dynamic target;
    final int? stopLoss;
    final int? quantity;
    final String? riskReward;
    final int? pnl;

    StockModel copyWith({
        int? id,
        String? stockName,
        dynamic? price,
        dynamic? target,
        int? stopLoss,
        int? quantity,
        String? riskReward,
        int? pnl,
    }) {
        return StockModel(
            id: id ?? this.id,
            stockName: stockName ?? this.stockName,
            price: price ?? this.price,
            target: target ?? this.target,
            stopLoss: stopLoss ?? this.stopLoss,
            quantity: quantity ?? this.quantity,
            riskReward: riskReward ?? this.riskReward,
            pnl: pnl ?? this.pnl,
        );
    }

    factory StockModel.fromJson(Map<String, dynamic> json){ 
        return StockModel(
            id: json["id"],
            stockName: json["stock_name"],
            price: json["price"],
            target: json["target"],
            stopLoss: json["stop_loss"],
            quantity: json["quantity"],
            riskReward: json["risk_reward"],
            pnl: json["pnl"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "stock_name": stockName,
        "price": price,
        "target": target,
        "stop_loss": stopLoss,
        "quantity": quantity,
        "risk_reward": riskReward,
        "pnl": pnl,
    };

    @override
    String toString(){
        return "$id, $stockName, $price, $target, $stopLoss, $quantity, $riskReward, $pnl, ";
    }
}


class Failure {
  final String message;
  Failure(this.message);
}
