import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expressions/expressions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    return MaterialApp(
      title: 'Calculator',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Calculator'),
            leading: Icon(
              Icons.calculate,
              size: 40.0,
              color: Color(0xFFFFF646),
            ),
          ),
          body: const Calculator()
      ),
    );
  }
}



class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _expression = '';
  String _link = '';
  num _value = 0;
  var evaluator = const ExpressionEvaluator();

  void resetLink() {
    if (_link.isNotEmpty)
      _link = '';
  }

  @override
  Widget build(BuildContext context) {
    final double _buttSpac = 1.5;
    const double _buttTextScale = 2;
    const Color _buttCol = Color(0xFF393939);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        //Divider(),
        Container(
          child: Text(_expression, textAlign: TextAlign.right, textScaleFactor: 1.8,),
          margin: EdgeInsets.all(10.0),
          color: Color(0xAABFBFBF),
          height: 120.0,
        ),
        //Divider(),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              /*Expanded(
                child: */Container(
                child: Text(_link, textAlign: TextAlign.center, textScaleFactor: 4.0, style: TextStyle(color: Color(
                    0xFF6D00FF)),),
                margin: EdgeInsets.all(5.0),
                color: Color(0xFF9A9A9A),
                height: 75.0,
                width: 55.0,
              ),
              //),
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () => setState(() {_expression += '$_value'; resetLink();}),
                    child: Text('$_value', textAlign: TextAlign.right, textScaleFactor: 1.8,),
                    style: ElevatedButton.styleFrom(primary: Color(0xFF5C5C5C)),
                  ),
                  margin: EdgeInsets.all(5.0),
                  color: Color(0xDD8D8D8D),
                  height: 75.0,
                ),
              ),
            ],
          ),
        ),
        //Divider(),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () => setState(() {_expression += '7'; resetLink();}),
                    child: const Text('7', textScaleFactor: _buttTextScale, style: TextStyle(color: Color(0xFF32A6FF)),),
                    style: ElevatedButton.styleFrom(primary: _buttCol),
                  ),
                  margin: EdgeInsets.all(_buttSpac),
                ),
              ),
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () => setState(() {_expression += '8'; resetLink();}),
                    child: const Text('8', textScaleFactor: _buttTextScale, style: TextStyle(color: Color(0xFF32A6FF)),),
                    style: ElevatedButton.styleFrom(primary: _buttCol),
                  ),
                  margin: EdgeInsets.all(_buttSpac),
                ),
              ),
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () => setState(() {_expression += '9'; resetLink();}),
                    child: const Text('9', textScaleFactor: _buttTextScale, style: TextStyle(color: Color(0xFF32A6FF)),),
                    style: ElevatedButton.styleFrom(primary: _buttCol),
                  ),
                  margin: EdgeInsets.all(_buttSpac),
                ),
              ),
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () => setState(() {_expression += '/'; resetLink();}),
                    child: const Text('/', textScaleFactor: _buttTextScale, style: TextStyle(color: Colors.orangeAccent),),
                    style: ElevatedButton.styleFrom(primary: _buttCol),
                  ),
                  margin: EdgeInsets.all(_buttSpac),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () => setState(() {_expression += '4'; resetLink();}),
                    child: const Text('4', textScaleFactor: _buttTextScale, style: TextStyle(color: Color(0xFF32A6FF)),),
                    style: ElevatedButton.styleFrom(primary: _buttCol),
                  ),
                  margin: EdgeInsets.all(_buttSpac),
                ),
              ),
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () => setState(() {_expression += '5'; resetLink();}),
                    child: const Text('5', textScaleFactor: _buttTextScale, style: TextStyle(color: Color(0xFF32A6FF)),),
                    style: ElevatedButton.styleFrom(primary: _buttCol),
                  ),
                  margin: EdgeInsets.all(_buttSpac),
                ),
              ),
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () => setState(() {_expression += '6'; resetLink();}),
                    child: const Text('6', textScaleFactor: _buttTextScale, style: TextStyle(color: Color(0xFF32A6FF)),),
                    style: ElevatedButton.styleFrom(primary: _buttCol),
                  ),
                  margin: EdgeInsets.all(_buttSpac),
                ),
              ),
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () => setState(() {_expression += '*'; resetLink();}),
                    child: const Text('*', textScaleFactor: _buttTextScale, style: TextStyle(color: Colors.orangeAccent),),
                    style: ElevatedButton.styleFrom(primary: _buttCol),
                  ),
                  margin: EdgeInsets.all(_buttSpac),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () => setState(() {_expression += '1'; resetLink();}),
                    child: const Text('1', textScaleFactor: _buttTextScale, style: TextStyle(color: Color(0xFF32A6FF)),),
                    style: ElevatedButton.styleFrom(primary: _buttCol),
                  ),
                  margin: EdgeInsets.all(_buttSpac),
                ),
              ),
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () => setState(() {_expression += '2'; resetLink();}),
                    child: const Text('2', textScaleFactor: _buttTextScale, style: TextStyle(color: Color(0xFF32A6FF)),),
                    style: ElevatedButton.styleFrom(primary: _buttCol),
                  ),
                  margin: EdgeInsets.all(_buttSpac),
                ),
              ),
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () => setState(() {_expression += '3'; resetLink();}),
                    child: const Text('3', textScaleFactor: _buttTextScale, style: TextStyle(color: Color(0xFF32A6FF)),),
                    style: ElevatedButton.styleFrom(primary: _buttCol),
                  ),
                  margin: EdgeInsets.all(_buttSpac),
                ),
              ),
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () => setState(() {_expression += '-'; resetLink();}),
                    child: const Text('-', textScaleFactor: _buttTextScale, style: TextStyle(color: Colors.orangeAccent),),
                    style: ElevatedButton.styleFrom(primary: _buttCol),
                  ),
                  margin: EdgeInsets.all(_buttSpac),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () => setState(() {_expression += '0'; resetLink();}),
                    child: const Text('0', textScaleFactor: _buttTextScale, style: TextStyle(color: Color(0xFF32A6FF)),),
                    style: ElevatedButton.styleFrom(primary: _buttCol),
                  ),
                  margin: EdgeInsets.all(_buttSpac),
                ),
              ),
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () => setState(() {_expression += '.'; resetLink();}),
                    child: const Text('.', textScaleFactor: _buttTextScale, style: TextStyle(color: Color(0xFF32A6FF)),),
                    style: ElevatedButton.styleFrom(primary: _buttCol),
                  ),
                  margin: EdgeInsets.all(_buttSpac),
                ),
              ),
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () => setState(() {_expression = ''; resetLink();}),
                    child: Icon(
                      Icons.clear_all_rounded,
                      color: Color(0xDDFF003B),
                      size: 30.0,
                    ),
                    style: ElevatedButton.styleFrom(primary: _buttCol),
                  ),
                  margin: EdgeInsets.all(_buttSpac),
                ),
              ),
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () => setState(() {_expression += '+'; resetLink();}),
                    child: const Text('+', textScaleFactor: _buttTextScale, style: TextStyle(color: Colors.orangeAccent),),
                    style: ElevatedButton.styleFrom(primary: _buttCol),
                  ),
                  margin: EdgeInsets.all(_buttSpac),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () => setState(() {_expression += '('; resetLink();}),
                    child: const Text('(', textScaleFactor: _buttTextScale, style: TextStyle(color: Color(0xFF32A6FF)),),
                    style: ElevatedButton.styleFrom(primary: _buttCol),
                  ),
                  margin: EdgeInsets.all(_buttSpac),
                ),
              ),
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () => setState(() {_expression += ')'; resetLink();}),
                    child: const Text(')', textScaleFactor: _buttTextScale, style: TextStyle(color: Color(0xFF32A6FF)),),
                    style: ElevatedButton.styleFrom(primary: _buttCol),
                  ),
                  margin: EdgeInsets.all(_buttSpac),
                ),
              ),
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () => setState(() {
                      if (_expression.length != 0)
                        _expression = _expression.substring(0, _expression.length-1);
                      resetLink();
                    }),
                    child: Icon(
                      Icons.backspace_rounded,
                      color: Color(0xDDFF003B),
                      size: 30.0,
                    ),
                    style: ElevatedButton.styleFrom(primary: _buttCol),
                  ),
                  margin: EdgeInsets.all(_buttSpac),
                ),
              ),
              Expanded(
                child: Container(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        bool canBeEval = true;
                        num temp = 0;
                        try {temp = evaluator.eval(Expression.parse(_expression), {});}
                        catch (e){canBeEval = false;}
                        if (canBeEval){
                          _value = temp;
                          _link = '=';
                        }
                        else
                          _link = '!';
                      });
                    },
                    child: const Text('=', textScaleFactor: _buttTextScale, style: TextStyle(color: Colors.orangeAccent),),
                    style: ElevatedButton.styleFrom(primary: _buttCol),
                  ),
                  margin: EdgeInsets.all(_buttSpac),
                ),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
