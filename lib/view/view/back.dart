import 'package:flutter/material.dart';
class back_view extends StatelessWidget {
  const back_view({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Testing'),),
      body: Column(
        children: [
          Center(
            child: TextButton(onPressed: (){
              Navigator.of(context).pushNamed('/assign_screen/');
            }, child: const Text('Screen')),
          )
        ],
      ),);
  }
}


