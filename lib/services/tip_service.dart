import 'dart:convert';

import 'package:bank/models/tip_model.dart';
import 'package:bank/services/auth_service.dart';
import 'package:http/http.dart' as http;

class TipsService {
  final String baseUrl = 'https://bwabank.my.id/api';

  Future<List<TipsModel>> getTips() async {
    try {
      final token = await AuthService().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/tips'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (res.statusCode == 200) {
        List<TipsModel> tips = List<TipsModel>.from(
          jsonDecode(res.body)['data'].map(
            (tip) => TipsModel.fromJson(tip),
          ),
        ).toList();

        return tips;
      }

      return throw jsonDecode(res.body)['message'];
    } catch (e) {
      rethrow;
    }
  }
}
