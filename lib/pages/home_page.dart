import 'dart:convert';

import 'package:bedha_chhua/pages/services/http_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String dateTime = DateFormat(DateFormat.YEAR_ABBR_MONTH_WEEKDAY_DAY).format(DateTime.now());
  String monthDate = DateFormat(DateFormat.ABBR_MONTH_WEEKDAY_DAY).format(DateTime.now());
  dynamic body;
  
  @override
  void initState() {
    getExpenses();
    super.initState();
  }

  void getExpenses() async{
    dynamic response;
    response = await HttpServices().getService("expense/get/all");
    body = jsonDecode(response.body)["body"];
    print("==================================>>"+body.toString());
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const HomePage(title: "Beddha Chhua")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 151, 61, 241)
                        ),
                      ),
                      const Text(
                        "Expenses",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black
                        ),
                        //textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    backgroundImage: NetworkImage("https://assets.materialup.com/uploads/b78ca002-cd6c-4f84-befb-c09dd9261025/preview.png"),
                  ),
                ]
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("https://assets.materialup.com/uploads/b78ca002-cd6c-4f84-befb-c09dd9261025/preview.png"),
                  ),
                  onTap: ()=>{},
                ),
                InkWell(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("https://assets.materialup.com/uploads/b78ca002-cd6c-4f84-befb-c09dd9261025/preview.png"),
                  ),
                  onTap: ()=>{},
                ),
                InkWell(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("https://assets.materialup.com/uploads/b78ca002-cd6c-4f84-befb-c09dd9261025/preview.png"),
                  ),
                  onTap: ()=>{},
                ),
                InkWell(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage("https://assets.materialup.com/uploads/b78ca002-cd6c-4f84-befb-c09dd9261025/preview.png"),
                  ),
                  onTap: ()=>{},
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 28, 30, 20),
              alignment: Alignment.centerRight,
              child: Text(
              dateTime,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20
              ),
            ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 1/6,
              width: MediaQuery.of(context).size.width * 9/10,
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color.fromARGB(62, 222, 221, 221),
                borderRadius: BorderRadius.all(
                  Radius.circular(16)
                )
              ),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.list),
                    trailing: const Text(
                    "GFG",
                    style: TextStyle(color: Colors.green, fontSize: 15),
                    ),
                    title: Text("List item $index"));
                }
              ),
            ),
            
            
          ],
        )
      )
    );
  }
}
