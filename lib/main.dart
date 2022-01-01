//import 'dart:ui';
// ignore_for_file: camel_case_types

import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:url_launcher/link.dart';
//import 'package:flutter_linkify/flutter_linkify.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: splash()
    //appBar:AppBar(title:const Text("Team DSC"),),
   // body:const MyGrid()),
    );
  }
}

class splash extends StatefulWidget {
  //const splash({ Key? key }) : super(key: key);
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
  super.initState();
  Timer(Duration(seconds: 3),() => Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (context) => MyGrid())));
  }
  @override
  Widget build(BuildContext context) {
    return Container(color:Colors.white,
    child: Image.network('https://dsckiet.com/static/images/logo.png'));
  }
}

final urls=
['https://dsckiet.com/static/images/Aayush_Sharma.jpg',
'https://dsckiet.com/static/images/aditya_pandey.jpg',
'https://dsckiet.com/static/images/Aniket_Padmansh.jpg',
'https://dsckiet.com/static/images/ishita_jaiswal.jpg',
'https://dsckiet.com/static/images/Lakshay_Kumar.jpg',
'https://dsckiet.com/static/images/mayank_shakya.jpg',
'https://dsckiet.com/static/images/satyam_sharma.jpg',
'https://dsckiet.com/static/images/priyanshu_sharma.jpg'
];

class MyGrid extends StatelessWidget {
  const MyGrid({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar:AppBar(title:const Text("Team DSC"),),
    body:Padding(
      padding: const EdgeInsets.fromLTRB(12,15,12,15),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 10 / 16,),
        itemCount: 8, itemBuilder: (context, index) {
          return GestureDetector(
            // onTap: myFunction,
            onTap: () {
              //move to another screen
              Navigator.push(context,
                MaterialPageRoute(
                  builder: (context) => details(i: index,url: urls[index],),
                ),
              );
            },
            child:Stack(
            children: [Card(
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Container(
                  width: 270,height: 250,
                  child: Image.network(urls[index],
                  fit: BoxFit.cover,),
                  ),
                ),
              ),Positioned(bottom:14,left:16,
              child:Center(child: Text(myDataList[index].name,
              style: const TextStyle(color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500)
              ,))
          )]));
        },
      ),
    ));
  }
}

class details extends StatelessWidget {
   const details({ Key? key,this.url,this.i }) : super(key: key);

final String? url;
final int? i;

  @override
  Widget build(BuildContext context) {
    int x=i!;
    return Scaffold(
      body:Stack(children: [
        Image.asset('assets/background.jpeg',
        height:double.infinity,
        width:double.infinity,
        fit: BoxFit.cover),
        Center(child: 
      Column(children: [Padding(
        padding: const EdgeInsets.fromLTRB(0,62.0,0,0),
        child: ClipOval(
          child:Image.network(url!,height: 300,width: 300,
          fit: BoxFit.cover,),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children:[
        ListTile(title: const Text("Name"),
        subtitle: Text(myDataList[x].name)),
        ListTile(title: const Text("Github"),
        subtitle: Text(myDataList[x].github),),
        ListTile(title: const Text("Linkedin"),
        subtitle: Text(myDataList[x].linkedin))]

  // child: ListView.builder(itemCount: 1, 
  //itemBuilder:(BuildContext ctx,int index){
  //         return Column(
  //           children: [
  //             Text(myDataList[x].name),
  //             Text(myDataList[x].github),
  //             Text(myDataList[x].linkedin),
  //           ],
  //         );}

  ))
      ]))]
    ));
  }
}

class Data {
  
	String name;
	String github;
	String linkedin;
  Data({required this.name,
  required this.github,
  required this.linkedin});
}

List<Data> myDataList=[
 Data(
   name:"Aayush Sharma",
   github: "https://github.com/Ayush783",
   linkedin: "https://www.linkedin.com/in/ayushb58/"),
   Data(
   name:"Aditya Pandey",
   github: "https://github.com/ydasc815",
   linkedin: "https://www.linkedin.com/in/ydasc815/"),
   Data(
   name:"Aniket Padmansh",
   github: "https://github.com/padmansh",
   linkedin: "https://www.linkedin.com/in/aniket-padmansh-7a7ba717a"),
   Data(
   name:"Ishita Jaiswal",
   github: "https://github.com/ishitajaiswal4m",
   linkedin: "http://www.linkedin.com/in/ishita-jaiswal-5838b116a"),
   Data(
   name:"Lakshay Kumar",
   github: "https://github.com/kumarlakshay",
   linkedin: "https://www.linkedin.com/in/lakshay-kumar-9a7a6b1a0"),
   Data(
   name:"Mayank Shakya",
   github: "https://github.com/mayanksh99",
   linkedin: "https://www.linkedin.com/in/mayanksh99/"),
   Data(
   name:"Satyam Sharma",
   github: "https://github.com/satyamx64",
   linkedin: "https://www.linkedin.com/in/satyam-sharma-1b376518b/"),
   Data(
   name:"Priyanshu Sharma",
   github: "https://github.com/priyanshu20",
   linkedin: "https://www.linkedin.com/in/priyanshusharma20/"),
];


// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// Column(
//   children: myDataList.indexedMap((e,index) => ListTile(leading: Text(e['movieName']))))
// class Image extends StatelessWidget {
//               const Image({ Key? key }) : super(key: key);
            
//               @override
//               Widget build(BuildContext context) {
//                 return Container(child:Image.network
//                 );
//               }
//             }
// extension IndexedIterable<E> on Iterable<E>{
//   Iterable<T> indexedMap<T>(T Function(E e,int index)f){
//     var index=0;
//     return map((e) => f(e,index++));
//   }
// }