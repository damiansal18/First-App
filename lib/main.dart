import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Final App';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}
class LocationWidget extends StatelessWidget{
  LocationWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget LocationSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //add map
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text('COPY ADDRESS',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.content_copy),
                  onPressed: (
                      // copy address to clipboard
                      ) {},
                ),
              ],
            ),
          ),
          //should be changed to button , on pressed( pop up with lo cations)
          Text('Change Address',
            style: TextStyle(color: Colors.deepOrange[500],
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
    Widget CovidSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.warning, color: Colors.red, size: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text('COVID-19 DISCLAIMER',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text("All orders must be take out or delivery! Thank You Stay Safe! <33", style: TextStyle(fontSize: 18),),
          )
        ],
      ),
    );
    Widget InfoSection = Container(
      padding: const EdgeInsets.all(32),
      child: Column(
          children:[
            Text('West Coast Mexican Cuisine',
                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold , fontSize: 24)),
            Text('123 Sesame Street',
                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold , fontSize: 24)),
            Text('San Diego California',
                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold , fontSize: 24)),
            Text('Tel: (619)836-9776',
                style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold , fontSize: 24))
          ]
      ),
    );
    return Container(
      child: ListView(
          children: [
            Card(
              child: Container(
                padding:  EdgeInsets.all(20),
                child:
                Expanded(
                  child:
                  Align(
                    alignment: Alignment.center,
                    child:
                    Text(
                        'MAP'
                    ),
                  ),
                ),
              ),
            ),
            LocationSection,
            CovidSection,
            InfoSection
          ]
      ),
    );
  }
}


class OrderWidget extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<OrderWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _showTakeoutSheetCallback() {
    _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) {
      return Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.deepOrange)),
            color: Colors.orangeAccent
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 32.0, bottom: 32, left: 100, right: 100),
          child: Text('Takeout Order Placed!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
        ),
      );
    });
  }
  void _showDeliverySheetCallback() {
    _scaffoldKey.currentState.showBottomSheet<void>((BuildContext context) {
      return Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.deepOrange)),
            color: Colors.orangeAccent
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 32.0, bottom: 32, left: 100, right: 100),
          child: Text('Delivery Order Placed!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                    color: Colors.black87,
                    textColor: Colors.deepOrange,
                    onPressed: _showTakeoutSheetCallback,
                    child: const Text('Order Takeout' ,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight:
                            FontWeight.bold))
                ),
                RaisedButton(
                    color: Colors.black87,
                    textColor: Colors.deepOrange,
                    onPressed: _showDeliverySheetCallback,
                    child: Text('Order Delivery',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold))
                )
              ]
          ),
        )
    );
  }
}

// This is the stateless widget that contains the modal sheet.
class MenuWidget extends StatelessWidget {
  MenuWidget({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'images/lajollaview.jpg',
            width: 300,
            height: 400,
            fit: BoxFit.cover,
          ),
          Card(
            child: Container(
              child:
              Expanded(
                child:
                Align(
                  alignment: Alignment.center,
                  child:
                  Text(
                      'WELCOME'
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child:Align(
              alignment: Alignment.bottomCenter,
              child: AspectRatio(
                aspectRatio: 7/2,
                child:RaisedButton(
                  color: Colors.black87,
                  textColor: Colors.deepOrange,
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => MenuList()));
                  },
                  child: const Text("See Our Menu !!!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//class for menu view
class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold , fontSize: 24)),
        backgroundColor: Colors.red,
      ),
      body: GridView.count(
        crossAxisCount: 1,
        children:  <Widget>[
          Image.asset('images/taco.jpg'),
          new ListTile(
              leading: new Icon(Icons.whatshot),
              title: new Text('Mild Taco', style: TextStyle(color:Colors.black87, fontWeight: FontWeight.bold ,fontSize: 20)),
              subtitle: new Text('Corn tortilla tacos served with Avocado Salsa, cilantro, tomato and your choice of carne asada or chicken.', style: TextStyle(color:Colors.black87 ,fontSize: 18)),
              dense: true,
              onTap: () => {}
          ),
          Image.asset('images/spicyBurrito.jpeg'),
          new ListTile(
              leading: new Icon(Icons.whatshot),
              title: new Text('Spicy Burrito', style: TextStyle(color:Colors.black87, fontWeight: FontWeight.bold ,fontSize: 20)),
              subtitle: new Text('Our Iconic Burrito served with our house-made Red Chili Salsa.', style: TextStyle(color:Colors.black87 ,fontSize: 18)),
              dense: true,
              onTap: () => {}
          ),
          Image.asset('images/nachos.jpg'),
          new ListTile(
              leading: new Icon(Icons.whatshot),
              title: new Text('Nachos del Diablo', style: TextStyle(color:Colors.black87, fontWeight: FontWeight.bold ,fontSize: 20)),
              subtitle: new Text('Fresh chips served with Carolina Reaper Diablo Salsa.\nWARNING: Extreme heat can cause hallucinations.', style: TextStyle(color:Colors.black87 ,fontSize: 18)),
              dense: true,
              onTap: () => {}
          ),
          Image.asset('images/morisqueta.jpg'),
          new ListTile(
              leading: new Icon(Icons.whatshot),
              title: new Text('Morisqueta',  style: TextStyle(color:Colors.black87, fontWeight: FontWeight.bold ,fontSize: 20)),
              subtitle: new Text('White rice with boiled beans on top then layered with spicy pork chops and mouth watering sour cream', style: TextStyle(color:Colors.black87 ,fontSize: 18)),
              dense: true,
              onTap: () => {}
          ),
          Image.asset('images/enchiladas.jpg'),
          new ListTile(
              leading: new Icon(Icons.whatshot),
              title: new Text('Enchiladas al Michoacan',  style: TextStyle(color:Colors.black87, fontWeight: FontWeight.bold ,fontSize: 20)),
              subtitle: new Text('Fried corn tortilla dipped in chili sauce then filled with chicken and topped with lettuce,tomato,sour cream and cheese', style: TextStyle(color:Colors.black87 ,fontSize: 18)),
              dense: true,
              onTap: () => {}
          ),
          Image.asset('images/chilaquiles.jpg'),
          new ListTile(
              leading: new Icon(Icons.whatshot),
              title: new Text('Chilaquiles',  style: TextStyle(color:Colors.black87, fontWeight: FontWeight.bold ,fontSize: 20)),
              subtitle: new Text('Fried corn tortilla strips layered with beans, chili sauce and sour cream. Served with your choice of chicken or beef', style: TextStyle(color:Colors.black87 ,fontSize: 18)),
              dense: true,
              onTap: () => {}
          ),
          Image.asset('images/tamales.jpeg'),
          new ListTile(
              leading: new Icon(Icons.whatshot),
              title: new Text('Seasonal Tamales',  style: TextStyle(color:Colors.black87, fontWeight: FontWeight.bold ,fontSize: 20)),
              subtitle: new Text('Choose between 3 different tamales: Pineapple, Beef, or Chicken', style: TextStyle(color:Colors.black87 ,fontSize: 18)),
              dense: true,
              onTap: () => {}
          ),
          Image.asset('images/mulita.jpg'),
          new ListTile(
              leading: new Icon(Icons.whatshot),
              title: new Text('Mulita',  style: TextStyle(color:Colors.black87, fontWeight: FontWeight.bold ,fontSize: 20)),
              subtitle: new Text('Similar to a quesadilla, but inlcludes oaxacan cheese filled with salsa, cilantro and carne asada ', style: TextStyle(color:Colors.black87 ,fontSize: 18)),
              dense: true,
              onTap: () => {}
          ),


        ],
      ),
      extendBody: true,
    );
  }

}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}
/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('West Coast Mexican Cuisine', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold , fontSize: 24)),
            backgroundColor: Colors.red,
            bottom: TabBar(
              indicatorColor: Colors.black,
              isScrollable: true,
              tabs: [
                Tab(
                  //text: " MENU ",
                  icon: Icon(Icons.fastfood,color: Colors.black,),
                  iconMargin: EdgeInsets.all(10) ,
                ),
                Tab(
                  // text: " ORDER ",
                  icon: Icon(Icons.attach_money,color: Colors.black),
                  iconMargin: EdgeInsets.all(10) ,
                ),
                Tab(
                  // text: " LOCATION ",
                  icon: Icon(Icons.location_on, color: Colors.black,),
                  iconMargin: EdgeInsets.all(10) ,
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              MenuWidget(),
              OrderWidget(),
              LocationWidget(),
            ],
          )
      ),
    );
  }
}
