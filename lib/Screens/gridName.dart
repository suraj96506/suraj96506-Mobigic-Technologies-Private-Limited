
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:mobigiccrossword/Screens/searchWords.dart';

class GridName extends StatefulWidget {
  final int rowCount;
  final int columnCount;
  const GridName({
    super.key,
    required this.columnCount,
    required this.rowCount,
  });

  @override
  State<GridName> createState() => _GridNameState();
}

class _GridNameState extends State<GridName> {
  final _formKey = GlobalKey<FormState>();
  final _gridList = <List<String>>[];

  @override
  void initState() {
    super.initState();
    final newRowCount = widget.rowCount;
    final newColumnCount = widget.columnCount;
    _gridList.addAll(List.generate(
      newRowCount,
      (_) => List.filled(newColumnCount, "", growable: false),
    ));
    
  }

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
          title: const Text("Set Naming"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildGrid(),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Flex(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            direction: Axis.horizontal,
            children: [_savebuildName()]),
      ),
    );
  }

  Widget _buildGrid() {
    final newRowCount = widget.rowCount;
    final newColumnCount = widget.columnCount;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.count(
        physics: ScrollPhysics(),
        crossAxisCount: newRowCount,
        shrinkWrap: true,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        children: List.generate(
          newRowCount * newColumnCount,
          
          (index) {
            final row = (index / newRowCount).floor();
            final col = index - row * newRowCount;
            return Center(
              child: Neumorphic(
                style: const NeumorphicStyle(
                    color: Colors.white,
                    shadowDarkColor: Color.fromARGB(255, 44, 44, 44)),
                child: TextFormField(
                  maxLength: 1,
                  validator: (value) => value?.isEmpty ?? true ? "" : null,
                  decoration: const InputDecoration(border: InputBorder.none),
                  textAlign: TextAlign.center,
                  initialValue: _gridList[col][row],
                  onChanged: (value) => _gridList[col][row] = value,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _savebuildName() {
    return Neumorphic(
      style: const NeumorphicStyle(color: Colors.white, depth: -10),
      child: MaterialButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => wordsearch(
                  gridList: _gridList,
                  row: widget.rowCount,
                  column: widget.columnCount,
                ),
              ),
            );
          }
        },
        child:const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Text(
            "save Grid",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
