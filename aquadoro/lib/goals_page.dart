import 'package:aquadoro/goal_card.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class GoalsPage extends StatefulWidget {
  @override
  GoalsPageState createState() => GoalsPageState();
}

//Animated Text kit
class GoalsPageState extends State<GoalsPage> with TickerProviderStateMixin {
  final List<GoalCard> _metas = [];
  int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        centerTitle: true,
        title: _fadeText(),
        backgroundColor: Colors.cyan[600],
      ),*/

      body: Stack(
        children: [
          //Container(
          //color: Colors.cyan[600],
          //),
          fondoMetas(),
          SafeArea(
            child: Column(
              children: [
                _fadeText(),
                //Cards
                Flexible(
                    child: ListView.builder(
                  itemBuilder: (context, int index) {
                    return Dismissible(
                      key: new UniqueKey(),
                      child: _metas[index],
                      background: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.only(left: 10),
                        alignment: AlignmentDirectional.centerStart,
                        color: Colors.deepOrange[700],
                        child: Icon(
                          Icons.delete_outline,
                        ),
                      ),
                      //Eliminacion GoalCard
                      onDismissed: (direccion) {
                        setState(() {
                          print(_metas[index].actividad);
                          _metas.removeAt(index);
                          print("Eliminado");
                          print(_metas[index].actividad);
                        });
                      },
                    );
                  }, //=> _metas[index],
                  itemCount: _metas.length,
                )),
                //Expanded(child: Container()),
                FloatingActionButton(
                  onPressed: () {
                    _addcard();
                  },
                  child: Icon(
                    Icons.add_circle_outline,
                    color: Colors.cyan[50],
                    size: 50,
                  ),
                ),
                Container(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  } //build

  Widget fondoMetas() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
        Colors.cyan[600],
        Colors.cyan[500],
      ])),
    );
  }

  Widget _fadeText() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: SizedBox(
        width: 350.0,
        child: FadeAnimatedTextKit(
            repeatForever: true,
            text: [
              "¿Qué es lo realmente \nimportante?",
              "Vamos a \nhacerlo UwU",
              "¿Qué has estado dejando pendiente?",
            ],
            textStyle: GoogleFonts.craftyGirls(
              fontSize: 25.0,
              color: Colors.blueGrey[50],
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
            alignment: AlignmentDirectional.bottomCenter // or Alignment.topLeft
            ),
      ),
    );
  } //Fade Text

  void _addcard() {
    final animationCards = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    GoalCard meta = new GoalCard(
      animationController: animationCards,
    );
    setState(() {
      _metas.insert(_metas.length, meta);
    });
    meta.animationController.forward();
  } // Add card

  //Metodo sobre escrito para la memoria
  @override
  void dispose() {
    for (GoalCard meta in _metas) {
      meta.animationController.dispose();
    }
    super.dispose();
  }
}
