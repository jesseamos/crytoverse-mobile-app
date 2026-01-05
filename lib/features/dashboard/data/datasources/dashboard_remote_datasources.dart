import 'package:coinranking/core/errors/exceptions.dart';
import 'package:coinranking/core/errors/remote_error_handler.dart';
import 'package:coinranking/core/network/dio_client.dart';
import 'package:coinranking/core/utils/endpoints.dart';
import 'package:coinranking/features/dashboard/data/models/coin_detail_response.dart';
import 'package:coinranking/features/dashboard/data/models/coin_history_response.dart';
import 'package:coinranking/features/dashboard/data/models/crypto_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class DashboardRemoteDatasources {
  Future<CryptoResponse> getCoins({Map<String, dynamic>? qparams});
  Future<CoinDetailResponse> getCoinDetails({required String coinId});
  Future<CoinHistoryResponse> getCoinHistory({required String coinId});
}

class DashboardRemoteDatasourcesImpl implements DashboardRemoteDatasources {
  final DioClient dioClient;
  const DashboardRemoteDatasourcesImpl(this.dioClient);
  @override
  Future<CryptoResponse> getCoins({Map<String, dynamic>? qparams}) async {
    try {
      final response = await dioClient.get(
        Endpoints.coins,
        options: Options(
          headers: {
            'x-rapidapi-host': dotenv.env['X_RAPIDAPI_HOST'],
            'x-rapidapi-key': dotenv.env['X_RAPIDAPI_KEY'],
          },
        ),
      );
      if (response.statusCode == 200) {
        final res = response.data;
        if (res == null) {
          throw const ServerException('Response is null!');
        }
        return CryptoResponse.fromJson(res);
      } else if ((response.statusCode ?? 0) >= 400) {
        throw ServerException('${response.data['message']}');
      } else {
        throw ServerException('${response.data['message']}');
      }
    } on DioException catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      throw handleError(e);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      throw ServerException(e.toString());
    }
  }

  @override
  Future<CoinDetailResponse> getCoinDetails({required String coinId}) async {
    try {
      final response = await dioClient.get(
        Endpoints.getCoinsDetail(id: coinId),
        options: Options(
          headers: {
            'x-rapidapi-host': dotenv.env['X_RAPIDAPI_HOST'],
            'x-rapidapi-key': dotenv.env['X_RAPIDAPI_KEY'],
          },
        ),
      );
      if (response.statusCode == 200) {
        final res = response.data;
        if (res == null) {
          throw const ServerException('Response is null!');
        }
        return CoinDetailResponse.fromJson(res);
      } else if ((response.statusCode ?? 0) >= 400) {
        throw ServerException('${response.data['message']}');
      } else {
        throw ServerException('${response.data['message']}');
      }
    } on DioException catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      throw handleError(e);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      throw ServerException(e.toString());
    }
  }

  @override
  Future<CoinHistoryResponse> getCoinHistory({required String coinId}) async {
    try {
      final response = await dioClient.get(
        Endpoints.getCoinsHistory(id: coinId),
        options: Options(
          headers: {
            'x-rapidapi-host': dotenv.env['X_RAPIDAPI_HOST'],
            'x-rapidapi-key': dotenv.env['X_RAPIDAPI_KEY'],
          },
        ),
      );
      if (response.statusCode == 200) {
        final res = response.data;
        if (res == null) {
          throw const ServerException('Response is null!');
        }
        return CoinHistoryResponse.fromJson(res);
      } else if ((response.statusCode ?? 0) >= 400) {
        throw ServerException('${response.data['message']}');
      } else {
        throw ServerException('${response.data['message']}');
      }
    } on DioException catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      throw handleError(e);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      throw ServerException(e.toString());
    }
  }
}
