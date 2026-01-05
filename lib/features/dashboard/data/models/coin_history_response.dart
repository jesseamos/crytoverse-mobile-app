// Root response
class CoinHistoryResponse {
  final String status;
  final CoinHistoryData data;

  CoinHistoryResponse({required this.status, required this.data});

  factory CoinHistoryResponse.fromJson(Map<String, dynamic> json) {
    return CoinHistoryResponse(
      status: json['status'],
      data: CoinHistoryData.fromJson(json['data']),
    );
  }
}

// Data wrapper
class CoinHistoryData {
  final String change;
  final List<PriceHistoryPoint> history;

  CoinHistoryData({required this.change, required this.history});

  factory CoinHistoryData.fromJson(Map<String, dynamic> json) {
    return CoinHistoryData(
      change: json['change'],
      history: (json['history'] as List)
          .map((e) => PriceHistoryPoint.fromJson(e))
          .toList(),
    );
  }
}

// Single history point
class PriceHistoryPoint {
  final String price;
  final int timestamp;

  PriceHistoryPoint({required this.price, required this.timestamp});

  factory PriceHistoryPoint.fromJson(Map<String, dynamic> json) {
    return PriceHistoryPoint(
      price: json['price'],
      timestamp: json['timestamp'],
    );
  }

  /// Optional helpers (great for charts)
  double get priceAsDouble => double.parse(price);

  DateTime get dateTime =>
      DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
}
