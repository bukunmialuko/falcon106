import 'package:flutter/material.dart';

import 'helpers/dependency_assembly.dart';
import 'ui/app_theme.dart';
import 'ui/views/product_list_view.dart';

void main() {
  setupDependencyAssembler();

  runApp(ShopNBuyApp());
}

class ShopNBuyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.data,
      home: ProductListView(),
    );
  }
}
