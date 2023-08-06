import 'dart:math';

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
      home: JankenPage(),
    );
  }
}

class JankenPage extends StatefulWidget {
  const JankenPage({super.key});

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {
  //自分が選んだ手
  String myHand = '✊';
  //コンピューターが選んだ手
  String computerHand = '✊';
  //勝利を保持する変数
  String result = '引き分け';
  void selectHand(String selectedHand) {
    myHand = selectedHand;
    print(myHand);
    generateComputerHand();
    judge();
    setState(() {});
  }

  void generateComputerHand() {
    final randomNumber = Random().nextInt(3);
    computerHand = randomNumberToHand(randomNumber);
  }

  void judge() {
    // 引き分けの場合
    if (myHand == computerHand) {
      result = '引き分け';
      // 勝ちの場合
    } else if (myHand == '✊' && computerHand == '✌️' ||
        myHand == '✌️' && computerHand == '🖐' ||
        myHand == '🖐' && computerHand == '✊') {
      result = '勝ち';
      // 負けの場合
    } else {
      result = '負け';
    }
  }

  String randomNumberToHand(int randomNumber) {
    // () のなかには条件となる値を書きます。
    switch (randomNumber) {
      case 0: // 入ってきた値がもし 0 だったら。
        return '✊'; // ✊を返す。
      case 1: // 入ってきた値がもし 1 だったら。
        return '✌️'; // ✌️を返す。
      case 2: // 入ってきた値がもし 2 だったら。
        return '🖐'; // 🖐を返す。
      default: // 上で書いてきた以外の値が入ってきたら。
        return '✊'; // ✊を返す。（0, 1, 2 以外が入ることはないが念のため）
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('じゃんけん'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// 勝敗を表示されるための Text
          Text(
            result,
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          SizedBox(height: 48),
          // コンピューターの手を表示
          Text(
            computerHand,
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          // 余白を追加
          SizedBox(height: 48),
          Text(
            myHand,
            style: TextStyle(
              fontSize: 32,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  selectHand('✊');
                },
                child: Text('✊'),
              ),
              ElevatedButton(
                onPressed: () {
                  selectHand('✌️');
                },
                child: Text('✌️'),
              ),
              ElevatedButton(
                onPressed: () {
                  selectHand('✋');
                },
                child: Text('✋'),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
