import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var urlBoolean = true;
  var url = 'https://commkit.gsu.edu/files/2019/06/PrimaryLogo2color.jpg';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeImage(){
    setState(() {
      if (urlBoolean == true){
        urlBoolean = false;
        url = 'https://commkit.gsu.edu/files/2023/03/gsu-with-pantherhead.png';
      }
      else{
        urlBoolean = true; 
        url = 'https://commkit.gsu.edu/files/2019/06/PrimaryLogo2color.jpg';
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Image.network('$url'),
            ElevatedButton(onPressed: _changeImage, child: Text("Change Image")),

          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}
