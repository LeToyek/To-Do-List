import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  final String? name;
  const ActivityPage({Key? key, required this.name}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final List<String> activityList = [];
  final myController = TextEditingController();
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void addItemToList() => setState(() {
        activityList.insert(activityList.length, myController.text);
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.name}'),
      ),
      floatingActionButton: FloatingActionButton(
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
                            addItemToList();
                            Navigator.pop(context, 'OK');
                          },
                          child: Text('OK'))
                    ],
                  ))),
      body: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: activityList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              onDismissed: (DismissDirection direction) => setState(() {
                activityList.removeAt(index);
              }),
              key: ValueKey(activityList[index]),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF46A0AE),
                ),
                child: Row(
                  children: [
                    Text(
                      activityList[index],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Icon(Icons.delete),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.edit),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(Icons.star_border)
                  ],
                ),
                margin: EdgeInsets.only(bottom: 16),
              ),
            );
          }),
    );
  }
}
