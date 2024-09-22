import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getPrediction(String location) async {
  try {
    final response = await http.post(
      Uri.parse('http://localhost:3000/predictions/getPrediction?location=$location'),
    );
    print('location '+location);
    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final prediction = data['prediction']['Dengue Prediction'];
      print('Prediction: $prediction');
      return prediction.toString() ?? 'No prediction available';
    } else {
      print('Failed to get prediction, status code: ${response.statusCode}');
      return 'Error: Failed to get prediction';
    }
  } catch (e) {
    print('Error getting prediction: $e');
    return 'Error: Failed to get prediction';
  }
}
