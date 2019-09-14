
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInterfacesList extends StatelessWidget{

    @override
    Widget build(BuildContext context){
        return Material(
            child: ListView(
                children: <Widget>[
                    _luxuryJewelryECommerce(context),
                ],
            )
        );
    }

    Widget _luxuryJewelryECommerce(BuildContext context){
        Widget leading = Icon(Icons.pages, color: Colors.white,);
        Widget title = Text("Jewelry E-Commerce", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold));
        Widget subtitle = Text("By Fatimah on Dribbble", style: TextStyle(color: Colors.white));
        return DecoratedBox(
            decoration: BoxDecoration(
                color: Color(0xff957363),
            ),
            child: _listTile(leading, title, subtitle, () => _navigateToJewelryECommerce(context)),
        );
    }

    void _navigateToJewelryECommerce(BuildContext context){
        Navigator.of(context).pushNamed("JewelryECommercePage");
    }

    ListTile _listTile(Widget leading, Widget title, Widget subtitle, Function trailingFunction){
        return ListTile(
            leading: leading,
            title: title,
            trailing: _trailingWidget(trailingFunction),
            subtitle: subtitle,
        );
    }

    Widget _trailingWidget(Function onPressed){
        return FlatButton.icon(
            icon: Icon(Icons.pageview, color: Colors.white,),
            label: Text("Take me there!", style: TextStyle(color: Colors.white),),
            onPressed: onPressed,
        );
    }
}