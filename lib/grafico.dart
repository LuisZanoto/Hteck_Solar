import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';  
import 'package:charts_flutter/flutter.dart' as charts; 



class TelaGrafico extends StatefulWidget {
  @override
  _TelaGraficoState createState() => _TelaGraficoState();
}

class _TelaGraficoState extends State<TelaGrafico> {

        var data = List<Potencia>();

        var db = FirebaseFirestore.instance;

	@override
	void initState(){
		super.initState();
		data.add(Potencia('21', 5));
		data.add(Potencia('22', 10));
    
        }




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
               child: chartContainer = SimpleBarChart.withSampleData(data),  
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
 factory SimpleBarChart.withSampleData(data) {  
   return new SimpleBarChart(  
     _createSampleData(data),  
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
 static List<charts.Series<Potencia, String>> _createSampleData(data) {  
   return [  
     new charts.Series<Potencia, String>(  
       id: 'Pot',  
       colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,  
       domainFn: (Potencia sales, _) => sales.dia,  
       measureFn: (Potencia sales, _) => sales.pot,  
       data: data.toList(),  
     )  
   ];  
 }  
}  
class Potencia {  
 final String dia;  
 final int pot;  
   
 Potencia(this.dia, this.pot);  
}  