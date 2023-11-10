import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<void> updatePlantwatering(int idx, int watering) async {
  try {
    final response = await http.put(
      Uri.parse('정보주소'),
      body: json.encode({'watering': watering}),
    );
    if (response.statusCode == 200) {
      // 성공적으로 업데이트됨
    } else {
      // 서버에서 에러 응답
      debugPrint('Error updating watering: ${response.statusCode}');
    }
  } catch (e) {
    debugPrint('fail sending watering');
  }
}
