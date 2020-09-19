import 'package:aquadoro/aquadoro.dart';
import 'package:flutter/material.dart';

class GoalCard extends StatefulWidget {
  //Metodo constructor, tiene el control de animacion
  GoalCard({
    this.animationController,
  });
  @override
  _GoalCardState createState() => _GoalCardState();
  //Variables de actividad
  String actividad;
  int tConcentrate;
  int tRelax;

  final AnimationController animationController;
}

class _GoalCardState extends State<GoalCard> {
  @override
  Widget build(BuildContext context) {
    double anchoPantalla = MediaQuery.of(context).size.width;

    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: widget.animationController,
        curve: Curves.linear,
      ),
      axisAlignment: 0.0,
      child: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          //height: 80,
          //width: anchoPantalla * 0.9,
          decoration: BoxDecoration(
            color: Color.fromRGBO(223, 255, 255, 1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Actividad
              Container(
                padding: EdgeInsets.only(left: 10, bottom: 13),
                width: anchoPantalla * 0.45,
                child: _actividadInput(),
              ),
              //Tiempo
              Spacer(),
              Container(
                //padding: EdgeInsets.only(left: 10, bottom: 13),
                width: anchoPantalla * 0.15,
                child: _concentracionInput(),
              ),
              Spacer(),
              //Descanso
              Container(
                //padding: EdgeInsets.only(left: 10, bottom: 13),
                width: anchoPantalla * 0.15,
                child: _descansoInput(),
              ),
              Spacer(),
              //Boton
              Container(
                width: anchoPantalla * 0.13,
                child: FlatButton(
                  onPressed: () {
                    //Seguir a la siguiente pantalla
                    //print('Navigate');
                    if ((widget.actividad != null) &&
                        (widget.tConcentrate != null) &&
                        (widget.tRelax != null)) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Aquadoro(
                              actividad: widget.actividad,
                              tConcentracion: widget.tConcentrate,
                              tDescanso: widget.tRelax)));
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: anchoPantalla * 0.1,
                    color: Colors.cyan[700],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } //Build

  //Funciones para mantener lo escrito en las tarjetas
  String initialActivity() {
    if (widget.actividad == null) {
      return " ";
    } else {
      return "${widget.actividad.toString()}";
    }
  }

  String initialConcentration() {
    if (widget.tConcentrate == null) {
      return " ";
    } else {
      return "${widget.tConcentrate.toString()}";
    }
  }

  String initialRelax() {
    if (widget.tRelax == null) {
      return " ";
    } else {
      return "${widget.tRelax.toString()}";
    }
  }

  Widget _actividadInput() {
    return TextFormField(
      initialValue: initialActivity(),
      decoration: InputDecoration(
        labelText: "Actividad",
        labelStyle: TextStyle(fontSize: 13),
      ),
      onChanged: (activity) {
        widget.actividad = activity;
        print("Activity ${widget.actividad}");
      },
    );
  } //ActividadInput

  Widget _concentracionInput() {
    return TextFormField(
      initialValue: initialConcentration(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: "Focus",
        labelStyle: TextStyle(fontSize: 13),
      ),
      onChanged: (tiempoConcentracion) {
        widget.tConcentrate = (double.parse(tiempoConcentracion)).toInt();
        print("Tiempo Concentracion: ${widget.tConcentrate}");
      },
    );
  } //Concentracion

  Widget _descansoInput() {
    return TextFormField(
      initialValue: initialRelax(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: "Relax",
        labelStyle: TextStyle(fontSize: 13),
      ),
      onChanged: (tiempoDescanso) {
        widget.tRelax = (double.parse(tiempoDescanso)).toInt();
        print("Tiempo Relajacion: ${widget.tRelax}");
      },
    );
  } //Descanso
}
