
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class JewelryECommercePage extends StatefulWidget{
    @override
    State<StatefulWidget> createState(){
        return JewelryECommercePageState();
    }
}

class JewelryECommercePageState extends State<JewelryECommercePage>{

    // Don't do this at home kids
    final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();

    bool ringClicked = false;

    @override
    Widget build(BuildContext context){
        return Theme(
            child: _scaffold(),
            data: _themeData(),
        );
    }

    Scaffold _scaffold(){
        return Scaffold(
            appBar: ringClicked ? null : _appBar(),
            body: _body(),
            bottomNavigationBar: ringClicked ? null : _bottomNavigationBar(),
            backgroundColor: Color(0xfff1eeed),
            key: key,
        );
    }
    
    ThemeData _themeData(){
        return ThemeData(
            accentColor: Color(0xff957363),
            backgroundColor: Color(0xfff1eeed),
            buttonColor: Color(0xff957363),
            appBarTheme: _appBarTheme(),
        );
    }

    AppBarTheme _appBarTheme(){
        return AppBarTheme(
            color: Color(0xfff1eeed),
            elevation: 0,
            actionsIconTheme: _actionsIconTheme(),
            textTheme: _appBarTextTheme(),
        );
    }

    IconThemeData _actionsIconTheme(){
        return IconThemeData(
            color: Color(0xffc8c5c3),
            size: 30,
        );
    }

    TextTheme _appBarTextTheme(){
        return TextTheme(
            title: TextStyle(
                color: Colors.black, 
                fontWeight: FontWeight.bold
            )
        );
    }

    AppBar _appBar(){
        return AppBar(
            title: Padding(
                padding: EdgeInsets.only(left: 4),
                child: Text("Diamond Rings"),
            ),
            actions: <Widget>[
                Padding(
                    padding: EdgeInsets.only(right: 23),
                    child: Icon(Icons.list)
                ),
            ],
            automaticallyImplyLeading: false,
        );
    }

    Widget _body(){
        // Better way to achieve a staggered grid view would be to use
        // GridView.custom or a CustomMultiChildLayout
        // or even have a spacer between both Expanded widgets
        // and have them occupy most space and them get them off the edges
        // of the screen with Padding. The first solution is the better one though
        return SingleChildScrollView(
            child: Row(
                children: <Widget>[
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                                children: _rings(),
                            ),
                        ),
                    ),
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Column(
                                children: _rings().reversed.toList(),
                            )
                        )
                    ),
                ],
            ),
        );
    }

    List<Widget> _rings(){
        List<Widget> rings = List();
        rings.add(
            _ring("assets/images/ring_one.jpeg"),
        );
        rings.add(
            _ring("assets/images/ring_two.jpeg"),
        );
        rings.add(
            _ring("assets/images/ring_three.jpeg"),
        );
        rings.add(
            _ring("assets/images/ring_four.jpeg"),
        );
        rings.add(
            _ring("assets/images/ring_five.jpeg"),
        );
        return rings;
    }

    Widget _ring(String ringImageSrc){
        return Container(
            margin: EdgeInsets.only(top: 12, bottom: 12),
            padding: EdgeInsets.only(top: 12, bottom: 12),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                shape: BoxShape.rectangle,
            ),
            child: GestureDetector(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2.4,
                    child: Column(
                        children: <Widget>[
                            Image(image: ExactAssetImage(ringImageSrc)),
                            RichText(
                                text: TextSpan(
                                    text: "\$ 1000\n",
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                    children: [
                                        TextSpan(
                                            text: "Very cool Ring",
                                            style: TextStyle(fontWeight: FontWeight.w600),
                                        )
                                    ]
                                ),
                            ),
                        ],
                    ),
                ),
                onTap: () => _openBottomModalSheet(ringImageSrc),
            )
        );
    }

    void _openBottomModalSheet(String ringImageSrc){
        setState(() {
            ringClicked = true;
        });
        key.currentState.showBottomSheet(
            (BuildContext context) => _ringSheet(ringImageSrc),
            elevation: 0,
            shape: RoundedRectangleBorder(),
        );
    }

    Widget _ringSheet(String ringImageSrc){
        return WillPopScope(
            onWillPop: () async{
                setState(() {
                    ringClicked = false;
                });
                return true;
            },
            child: GestureDetector(
                onVerticalDragDown: (_){
                    setState(() {
                        Navigator.of(context).pop();
                        ringClicked = false;
                    });
                },
                child: Container(
                    color: Color(0xff957363),
                    child: Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: DecoratedBox(
                            position: DecorationPosition.background,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)
                                ),
                                color: Color(0xfffefcff)
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                    _ringSheetTopIcons(),
                                    Container(
                                        child: _ringSheetImage(ringImageSrc),
                                        margin: EdgeInsets.symmetric(vertical: 10),
                                    ),
                                    _sheetFavoriteIcon(),
                                    _ringSheetDescription(),
                                    _ringSheetQuantityAndPrice(),
                                    Text("Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore", textAlign: TextAlign.center,),
                                    RaisedButton(
                                        onPressed: (){},
                                        child: Text("ADD TO CART"),
                                    )
                                ],
                            ),
                        ),
                    ),
                ),
            ),
        );
    }

    Widget _ringSheetTopIcons(){
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                    Icon(Icons.shopping_basket, color: Color(0xff967363),),
                    Stack(
                        children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: Color(0xff967363)
                                ),
                                width: 16.0,
                                height: 16.0,
                                margin: EdgeInsets.all(4.0),
                            ),
                            Icon(Icons.cancel, color: Color(0xffd4d1cf),)
                        ],
                    ),
                ],
            ),
        );
    }

    Widget _ringSheetImage(String ringImageSrc){
        return Image(image: ExactAssetImage(ringImageSrc),);
    }

    Widget _sheetFavoriteIcon(){
        return Center(
            child: Icon(
                Icons.favorite, 
                color: Color(0xffd4d1cf),
                size: 30,
            ),
        );
    }

    Widget _ringSheetDescription(){
        return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(left: 16, bottom: 6),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "Very cool Ring by Pewdiepie", 
                            style: TextStyle(
                                fontWeight: FontWeight.bold
                            ),
                        ),
                    ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                            "100 Million Subscribers", 
                            textAlign: TextAlign.left, 
                            style: TextStyle(
                                fontWeight: FontWeight.bold, 
                                color: Color(0xff9c9a97)
                            ),
                        ),
                    ),
                ),
            ],
        );
    }

    Widget _ringSheetQuantityAndPrice(){
        return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                RaisedButton(
                    onPressed: (){},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                            Text("-"),
                            Text("1"),
                            Text("+")
                        ],
                    ),
                ),
                Text("\$ 1000")
            ],
        );
    }

    BottomNavigationBar _bottomNavigationBar(){
        return BottomNavigationBar(
            items: _bottomNavigationBarItems(),
            currentIndex: 3,
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.white,
            backgroundColor: Color(0xff9d867d),
            selectedIconTheme: IconThemeData(color: Colors.white),
            unselectedIconTheme: IconThemeData(color: Color(0xff513e34)),
        );
    }

    List<BottomNavigationBarItem> _bottomNavigationBarItems(){
        return [
            _homeItem(),
            _shoppingBagItem(),
            _favoritesItem(),
            _searchItem(),
            _peopleItem()
        ];
    }

    BottomNavigationBarItem _homeItem(){
        return _bottomNavigationBarItem(Icons.home);
    }

    BottomNavigationBarItem _shoppingBagItem(){
        return _bottomNavigationBarItem(Icons.shopping_basket);
    }

    BottomNavigationBarItem _favoritesItem(){
        return _bottomNavigationBarItem(Icons.favorite);
    }

    BottomNavigationBarItem _searchItem(){
        return _bottomNavigationBarItem(Icons.search);
    }

    BottomNavigationBarItem _peopleItem(){
        return _bottomNavigationBarItem(Icons.person);
    }

    BottomNavigationBarItem _bottomNavigationBarItem(IconData icon){
        return BottomNavigationBarItem(
            icon: Icon(icon),
            title: SizedBox(),
        );
    }

}