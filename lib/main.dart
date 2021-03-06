import 'package:flutter/material.dart';
import 'package:my_app/data/locationsAll.dart';
import 'package:url_launcher/url_launcher.dart';

//there is alot of code that is not used for now but would be used later on to
//enhance the ux
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color c1 = const Color(0xFF171717);
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark, primaryColorDark: Colors.black),
        home: Scaffold(backgroundColor: c1, body: cardsview()));
  }
}

// ignore: unused_element
Route _firsttrans() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => cardsview(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.linear;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

// ignore: unused_element
Route _secondtrans(double x1, double y1) {
  return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          dataview(""),
      transitionDuration: Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, animationTime, child) {
        animation =
            CurvedAnimation(parent: animation, curve: Curves.linearToEaseOut);
        return ScaleTransition(
            alignment: Alignment(x1, y1 / 400), scale: animation, child: child);
      });
}

// ignore: camel_case_types
class front extends StatefulWidget {
  @override
  _frontWidgetState createState() => _frontWidgetState();
}

// ignore: camel_case_types
class _frontWidgetState extends State<front> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView(shrinkWrap: true, children: [
      Container(
        child: Center(child: Image.asset('images/Artboard 45.png')),
      ),
      Container(
        child: formcard(),
        margin: EdgeInsets.only(left: 20, right: 20),
      ),
      Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, _firsttrans());
              },
              child: const Text('Submit'),
            ),
          ),
          margin: EdgeInsets.only(left: 120, right: 120)),
    ])));
  }
}

// ignore: camel_case_types
class cardsview extends StatefulWidget {
  const cardsview({Key? key}) : super(key: key);
  @override
  _cardsviewWidgetState createState() => _cardsviewWidgetState();
}

// ignore: camel_case_types
class _cardsviewWidgetState extends State<cardsview> {
  final lol = locationsAll();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Image.asset('images/Artboard 415ldpi.png'),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Stack(children: [
              ListView.builder(
                  itemCount: locationsAll().listobj.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Card(
                          elevation: 5,
                          // Image.network("${lol.listobj[index].imageUrl}"),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: SizedBox(
                                height: 250,
                                width: 330,
                                child: Stack(
                                  children: <Widget>[
                                    new Positioned.fill(
                                        child: Image.network(
                                      "${lol.listobj[index].imageUrl}",
                                      fit: BoxFit.fill,
                                    )),
                                    Container(
                                        padding: EdgeInsets.all(5.0),
                                        alignment: Alignment.bottomCenter,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: <Color>[
                                              Colors.black.withAlpha(0),
                                              Colors.black12,
                                              Colors.black87
                                            ],
                                          ),
                                        ),
                                        child: Text(
                                          "| ${lol.listobj[index].name} \n| ${lol.listobj[index].theme}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontSize: 20.0),
                                        )),
                                  ],
                                ),
                              ))),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Details(
                                  n: "${lol.listobj[index].name}",
                                  url: "${lol.listobj[index].imageUrl}",
                                  d: "${lol.listobj[index].description}",
                                  locurl: "${lol.listobj[index].locationUrl}")),
                        );
                      },
                    );
                  }),
            ])),
        floatingActionButton: FloatingActionButton(
          onPressed: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => front()))
          },
          backgroundColor: const Color(0xFF477194),
          child: const Icon(
            Icons.add,
            size: 35.0,
          ),
        ));
  }
}

class Details extends StatelessWidget {
  final String n;
  final String url;
  final String d;
  final String locurl;

  Details(
      {required this.n,
      required this.url,
      required this.d,
      required this.locurl});
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
          Container(
              child: ListView(
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.network(url))),
              SizedBox(height: 20),
              Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    n,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  )),
              SizedBox(height: 15),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    d,
                    style: const TextStyle(
                        fontFamily: 'Raleway',
                        fontSize: 18,
                        color: Colors.white70),
                  )),
            ],
          )),
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {launch(locurl)},
        backgroundColor: const Color(0xFF477194),
        child: const Icon(
          Icons.location_on,
          size: 35.0,
        ),
      ),
    );
  }
}

/*Future<void> _launchURL(String _url1) async => await canLaunch(_url1)
    ? await launch(_url1)
    : throw 'Could not launch $_url1'; */

// ignore: camel_case_types
class formcard extends StatefulWidget {
  const formcard({Key? key}) : super(key: key);

  @override
  _formcardWidgetState createState() => _formcardWidgetState();
}

// ignore: camel_case_types
class _formcardWidgetState extends State<formcard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Color c = const Color(0xFF202020);
    return Card(
      color: c,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black12, width: 0.5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 5),
            formfield("Location Name"),
            SizedBox(height: 2),
            formfield("Theme"),
            SizedBox(height: 2),
            formfield("Description"),
            SizedBox(height: 2),
            formfield("Image URL"),
            SizedBox(height: 2),
            formfield("Location URL"),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class formfield extends StatefulWidget {
  final String name;
  const formfield(this.name);

  @override
  _formfieldWidgetState createState() => _formfieldWidgetState();
}

// ignore: camel_case_types
class _formfieldWidgetState extends State<formfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: TextFormField(
          decoration: new InputDecoration(
            labelText: "${widget.name}",
            fillColor: Colors.black,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: const Color(0xff3f82ef),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.black12,
                width: 0.4,
              ),
            ),
          ),
        ));
  }
}

extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    var translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      return renderObject?.paintBounds
          .shift(Offset(translation.x, translation.y));
    } else {
      return null;
    }
  }

  Offset position(GlobalKey k) {
    RenderObject? obox = k.currentContext?.findRenderObject();
    RenderBox box = obox as RenderBox;
    Offset position = box.localToGlobal(Offset.zero); //this is global position
    return position;
  }
}

// ignore: camel_case_types
class dataview extends StatefulWidget {
  final String
      data; // to be later changed to (image,title,full text) from the card

  const dataview(this.data);
  _dataviewWidgetState createState() => _dataviewWidgetState();
}

// ignore: camel_case_types
class _dataviewWidgetState extends State<dataview>
    with TickerProviderStateMixin {
  late bool selected = false;
  Widget build(BuildContext context) {
    // body would contain the card with the exact size and position

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        selected = true;
      });
    });
    return Scaffold(
        backgroundColor: const Color(0xFF202020),
        body: Container(
          width: 200,
          height: 350,
          child: Stack(
            children: [
              AnimatedPositioned(
                width: 200.0,
                height: selected ? 250.0 : 350.0,
                top: selected ? 50.0 : 150.0,
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: Container(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ));
  }
}
