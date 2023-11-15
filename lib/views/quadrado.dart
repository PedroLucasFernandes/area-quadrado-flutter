import 'package:flutter/material.dart';

class Quadrado extends StatefulWidget {

  @override
  _QuadradoState createState() => _QuadradoState();
}

class _QuadradoState extends State<Quadrado> {
  double lado = 0;

  void onPressed() {
    double resultado = calcularAreaQuadrado(lado);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Resultado"),
          content: Text("Área do Quadrado: $resultado"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Fechar"),
            ),
          ],
        );
      },
    );
  }

  double calcularAreaQuadrado(double lado) {
    return lado * lado;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cálculo de área do Quadrado",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.square_outlined,
              size: 150,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  lado = double.parse(value);
                });
              },
              decoration: InputDecoration(
                labelText: "Lado do Quadrado",
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                filled: true,
                fillColor: Colors.grey.withOpacity(0.4),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
          width: 160,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color(0XFFADD8E6)),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            child: Text(
              "Calcular",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 14
              ),
            ),
          ),
        ),
          ],
        ),
      ),
    );
  }
}