import 'dart:convert';
import 'package:d_method/d_method.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:toko_buah/common/auth.common.dart';
import 'package:toko_buah/model/product/category.product.dart';

class ListProductCategory {
  // Ganti dengan URL API Anda yang sebenarnya.
  static final String apiUrl = "${dotenv.env["API_URL"]}/product/food-category";

  static Future<ListCategoryModel?> fetchCategoriesProduct() async {
    final token = await AuthCommon.getToken();
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {"authorization": "$token"},
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final List<dynamic> dataArray = jsonResponse['data'];

        ListCategoryModel data = ListCategoryModel.fromJson({
          'data': dataArray,
        });

        return data;
      } else {
        // Jika respons tidak 200, lempar exception atau kembalikan null.
        throw Exception(
          'Gagal memuat data kategori: Status ${response.statusCode}',
        );
      }
    } catch (e) {
      DMethod.log('Terjadi error: $e');
      return null;
    }
  }
}
