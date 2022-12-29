import 'package:flutter/cupertino.dart';

// ChangeNotifier : thay đổi thông báo
class FavoriteProvider extends ChangeNotifier {
  // list chứa các từ
  List<String> _words = [];
  // Trả về list
  List<String> get words => _words;

  // func thêm/xóa yêu thích
  void toggleFavorite(String word) {
    // biến kiểm tra
    final isExist =
        _words.contains(word); // kiểm tra mảng _words có chứa word ko
    if (isExist) {
      // nếu có thì xóa
      _words.remove(word);
    } else {
      // chưa có thì thêm
      _words.add(word);
    }
    // thực hiện lắng nghe
    notifyListeners();
  }

  //
  bool isExist(String word) {
    // biến kiểm tra
    final isExist =
        _words.contains(word); // kiểm tra mảng _words có chứa word ko
    return isExist;
  }

  // func dọn yêu thích
  void clearFavorite() {
    // dọn thành mảng mới
    _words = [];
    // thực hiện lắng nghe
    notifyListeners();
  }
}
