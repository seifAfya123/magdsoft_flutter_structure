import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/remote/dio_helper.dart';

class MyRepo {
  final DioHelper dioHelper;

  MyRepo(this.dioHelper);
  Future<dynamic> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> body,
  }) async {
    final person = await dioHelper;
  }
}
