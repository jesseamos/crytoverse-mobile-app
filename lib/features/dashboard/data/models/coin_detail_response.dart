// Root response
class CoinDetailResponse {
  final String status;
  final CoinDetailData data;

  CoinDetailResponse({required this.status, required this.data});

  factory CoinDetailResponse.fromJson(Map<String, dynamic> json) {
    return CoinDetailResponse(
      status: json['status'],
      data: CoinDetailData.fromJson(json['data']),
    );
  }
}

// Data wrapper
class CoinDetailData {
  final CoinDetail coin;

  CoinDetailData({required this.coin});

  factory CoinDetailData.fromJson(Map<String, dynamic> json) {
    return CoinDetailData(coin: CoinDetail.fromJson(json['coin']));
  }
}

// Coin detail model
class CoinDetail {
  final String uuid;
  final String symbol;
  final String name;
  final String description;
  final String color;
  final String iconUrl;
  final String websiteUrl;
  final List<CoinLink> links;
  final Supply supply;
  final int numberOfMarkets;
  final int numberOfExchanges;
  final String volume24h;
  final String marketCap;
  final String fullyDilutedMarketCap;
  final String price;
  final String btcPrice;
  final int priceAt;
  final String change;
  final int rank;
  final List<String> sparkline;
  final AllTimeHigh allTimeHigh;
  final String coinrankingUrl;
  final int tier;
  final bool lowVolume;
  final int listedAt;
  final bool hasContent;
  final dynamic notices;
  final List<String> contractAddresses;
  final List<String> tags;
  final bool isWrappedTrustless;
  final String? wrappedTo;

  CoinDetail({
    required this.uuid,
    required this.symbol,
    required this.name,
    required this.description,
    required this.color,
    required this.iconUrl,
    required this.websiteUrl,
    required this.links,
    required this.supply,
    required this.numberOfMarkets,
    required this.numberOfExchanges,
    required this.volume24h,
    required this.marketCap,
    required this.fullyDilutedMarketCap,
    required this.price,
    required this.btcPrice,
    required this.priceAt,
    required this.change,
    required this.rank,
    required this.sparkline,
    required this.allTimeHigh,
    required this.coinrankingUrl,
    required this.tier,
    required this.lowVolume,
    required this.listedAt,
    required this.hasContent,
    required this.notices,
    required this.contractAddresses,
    required this.tags,
    required this.isWrappedTrustless,
    this.wrappedTo,
  });

  factory CoinDetail.fromJson(Map<String, dynamic> json) {
    return CoinDetail(
      uuid: json['uuid'],
      symbol: json['symbol'],
      name: json['name'],
      description: json['description'],
      color: json['color'],
      iconUrl: json['iconUrl'],
      websiteUrl: json['websiteUrl'],
      links: (json['links'] as List).map((e) => CoinLink.fromJson(e)).toList(),
      supply: Supply.fromJson(json['supply']),
      numberOfMarkets: json['numberOfMarkets'],
      numberOfExchanges: json['numberOfExchanges'],
      volume24h: json['24hVolume'],
      marketCap: json['marketCap'],
      fullyDilutedMarketCap: json['fullyDilutedMarketCap'],
      price: json['price'],
      btcPrice: json['btcPrice'],
      priceAt: json['priceAt'],
      change: json['change'],
      rank: json['rank'],
      sparkline: List<String>.from(json['sparkline']),
      allTimeHigh: AllTimeHigh.fromJson(json['allTimeHigh']),
      coinrankingUrl: json['coinrankingUrl'],
      tier: json['tier'],
      lowVolume: json['lowVolume'],
      listedAt: json['listedAt'],
      hasContent: json['hasContent'],
      notices: json['notices'],
      contractAddresses: List<String>.from(json['contractAddresses']),
      tags: List<String>.from(json['tags']),
      isWrappedTrustless: json['isWrappedTrustless'],
      wrappedTo: json['wrappedTo'],
    );
  }
}

// Coin links
class CoinLink {
  final String name;
  final String url;
  final String type;

  CoinLink({required this.name, required this.url, required this.type});

  factory CoinLink.fromJson(Map<String, dynamic> json) {
    return CoinLink(name: json['name'], url: json['url'], type: json['type']);
  }
}

// Supply model
class Supply {
  final bool confirmed;
  final int supplyAt;
  final String max;
  final String total;
  final String circulating;

  Supply({
    required this.confirmed,
    required this.supplyAt,
    required this.max,
    required this.total,
    required this.circulating,
  });

  factory Supply.fromJson(Map<String, dynamic> json) {
    return Supply(
      confirmed: json['confirmed'],
      supplyAt: json['supplyAt'],
      max: json['max'],
      total: json['total'],
      circulating: json['circulating'],
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
