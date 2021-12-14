import 'package:todo/Provider/Done_provider.dart';

import '';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ActivityPage extends StatefulWidget {
  final String? name;
  const ActivityPage({Key? key, required this.name}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final myController = TextEditingController();
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.name}'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 32,
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                    title: Text('Create Activity'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Activity'),
                        TextField(
                          controller: myController,
                        )
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Provider.of<DoneProvider>(context, listen: false)
                                .addData(myController.text);
                            Navigator.pop(context, 'OK');
                          },
                          child: Text('OK'))
                    ],
                  ))),
      body: Consumer<DoneProvider>(
        builder: (context, model, _) {
          return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: model.doneModuleList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  onDismissed: (DismissDirection direction) => setState(() {
                    model.doneModuleList.removeAt(index);
                  }),
                  key: ValueKey(model.doneModuleList[index]),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF46A0AE),
                    ),
                    child: Row(
                      children: [
                        Text(
                          model.doneModuleList[index],
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(Icons.star_border),
                      ],
                    ),
                    margin: EdgeInsets.only(bottom: 16),
                  ),
                );
              });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile')
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
