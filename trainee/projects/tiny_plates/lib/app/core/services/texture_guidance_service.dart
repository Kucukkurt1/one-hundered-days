import 'dart:convert';
import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

/// Fetches AI-generated texture guidance from the backend.
/// Endpoint: GET /api/guidance/texture?ageMonths=7&textureLevel=smooth
class TextureGuidanceService {
  TextureGuidanceService({http.Client? client})
      : _client = client ?? http.Client();

  final http.Client _client;

  String get _baseUrl {
    try {
      return Flavor.instance.getString('apiUrl') ?? 'https://api.example.com';
    } catch (_) {
      return 'https://api.example.com';
    }
  }

  Future<String?> fetchGuidance({
    required int ageMonths,
    required String textureLevel,
  }) async {
    try {
      final uri = Uri.parse('$_baseUrl/api/guidance/texture').replace(
        queryParameters: {
          'ageMonths': ageMonths.toString(),
          'textureLevel': textureLevel,
        },
      );

      final response = await _client.get(uri).timeout(
            const Duration(seconds: 10),
          );

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as Map<String, dynamic>;
        return data['tip'] as String?;
      }
      debugPrint('⚠️ TextureGuidanceService: HTTP ${response.statusCode}');
      return null;
    } catch (e) {
      debugPrint('⚠️ TextureGuidanceService error: $e');
      return null;
    }
  }
}
