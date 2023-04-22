
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mobigiccrossword/Screens/gridName.dart';

class Entervalue extends StatefulWidget {
  const Entervalue({super.key});

  @override
  State<Entervalue> createState() => _EntervalueState();
}

class _EntervalueState extends State<Entervalue> {
  int row=0;
  int column = 0;
  final _formKey = GlobalKey<FormState>();
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
          automaticallyImplyLeading: false,
          title: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
            child: AnimatedTextKit(totalRepeatCount: 10, animatedTexts: [
              TypewriterAnimatedText('Hello Welcome to the app..!'),
            ]),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            Form(
              key: _formKey,
              child: Neumorphic(
                style: NeumorphicStyle(
                    color: Colors.white,
                    boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(10),
                    ),
                    depth: -5),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "How Many Rows You want..!",
                      style: TextStyle(
                        color: Color(0xff383838),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Neumorphic(
                      style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(10),
                        ),
                        depth: -3,
                        color: const Color(0xffF2F2F2),
                      ),
                      child: TextFormField(
                        style: const TextStyle(fontFamily: "Poppins"),
                        keyboardType: TextInputType.number,
                        validator: (String? str) {
                          if (str == null ||
                              str.isEmpty ||
                              int.parse(str) > 6) {
                            return 'enter a value between 1-6';
                          }
                          return null;
                        },
                        onChanged: (value) {
                        row = int.parse(value);
                        },
                        decoration: const InputDecoration(
                          isDense: true,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          alignLabelWithHint: true,
                          hintText: "Number of Rows",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Color(0xff677278)),
                          fillColor: Color(0xffF2F2F2),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 13,
                            horizontal: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Neumorphic(
                      style: NeumorphicStyle(
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(10),
                        ),
                        depth: -3,
                        color: const Color(0xffF2F2F2),
                      ),
                      child: TextFormField(
                        style: const TextStyle(fontFamily: "Poppins"),
                        keyboardType: TextInputType.number,
                        validator: (String? str) {
                          if (str == null ||
                              str.isEmpty ||
                              int.parse(str) > 6) {
                            return 'enter a value between 1-6';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          column = int.parse(value);
                        },
                        decoration: const InputDecoration(
                          isDense: true,
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          alignLabelWithHint: true,
                          hintText: "Number of Rows",
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Color(0xff677278)),
                          fillColor: Color(0xffF2F2F2),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 13,
                            horizontal: 18,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Center(
          child: Neumorphic(
            style: NeumorphicStyle(
              boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(10),
              ),
              depth: -10,
              color: const Color(0xffF2F2F2),
            ),
            child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.5,
                onPressed: () {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => GridName(
                                  rowCount: row,
                                  columnCount: column,
                                ))));
                  }
                },
                child: const Text("Add")),
          ),
        ),
      ),
    );
  }
}
