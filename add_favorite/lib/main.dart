import 'package:add_favorite/FavoriteAppUseProvider/Provider/favorite_provider.dart';
import 'package:add_favorite/FavoriteAppUseProvider/favorite_using_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ChangeNotifierProvider : cung cấp khi thay đổi
    return ChangeNotifierProvider(
      // Tạo [ChangeNotifier] bằng cách tạo và tự động loại bỏ nó khi [ChangeNotifierProvider] bị xóa khỏi cây tiện ích.
      create: (context) => new FavoriteProvider(),
      child: const MaterialApp(
        home: PageFavoriteUsingProvider(),
      ),
    );
  }
}
