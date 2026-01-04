// Root response
class CryptoResponse {
  final String status;
  final CryptoData data;
  final Pagination pagination;

  CryptoResponse({
    required this.status,
    required this.data,
    required this.pagination,
  });

  factory CryptoResponse.fromJson(Map<String, dynamic> json) {
    return CryptoResponse(
      status: json['status'],
      data: CryptoData.fromJson(json['data']),
      pagination: Pagination.fromJson(json['pagination']),
    );
  }
}

// Data wrapper
class CryptoData {
  final Stats stats;
  final List<Coin> coins;

  CryptoData({required this.stats, required this.coins});

  factory CryptoData.fromJson(Map<String, dynamic> json) {
    return CryptoData(
      stats: Stats.fromJson(json['stats']),
      coins: (json['coins'] as List).map((e) => Coin.fromJson(e)).toList(),
    );
  }
}

// Stats model
class Stats {
  final int total;
  final int totalCoins;
  final int totalMarkets;
  final int totalExchanges;
  final String totalMarketCap;
  final String total24hVolume;

  Stats({
    required this.total,
    required this.totalCoins,
    required this.totalMarkets,
    required this.totalExchanges,
    required this.totalMarketCap,
    required this.total24hVolume,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      total: json['total'],
      totalCoins: json['totalCoins'],
      totalMarkets: json['totalMarkets'],
      totalExchanges: json['totalExchanges'],
      totalMarketCap: json['totalMarketCap'],
      total24hVolume: json['total24hVolume'],
    );
  }
}

// Coin model
class Coin {
  final String uuid;
  final String symbol;
  final String name;
  final String? color;
  final String iconUrl;
  final String marketCap;
  final String price;
  final int listedAt;
  final int tier;
  final String change;
  final int rank;
  final List<String> sparkline;
  final AllTimeHigh allTimeHigh;
  final bool lowVolume;
  final String coinrankingUrl;
  final String volume24h;
  final String btcPrice;
  final List<String> contractAddresses;
  final bool isWrappedTrustless;
  final String? wrappedTo;

  Coin({
    required this.uuid,
    required this.symbol,
    required this.name,
    required this.color,
    required this.iconUrl,
    required this.marketCap,
    required this.price,
    required this.listedAt,
    required this.tier,
    required this.change,
    required this.rank,
    required this.sparkline,
    required this.allTimeHigh,
    required this.lowVolume,
    required this.coinrankingUrl,
    required this.volume24h,
    required this.btcPrice,
    required this.contractAddresses,
    required this.isWrappedTrustless,
    this.wrappedTo,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      uuid: json['uuid'],
      symbol: json['symbol'],
      name: json['name'],
      color: json['color'],
      iconUrl: json['iconUrl'],
      marketCap: json['marketCap'],
      price: json['price'],
      listedAt: json['listedAt'],
      tier: json['tier'],
      change: json['change'],
      rank: json['rank'],
      sparkline: List<String>.from(json['sparkline']),
      allTimeHigh: AllTimeHigh.fromJson(json['allTimeHigh']),
      lowVolume: json['lowVolume'],
      coinrankingUrl: json['coinrankingUrl'],
      volume24h: json['24hVolume'],
      btcPrice: json['btcPrice'],
      contractAddresses: List<String>.from(json['contractAddresses']),
      isWrappedTrustless: json['isWrappedTrustless'],
      wrappedTo: json['wrappedTo'],
    );
  }
}

// All-time high
class AllTimeHigh {
  final String price;
  final int timestamp;

  AllTimeHigh({required this.price, required this.timestamp});

  factory AllTimeHigh.fromJson(Map<String, dynamic> json) {
    return AllTimeHigh(price: json['price'], timestamp: json['timestamp']);
  }
}

// Pagination model
class Pagination {
  final int limit;
  final bool hasNextPage;
  final bool hasPreviousPage;
  final String? nextCursor;
  final String? previousCursor;

  Pagination({
    required this.limit,
    required this.hasNextPage,
    required this.hasPreviousPage,
    this.nextCursor,
    this.previousCursor,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      limit: json['limit'],
      hasNextPage: json['hasNextPage'],
      hasPreviousPage: json['hasPreviousPage'],
      nextCursor: json['nextCursor'],
      previousCursor: json['previousCursor'],
    );
  }
}
