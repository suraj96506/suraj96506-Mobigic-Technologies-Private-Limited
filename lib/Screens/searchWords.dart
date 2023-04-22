import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mobigiccrossword/Screens/enterValue.dart';
import 'package:mobigiccrossword/Screens/SearchFunction.dart';

class wordsearch extends StatefulWidget {
  final List<List<String>> gridList;
  final int row;
  final int column;
  const wordsearch({
    super.key,
    required this.gridList,
    required this.row,
    required this.column,
  });

  @override
  State<wordsearch> createState() => _wordsearchState();
}

class _wordsearchState extends State<wordsearch> {
  String word = '';
  List<int> searchresult = [];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text("Search the word",
              style: TextStyle(fontFamily: 'Montserrat')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Neumorphic(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(10),
                      ),
                      depth: -3,
                      color: const Color(0xffF2F2F2),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 20.0),
                        decoration: const InputDecoration(
                          isDense: true,
                          hintText: "Search alphabet combinations",
                          hintStyle: TextStyle(fontFamily: "Poppins"),
                          labelStyle: TextStyle(fontFamily: "Poppins"),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) => setState(() {
                          word = value;
                        searchresult = searchFunction(
                          widget.gridList,
                          word,
                          widget.row,
                          widget.column,
                        );
                        }),
                      ),
                    ),
                  ),
                  Neumorphic(
                    style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(10),
                      ),
                      color: const Color(0xffF2F2F2),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.of(context).popUntil((route) => route.isFirst);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Entervalue()),
                        );
                      },
                      child: const Text("Reset Fields"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              GridView.count(
                crossAxisCount: widget.row,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
                shrinkWrap: true,
                children: List.generate(
                  widget.row * widget.column,
                  (index) => Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: searchresult.contains(index)
                          ? Colors.green
                          : Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        widget.gridList[index % widget.row]
                            [index ~/ widget.row],
                        style: TextStyle(
                          fontSize: 20.0,
                          color: searchresult.contains(index)
                              ? Colors.yellow
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
