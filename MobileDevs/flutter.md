## FLUTTER

It is google's mobile app sdk which builds native **ios** and **android** apps from a single code base. 

Following is the *Flutter* file structure:

* android − Auto generated source code to create android application

* ios − Auto generated source code to create ios application

* lib − Main folder containing Dart code written using flutter framework

* ib/main.dart − Entry point of the Flutter application

* test − Folder containing Dart code to test the flutter application

* test/widget_test.dart − Sample code

* .gitignore − Git version control file

* .metadata − auto generated by the flutter tools

* .packages − auto generated to track the flutter packages

* .iml − project file used by Android studio

* pubspec.yaml − Used by Pub, Flutter package manager

* pubspec.lock − Auto generated by the Flutter package manager, Pub

README.md − Project description file written in Markdown format

### *SECTION-1: Intro to Flutter*
    * Installing Flutter on Android Studio
    * First Flutter Application

#### Installing Flutter in Android Studio
To install *Flutter* in android studion firstly run **Android Studio** than select *configure* from bottom-right of the pannel than select *plugins* than go-to *marketplace* tab and search for **flutter** once *flutter* is found click *install* than the plugin will be installed automatically and prompt to restart IDE. Restart the IDE and you can see a new option **+ Create a New Flutter Project** which indicates that flutter is installed successfully. 

#### First Flutter Application
To create a first flutter application click on *+ Create a New Flutter Project* than provide *project_name*, next show the **flutter sdk** path if already installed else select a location to install the flutter sdk and click on *install sdk* once the installation is done than select a project location for the new project than click *next* in the next step make sure that **Include Kotlin support for android code** & **Include Swift support for IOS code** than click **Finish**

```java
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),

      ), //const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

}
```

This is the first basic layout of the application. Which will create a layout with title bar with the title *"Welcome to Flutter"*

### *SECTION-2: Flutter States*
    * StatelessWidget Class - Does not update with any changes
    * StatefullWidget Class - Do update with the changes such as data, or visual effects

#### StatelessWidget Class
StatelessWidget class is an static layout class, where when the interface is built or constructed with given data it simply displays them and user can interact with the data. But any changes or update made to the values in a statelessWidget that will not be updated.
Basic Stateless Widget:

```java
void main() {
  runApp(Maestro());
}

class Maestro extends StatelessWidget{
  const Maestro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      title: 'Stateless Widget',
      home: Scaffold(
        body:  Container( // Container 1
          color: Colors.black26, // bg color
          child:  Container( // Container 2
            color: Colors.lightBlue, // bg color
            margin: const EdgeInsets.all(20.0),
          ),
        ),
      ),
    );
  }
}
```

The above code can also be written in the following way to make the code look less cluttered:

```java
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new Maestro());
}

class Maestro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stateless Widget",
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Statelss Widget"),
      ),
      body: Container(
        color: Colors.black45,
        child: Center(
          child: Text("This is from HomePage"),
        ),
      ),
    );
  }
}
```

In the above code we have made seperate class named **HomePage** for *home:* section in **Maestro** class and used it to build the scaffold.

* Container − Generic, single child, box based container widget with alignment, padding, border and margin along with rich styling features.

* Center − Simple, Single child container widget, which centers its child widget.

```java
 return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
          left: BorderSide(width: 1.0, color: Color(0xFFFFFFFFFF)),
          right: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
          bottom: BorderSide(width: 1.0, color: Color(0xFFFF000000)),
        ),
      ),
      child: Container(
        padding: const
            EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
            left: BorderSide(width: 1.0, color: Color(0xFFFFDFDFDF)),
            right: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
            bottom: BorderSide(width: 1.0, color: Color(0xFFFF7F7F7F)),
          )
        ),
        child: const Text(
            'OK',textAlign: TextAlign.center, style: TextStyle(color: Colors.black)
        ),
      ),
    );
```
Here,
* Container widget is the top level or root widget. Container is configured using decoration and padding property to layout its content.

* BoxDecoration has many properties like color, border, etc., to decorate the Container widget and here, color is used to set the color of the container.

* padding of the Container widget is set by using dgeInsets class, which provides the option to specify the padding value.

* Center is the child widget of the Container widget. Again, Text is the child of the Center widget. Text is used to show message and Center is used to center the text message with respect to the parent widget, Container.

#### *Multiple Child Widgets*
In this category, a given widget will have more than one child widgets and the layout of each widget is unique.

For example, Row widget allows the laying out of its children in horizontal direction, whereas Column widget allows laying out of its children in vertical direction. By composing Row and Column, widget with any level of complexity can be built.

Let us learn some of the frequently used widgets in this section.

* Row − Allows to arrange its children in a horizontal manner.

* Column − Allows to arrange its children in a vertical manner.

* ListView − Allows to arrange its children as list.

* GridView − Allows to arrange its children as gallery.

* Expanded − Used to make the children of Row and Column widget to occupy the maximum possible area.

* Table − Table based widget.

* Flow − Flow based widget.

* Stack − Stack based widget.

```java
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Advanced Layout",
      theme: ThemeData(
        primarySwatch: Colors.orange,
        canvasColor: Colors.black26,
      ),
      home: HomePage(title: "Product Layout Demo"),
    );
  }
}

class HomePage extends StatelessWidget {

  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(this.title),),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: [
          ProductBox(name: "ProductA", description: "ProductA Description", image: "profile.png", price: 1000),
          ProductBox(name: "ProductB", description: "ProductB Description", image: "profile.png", price: 2000),
          ProductBox(name: "ProductC", description: "ProductC Description", image: "profile.png", price: 3000),
          ProductBox(name: "ProductC", description: "ProductC Description", image: "profile.png", price: 3000),
          ProductBox(name: "ProductC", description: "ProductC Description", image: "profile.png", price: 3000),
          ProductBox(name: "ProductC", description: "ProductC Description", image: "profile.png", price: 3000),
          ProductBox(name: "ProductC", description: "ProductC Description", image: "profile.png", price: 3000),
          ProductBox(name: "ProductC", description: "ProductC Description", image: "profile.png", price: 3000),
          ProductBox(name: "ProductC", description: "ProductC Description", image: "profile.png", price: 3000),
          ProductBox(name: "ProductC", description: "ProductC Description", image: "profile.png", price: 3000),
        ],
      ),
    );
  }

}

// Product box Model
//_______________________________________
//|  _______                            |
//| |       |     |_______name______|   |
//| | image |     |____description__|   |
//| |_______|     |_______price_____|   |
//|                                     |
//______________________________________|

class ProductBox extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  final int price;

  const ProductBox({Key? key, required this.name, required this.description, required this.image, required this.price}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(this.image),
            Expanded(child: Container(
              padding: EdgeInsets.all(2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(this.name, style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(this.description),
                  Text("Price: "+this.price.toString())
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}


```
Please observe the following in the code −

    * ProductBox has used four arguments as specified below −

    * name - Product name

    * description - Product description

    * price - Price of the product

    * image - Image of the product

ProductBox uses seven build-in widgets as specified below −

* Container
* Expanded
* Row
* Column
* Card
* Text
* Image

#### StatefullWidget Class
Unlike StatelessWidget class StatefulWidget is quite the opposite. Here the layout can be built in same way as StatelessWidget class, but the difference is that in StatefulWidget class the data and values can be updated throughout the time. Which is pretty interactive.

    * StatefulWidget Class are Dynamic
    * State might change during lifetime of the Widget and if the Widget Changes when user interact - it's Stateful
    * A Widget State is Store in a State object

initState() - call's this method exactly once for each state object it creates.

setState() - called when developer want's to change the internal state of widget.


### Introduction to Gestures
Gestures are primarily a way for a user to interact with a mobile (or any touch based device) application. Gestures are generally defined as any physical action / movement of a user in the intention of activating a specific control of the mobile device. Gestures are as simple as tapping the screen of the mobile device to more complex actions used in gaming applications.

Some of the widely used gestures are mentioned here −

* Tap − Touching the surface of the device with fingertip for a short period and then releasing the fingertip.

* Double Tap − Tapping twice in a short time.

* Drag − Touching the surface of the device with fingertip and then moving the fingertip in a steady manner and then finally releasing the fingertip.

* Flick − Similar to dragging, but doing it in a speeder way.

* Pinch − Pinching the surface of the device using two fingers.

* Spread/Zoom − Opposite of pinching.

* Panning − Touching the surface of the device with fingertip and moving it in any direction without releasing the fingertip.

Some of the gestures and the corresponding events are given below −

* Tap
    * onTapDown
    * onTapUp
    * onTap
    * onTapCancel
* Double tap
    * onDoubleTap
* Long press
    * onLongPress
* Vertical drag
    * onVerticalDragStart
    * onVerticalDragUpdate
    * onVerticalDragEnd
* Horizontal drag
    * onHorizontalDragStart
    * onHorizontalDragUpdate
    * onHorizontalDragEnd
* Pan
    * onPanStart
    * onPanUpdate
    * onPanEnd

poping up a dialog box on click:

```java
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(GestureApp());

class GestureApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      home: GestDetector(title: "Gesture Detector",),
    );
  }
}

class GestDetector extends StatelessWidget {

  final String title;
  const GestDetector({Key? key, required this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title),),
      body: Center(
        child: GestureDetector(
          onTap: (){
            showContent(context);
          },
          child: const Text("Hello Duniya!!"),
        ),
      ),
    );
  }

  void showContent(BuildContext context){
    showDialog(
      context: context, barrierDismissible: false,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Message"),
          content: Text("Hello World!!!"),
          actions: [
        // ignore: deprecated_member_use
        FlatButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text("CLOSE"))
      ],
        );
      }
    );
  }

}

```

In the following code we have used gesture and route to next page event to view each of the items.

```java
import 'package:flutter/material.dart';
import 'ProductPage.dart';
import 'Products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Advanced Layout",
      theme: ThemeData(
        primarySwatch: Colors.orange,
        canvasColor: Colors.black26,
      ),
      home: HomePage(title: "Product Layout Demo"),
    );
  }
}

class HomePage extends StatelessWidget {

  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  final items = Products.getProducts();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(this.title),),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index){
          return GestureDetector(
            child: ProductBox(items: items[index],),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>ProductPage(items: items[index]),
              ),);
            },
          );
        },
      )
    );
  }

}


// Product box Model
//_______________________________________
//|  _______                            |
//| |       |     |_______name______|   |
//| | image |     |____description__|   |
//| |_______|     |_______price_____|   |
//|                                     |
//______________________________________|

class ProductBox extends StatelessWidget {
  final Products items;

  const ProductBox({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(10),
      height: 140,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(this.items.image),
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(this.items.name),
                      Text(this.items.description),
                      Text("Price: "+this.items.price.toString()),
                      RatingBox(),
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

}

class RatingBox extends StatefulWidget {
  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int rating=0;

  void _setRatingAsOne(){
    setState(() {
      rating=1;
    });
  }

  void _setRatingAsTwo(){
    setState(() {
      rating=2;
    });
  }

  void _setRatingAsThree(){
    setState(() {
      rating=3;
    });
  }
  @override
  Widget build(BuildContext context) {
    double size=20;
    print("rating: "+rating.toString());
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (
            rating >= 1?
                Icon( Icons.star, size: size,):Icon( Icons.star_border, size: size,)
            ),
            color: Colors.red,
            onPressed: _setRatingAsOne,
            iconSize: size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (
            rating >= 2?
                Icon( Icons.star, size: size,):Icon( Icons.star_border, size: size,)
            ),
            color: Colors.red,
            onPressed: _setRatingAsTwo,
            iconSize: size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (
            rating >= 3?
                Icon( Icons.star, size: size,):Icon( Icons.star_border, size: size,)
            ),
            color: Colors.red,
            onPressed: _setRatingAsThree,
            iconSize: size,
          ),
        )
      ],
    );
  }
}

//=================================
// ProductPage.dart
//=================================
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_advanced_layout/Products.dart';
import 'package:flutter_advanced_layout/main.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key, required this.items}) : super(key: key);

  final Products items;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details"),),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(items.image),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(items.name),
                  Text(items.description),
                  Text("Price: "+items.price.toString()),
                  RatingBox(),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}


```
To add animation to the UI of an application user is required to use **StatefulWidget** class instead of stateless widgets.

Custom animation class to animate objects on UI. 
```java
// Custom Animation class
class MyAnimatedWidget extends StatelessWidget {
  const MyAnimatedWidget({required this.child, required this.animation});
  final Widget child;
  final Animation<double> animation;

  Widget build(BuildContext context) => Center(
    child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) => Container(
          child: Opacity(opacity: animation.value, child: child),
        ),
        child: child
    ),
  );
}
```

01716172240


    Color color = Theme
        .of(context)
        .primaryColor;

        void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Color color = Theme
        .of(context)
        .primaryColor;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Column(
          children: [
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ), //const MyHomePage(title: 'Flutter Demo Home Page'),
    );



  }

  }

Widget buttonSection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    _buildButtonColumn(Colors.blue, Icons.call, 'CALL'),
    _buildButtonColumn(Colors.green, Icons.near_me, 'ROUTE'),
    _buildButtonColumn(Colors.amber, Icons.share, 'SHARE'),
  ],
);

Widget titleSection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only( bottom: 8),
                child: const Text("This is child 1.2",
                style: TextStyle(fontWeight: FontWeight.bold),),
                
              ),
              Text('Kandersteg, Switzerland',
                style: TextStyle(
                  color: Colors.grey[500],
                ),
              )
            ],
          )
      )
    ],
  ),
);

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: color,
          ),
        ),
      ),
    ],
  );
}

Widget textSection = const Padding(
  padding: EdgeInsets.all(20),
  child: Text('Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '+
'Alps. Situated 1,578 meters above sea level, it is one of the '+
'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '+
'half-hour walk through pastures and pine forest, leads you to the '+
'lake, which warms to 20 degrees Celsius in the summer. Activities '+
'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,),
);