import 'package:flutter/material.dart';  
import 'package:charts_flutter/flutter.dart' as charts; 



class TelaGrafico extends StatefulWidget {
  @override
  _TelaGraficoState createState() => _TelaGraficoState();
}

class _TelaGraficoState extends State<TelaGrafico> {
 Widget chartContainer = Column(  
   mainAxisAlignment: MainAxisAlignment.center,  
   children: [Text('Chart Viewer')],  
 );  
   
 @override  
 Widget build(BuildContext context) {  
   return Scaffold(  
      
       appBar: AppBar(  
         title: Text('Gráfico :'),  
       ),  
       body: SingleChildScrollView(  
         child: Column(  
           children: <Widget>[  
             Padding( padding: EdgeInsets.only(top: 30), ),
             Text("Potencia (KWh) "),
             Container(  
               height: 250,  
               child: chartContainer = SimpleBarChart.withSampleData(),  
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


class SimpleBarChart extends StatelessWidget {  
 final List<charts.Series> seriesList;  
 final bool animate;  
   
 SimpleBarChart(this.seriesList, {this.animate});  
   
 /// Creates a [BarChart] with sample data and no transition.  
 factory SimpleBarChart.withSampleData() {  
   return new SimpleBarChart(  
     _createSampleData(),  
     // Disable animations for image tests.  
     animate: false,  
   );  
 }  
   
 @override  
 Widget build(BuildContext context) {  
   return new charts.BarChart(  
     seriesList,  
     animate: animate,  
   );  
 }  
   
 /// Create one series with sample hard coded data.  
 static List<charts.Series<Potencia, String>> _createSampleData() {  
   final data = [  
     new Potencia('21', 5),  
     new Potencia('22', 10),  
     new Potencia('23', 20),  
     new Potencia('24', 40), 
     new Potencia('25', 100),
     new Potencia('26', 200), 
     new Potencia('27', 300),  
     new Potencia('28', 250),  
     new Potencia('29', 80),  
     new Potencia('30', 20), 
     new Potencia('31', 10),
     new Potencia('32', 5),
   ];  
   
   return [  
     new charts.Series<Potencia, String>(  
       id: 'Pot',  
       colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,  
       domainFn: (Potencia sales, _) => sales.dia,  
       measureFn: (Potencia sales, _) => sales.pot,  
       data: data,  
     )  
   ];  
 }  
}  
class Potencia {  
 final String dia;  
 final int pot;  
   
 Potencia(this.dia, this.pot);  
}  