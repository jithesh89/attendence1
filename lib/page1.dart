import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';


import 'attmodel.dart';
import 'main.dart';
class Page1 extends StatelessWidget {
  late AttendenceModel? kk;
  List<String>list1 =[];
  final Textfieldcontroller=TextEditingController();
  List<String> rollnumber=[];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              ElevatedButton(onPressed: ()async{
                final _attendence= await Hive.openBox<AttendenceModel>('name');
                var map=Map();
                list1.clear();
                for(int i=0;i<_attendence.length;i++)
                {
                  kk= _attendence.getAt(i);
                  list1.addAll(kk!.rollnumberlist);
                }
                print(list1);
              },
                child: Text('getdata'),),
              SizedBox(height: 10),
              Expanded(child: ValueListenableBuilder(
                valueListenable: DBbox.listenable(),
                builder: (BuildContext context,Box<AttendenceModel> newvalue, Widget? child) {

                  return  ListView.separated(
                      itemBuilder: (context,index){
                        List keys= newvalue.keys.cast().toList();

                        final data= newvalue.get(keys[index]);

                        return ListTile(title: Text(data!.id),
                          subtitle: Text(data.rollnumberlist.toString()),);
                      },
                      separatorBuilder: (context,index){
                        return Divider(thickness: 2);
                      },
                      itemCount: newvalue.length);
                },

              ))
            ],
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(title: Text('add data'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: Textfieldcontroller,
                        decoration: InputDecoration(hintText: 'enter absent roll number'),
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(onPressed: () {

                        final data = Textfieldcontroller.text;
                        var string= data.toString();
                        print(data);
                        final key = string.split(" , ");
                        // List<String>list =  string.split(" ") ;
                        print(key);
                        final data1= AttendenceModel(id: DateTime.now().toString(), rollnumberlist: key);
                        inserttoDB(data1);
                        print(data1.toString());

                        Navigator.of(context).pop();
                      },child: Text('submit'),)
                    ],
                  ),);
              });
            },child: Icon(Icons.add),) ,
        ));
  }
  Future<void>inserttoDB(AttendenceModel data1)async{
    //final _attendence= await Hive.openBox<AttendenceModel>('name');
    DBbox.put(data1.id, data1);

  }

}
