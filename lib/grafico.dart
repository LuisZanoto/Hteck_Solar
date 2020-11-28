import 'package:flutter/material.dart';  
import 'package:charts_flutter/flutter.dart' as charts;
import 'model/dadosPot.dart'; 



class TelaGrafico extends StatefulWidget {
  @override
  _TelaGraficoState createState() => _TelaGraficoState();
}

class _TelaGraficoState extends State<TelaGrafico> {
  @override
  Widget build(BuildContext context) {
    //RECEBER os dados da TelaMenu
    List<Dados> data = ModalRoute.of(context).settings.arguments;

    print(data.length);
    List<charts.Series<Dados, String>> series = [
      charts.Series<Dados, String>(
        id: 'Potencia',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        data: data.toList(),
        domainFn: (Dados d, _) => d.mes,
        measureFn: (Dados d, _) => d.valor,
      )
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Gráfico :'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30),
            ),
            Text("Potencia (KWh) "),

             Container(  
               height: 250,  
               child: charts.BarChart(series, animate: true),
             ), 


            
             Padding( padding: EdgeInsets.only(top: 40), ),  
             Row(  
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,                
               children: <Widget>[  
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.deepPurpleAccent,
                  child: Text("Menu"),
                  onPressed: (){
                  Navigator.pop(context);
                   },          
          
                 ),
 
               ],  
             ),
          ],
        ),
      ),
    );
  }

}

  


