import 'dart:convert';
import 'package:bank/models/data_plan_form_model.dart';
import 'package:bank/models/topup_form_model.dart';
import 'package:bank/models/transaction_model.dart';
import 'package:bank/models/transfer_form_model.dart';
import 'package:bank/services/auth_service.dart';
import 'package:bank/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  Future<String> topup(TopupFormModel data) async {
    try {
      print(data.toJson());
      final token = await AuthService().getToken();
      final res = await http.post(
        Uri.parse('$baseUrl/top_ups'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: data.toJson(),
      );
      print(res.body);
      if (res.statusCode == 200) {
        return jsonDecode(res.body)['redirect_url'];
      }
      throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> transfer(TransferFormModel data) async {
    try {
      print(data.toJson());
      final token = await AuthService().getToken();
      final res = await http.post(
        Uri.parse('$baseUrl/transfers'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: data.toJson(),
      );
      print(res.body);
      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> dataPlan(DataPlanFormModel data) async {
    try {
      print(data.toJson());
      final token = await AuthService().getToken();
      final res = await http.post(
        Uri.parse('$baseUrl/data_plans'),
        headers: {
          'Authorization': 'Bearer $token',
        },
        body: data.toJson(),
      );
      print(res.body);
      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<TransactionModel>> getTransactions() async {
    try {
      final token = await AuthService().getToken();
      final res = await http.get(
        Uri.parse('$baseUrl/transactions'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print(res.body);
      if (res.statusCode == 200) {
        List<TransactionModel> transactions = List<TransactionModel>.from(
          jsonDecode(res.body)['data'].map(
            (transaction) => TransactionModel.fromJson(transaction),
          ),
        ).toList();

        return transactions;
      }
      return throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
