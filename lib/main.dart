import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _counter = 0;
  var urlBoolean = true;
  var url = 'https://commkit.gsu.edu/files/2019/06/PrimaryLogo2color.jpg';

  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward(); 
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeImage() {
    setState(() {
      if (urlBoolean == true) {
        urlBoolean = false;
        url = 'https://commkit.gsu.edu/files/2023/03/gsu-with-pantherhead.png';
      } else {
        urlBoolean = true;
        url = 'https://commkit.gsu.edu/files/2019/06/PrimaryLogo2color.jpg';
      }
    });

    _controller.reset();  
    _controller.forward(); 
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
            ),
            FadeTransition(
              opacity: _fadeAnimation,
              child: Image.network(
                url,
                width: 200,
                height: 200,
              ),
            ),
            ElevatedButton(
              onPressed: _changeImage,
              child: const Text("Change Image"),
            ),
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

