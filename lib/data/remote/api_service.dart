import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../utils/app_constants.dart';
import '../modal/image_modal.dart';



// ApiService: Handles API calls to fetch images from Pixabay
class ApiService {
  final String _apiKey = AppConstant.apiKey;

  /// Fetch images from Pixabay API with pagination support
  Future<List<ImageModel>> fetchImages(int page) async {
    final response = await http.get(
      Uri.parse('https://pixabay.com/api/?key=$_apiKey&per_page=40&page=$page'),
    );

    if (response.statusCode == 200) {
      final List imagesJson = json.decode(response.body)['hits'];
      return imagesJson.map((json) => ImageModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load images');
    }
  }
}
