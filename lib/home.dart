
import 'package:flutter/material.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtController=TextEditingController();
  var ftController=TextEditingController();
  var inController=TextEditingController();

  var result="";
  var bgColor=const Color.fromARGB(255, 21, 133, 224);

  

  

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
       
        title: Text("BMI App"),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
            
              
             Text("BMI",style: TextStyle(
              fontSize: 34,fontWeight: FontWeight.w700
              ),),
              SizedBox(height: 28.0,),
            
              TextField(
                controller: wtController,
                decoration: InputDecoration(
                  label: Text('Enter your Weight(in kg)'
                  ),prefixIcon: Icon(Icons.line_weight_sharp)
                ),
                keyboardType: TextInputType.number,
              ),
             SizedBox(height: 11.0,),
              TextField(
                controller: ftController,
                decoration: InputDecoration(
                  label: Text('Enter your Height(in ft)'
                  ),prefixIcon: Icon(Icons.height_outlined)
                ),
                keyboardType: TextInputType.number,
              ),
            SizedBox(height: 11.0),     
            
              TextField(
                controller: inController,
                decoration: InputDecoration(
                  label: Text('Enter your Height(in inch)'
                  ),prefixIcon: Icon(Icons.height_outlined)
                ),
                keyboardType: TextInputType.number,
              ),
                  
              SizedBox(height: 26.0,),
        
              ElevatedButton(onPressed: (){
        
                var wt=wtController.text.toString();
                var ft=ftController.text.toString();
                var inch=inController.text.toString();
        
                if(wt!=""&& ft!=""&&inch!=""){
                   var iWt=int.parse(wt);
                   var iFt=int.parse(ft);
                   var iInch=int.parse(inch);
        
                   var tInch=(iFt*12)+iInch;
        
                   var tCm=tInch*2.54;
                   var tM=tCm/100;
        
                   var bmi=iWt/(tM*tM);

                    var msg="";
                    if(bmi>25){
                      msg="You are OverWeight!!";
                      bgColor=Colors.orange.shade200;
                    }else if(bmi<18){
                      msg="You are UnderWeight!!";
                      bgColor=Color.fromARGB(255, 202, 63, 63);

                    }else{
                      msg="You are Fit";
                      bgColor=Color.fromARGB(255, 7, 181, 13);

                    }

                   setState(() {
                     result="$msg \n Your BMI is:${bmi.toStringAsFixed(2)}";
                     
                   });
        
                   
        
        
        
        
                }else{
        
                 setState(() {
                  result="Please fill all the required blank";
                   
                 });
                }
        
                
        
        
              
        
              }
              
        
              , child:Text('Calculate') ),
              SizedBox(height: 18.0,),
        
              
        
              Text(result,style: TextStyle(fontSize: 19.0),)
            
              ] , 
            ),
          ),
        ),
      ),
    );
  }
}