import 'package:flutter/material.dart';
import 'clothe.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Temperature> tList = [
    Temperature("27 ~  ", 27, Icon(Icons.wb_sunny, color: Colors.red)),
    Temperature("23 ~ 26", 23, Icon(Icons.wb_sunny, color: Colors.deepOrange)),
    Temperature("20~ 22", 20, Icon(Icons.wb_sunny, color: Colors.orange)),
    Temperature("17 ~ 19", 17, Icon(Icons.wb_sunny, color: Colors.yellow)),
    Temperature("12 ~ 16", 12, Icon(Icons.wb_sunny, color: Colors.lightGreenAccent)),
    Temperature("10 ~ 11", 10, Icon(Icons.wb_sunny, color: Colors.green)),
    Temperature("6 ~ 9", 6, Icon(Icons.wb_sunny, color: Colors.blue)),
    Temperature("  ~  5", 0, Icon(Icons.wb_sunny, color: Colors.lightBlueAccent)),
  ];
  List<Clothe> cList = [
    Clothe('Onepiece', 27),
    Clothe('ShortPants', 23),
    Clothe('Slacks', 20),
    Clothe('SweatShirts', 17),
    Clothe('Jacket', 12),
    Clothe('Coat', 6),
    Clothe('Leather', 6),
    Clothe('Jean', 17 ),
    Clothe('Padding', 0),
  ];
  Icon cusIcon = Icon(Icons.search);
  Widget curSearchBar = Text("List");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        appBar: AppBar(
          title: Text("List"),
          actions: <Widget>[
            IconButton(
              icon: cusIcon,
              onPressed: (){
                setState(() {
                  if(this.cusIcon.icon == Icons.search){
                    this.cusIcon = Icon(Icons.cancel);
                    this.curSearchBar = TextField(
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search Cloth"
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    );
                  }else{
                    this.cusIcon = Icon(Icons.search);
                    this.curSearchBar = Text("List");
                  }
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: (){},
            )
          ],
        ),
        body: new ListView.builder(
            itemCount: cList.length,
            itemBuilder: (BuildContext context, int index) {
              Temperature tmp = tList[0];
              for(int i = 0; i < tList.length; i ++){
                if(cList[index].tp == tList[i].min){
                  tmp = tList[i];
                }
              }

              return ListTile(
                leading: tmp.icon,
                title: Text(cList[index].name),
                subtitle: Text(tmp.temp),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ClothePage(cList[index])
                  ));
                },
              );






            }));
  }
}
abstract class ListItem{}

class Clothe implements ListItem{
  String name;
  int tp;

  Clothe(this.name, this.tp);
}

class Temperature implements ListItem{
  final String temp;
  final int min;
  final Icon icon;

  Temperature(this.temp, this.min, this.icon);
}


