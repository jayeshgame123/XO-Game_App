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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tic Tac Toe'),
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
  bool xTurn = true;
  List<String> displayXO = ['','','','','','','','',''];
  String result = '';
  List<int> resCol = [];

  void tapped(index){
    setState(() {
      if(xTurn && displayXO[index] == ''){
          displayXO[index] = 'X';
        }else if(!xTurn && displayXO[index] == ''){
          displayXO[index] = 'O';
        }
        xTurn = !xTurn;
        checkWinner();
        
    });
  }

  void checkWinner(){
    if(displayXO[0] == displayXO[1] && displayXO[0] == displayXO[2] && displayXO[0] != ''){
      setState(() {
        result = 'Player ' + displayXO[0] + ' wins';
        resCol.addAll([0,1,2]);
      });
    }

    if(displayXO[3] == displayXO[4] && displayXO[3] == displayXO[5] && displayXO[3] != ''){
      setState(() {
        result = 'Player ' + displayXO[3] + ' wins';
        resCol.addAll([3,4,5]);
      });
    }

    if(displayXO[6] == displayXO[7] && displayXO[6] == displayXO[8] && displayXO[6] != ''){
      setState(() {
        result = 'Player ' + displayXO[6] + ' wins';
        resCol.addAll([6,7,8]);
      });
    }

    if(displayXO[0] == displayXO[3] && displayXO[0] == displayXO[6] && displayXO[0] != ''){
      setState(() {
        result = 'Player ' + displayXO[0] + ' wins';
        resCol.addAll([0,3,6]);
      });
    }

    if(displayXO[1] == displayXO[4] && displayXO[1] == displayXO[7] && displayXO[1] != ''){
      setState(() {
        result = 'Player ' + displayXO[1] + ' wins';
        resCol.addAll([1,4,7]);
      });
    }

    if(displayXO[2] == displayXO[5] && displayXO[2] == displayXO[8] && displayXO[2] != ''){
      setState(() {
        result = 'Player ' + displayXO[2] + ' wins';
        resCol.addAll([2,5,8]);
      });
    }

    if(displayXO[0] == displayXO[4] && displayXO[0] == displayXO[8] && displayXO[0] != ''){
      setState(() {
        result = 'Player ' + displayXO[0] + ' wins';
        resCol.addAll([0,4,8]);
      });
    }

    if(displayXO[2] == displayXO[4] && displayXO[2] == displayXO[6] && displayXO[2] != ''){
      setState(() {
        result = 'Player ' + displayXO[2] + ' wins';
        resCol.addAll([2,4,6]);
      });
    }
  }

  void clearBoard(){
    setState(() {
      for(int i=0;i<9;i++){
        displayXO[i] = '';
        resCol = [];
        result = '';
      }
      
    });
  }
  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Text(result,style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
              ),
            Expanded(
              flex: 4,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), 
                itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){tapped(index);},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        width: 5,
                        color: Colors.white
                     ),
                      color: resCol.contains(index) ? Colors.amber : Colors.cyan,
                    ),
                    child: Center(
                      child: Text(displayXO[index],style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white),)),
                  ),
                );
              },
              
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  // Text("Timer"),
                  SizedBox(height: 10,),
                  ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 32,vertical: 16)
                ),
                onPressed: clearBoard,
                child: Text("play Again",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)
                ),
                
                
                ],
              ),
              ),
          ],
        ),
      ),
    );
  }

}
