import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Pages/homepage.dart';
import 'package:todo/Provider/Done_provider.dart';
import 'package:todo/Widget/tasks.dart';

class ListCard extends StatefulWidget {
  final String value;
  const ListCard({Key? key, required this.value}) : super(key: key);

  @override
  _ListCardState createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final doneModuleList =
        Provider.of<DoneProvider>(context, listen: false).doneModuleList;
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hi ${widget.value}",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                      Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: 40,
                      )
                    ],
                  ),
                  Container(
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.grey[350],
                                    shape: BoxShape.circle),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Go Premium!',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Get unlimited access\nto all our features',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.grey[850]),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      'Tasks',
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  Expanded(child: Tasks())
                ],
              ),
            ),
          )
        ],
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 32,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
