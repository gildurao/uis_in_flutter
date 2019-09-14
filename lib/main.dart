import 'package:flutter/material.dart';
import 'package:flutter_ui_fun/UserInterfacesList.dart';
import 'package:flutter_ui_fun/jewelry_ecommerce/JewelryECommercePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            theme: ThemeData(),
            home: UserInterfacesList(),
            routes: {
                "JewelryECommercePage" : (context) => JewelryECommercePage()
            },
        );
    }
}

