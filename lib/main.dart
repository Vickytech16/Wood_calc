

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'about_view.dart';

enum MenuAction {
  About
}


void main() {
  runApp( MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
      
      routes: {
        '/About/':(context) => AboutView(),
      },
      
    ));
}


class ValuesCannotBeZeroOrEmptyException implements Exception{}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();


}

class _HomePageState extends State<HomePage> {

  late TextEditingController _length; 
  late TextEditingController _count; 
  late TextEditingController _price;

  late String calculated_length;
  late String calculated_price;
  bool showResults = false;

  @override
  void initState() {

    _length=TextEditingController();
    _count=TextEditingController();
    _price=TextEditingController();

    super.initState();
  }

  // We created this texteditingcontroller, it is our responsibility to get rid of it from the memory after our use, for that we are using this method
  @override
  void dispose() {
    
    _length.dispose();
    _count.dispose();
    _price.dispose();

    super.dispose();

  }

    Calculate(double x, double y) 
  {

    try{

    var L = _length.text;
    var P = _price.text;
    var C = _count.text;

    double length = double.parse(L);
    double price = double.parse(P);
    double count = double.parse(C);



    FocusScope.of(context).unfocus();
    // print ("length: $length, price: $price, count: $count");

    if (length==0 || L.isEmpty || price==0 || P.isEmpty || count==0 || C.isEmpty)
    {
      throw ValuesCannotBeZeroOrEmptyException();
    }

    double cubicFeet = (x * y * length * count)/144;
    double Rate = cubicFeet * price;

    print("Cubicfeet: $cubicFeet, Rate: $Rate");


    setState(() {

    calculated_length = cubicFeet.toStringAsFixed(3);
    calculated_price = Rate.toStringAsFixed(3);
    showResults = true;
      
    });



    } 

    on FormatException {
      showError(context, "Only Numeric Values are allowed, and the fields cannot be empty");
    }

    on ValuesCannotBeZeroOrEmptyException {
      showError(context, "The fields cannot be empty or zero");
    }

    catch(e){
      showError(context, "An unknown error has occured $e");
    }
    
    
    
  }
  
  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    // print("Screenwidth is $screenWidth");
    // print("ScreenHeight is $screenHeight");

    return  Scaffold(

      appBar: AppBar(
        title : const Text("Wood Calculator"),
        backgroundColor: Colors.brown[300],

        
      ),
      
      body:
       Container(
          padding: EdgeInsets.only(left: screenWidth*0.1, right: screenWidth*0.1, top: 50 ),
          color: Colors.brown[100],
          width: screenWidth,
          height: screenHeight,
          alignment: Alignment.topCenter,
          child: 
                Column(
                
                crossAxisAlignment: CrossAxisAlignment.center ,
                children: [              

                  Row(
                    children: [
                     Text("Length(நீளம்)"),
                     SizedBox(width: 80),
                     SizedBox(
                       width: screenWidth*0.3,
                       child: TextField(
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),                         
                          controller: _length,
                          decoration: InputDecoration(
                          hintText: 'Enter length',                    
                         ),),
                     ),
                    ],
                  ),
                  Row(
                    children: [
                     Text("Count(எண்ணிக்கை)"),
                     
                     SizedBox(width: 22),
                     SizedBox(
                       width: screenWidth*0.3,
                       child: TextField(
                          keyboardType: const TextInputType.numberWithOptions(decimal: true), 
                                                  
                          controller: _count,
                          decoration: InputDecoration(
                          hintText: 'Enter Count',                    
                         ),),
                     ),
                    ],
                  ),
                  Row(
                    children: [
                     Text("Price(விலை)"),
                     SizedBox(width: 80),
                     SizedBox(
                       width: screenWidth*0.3,
                       child: TextField(
                          keyboardType: const TextInputType.numberWithOptions(decimal: true), 
                          controller: _price,
                          decoration: InputDecoration(
                          hintText: 'Enter Price',                    
                         ),),
                     ),
                    ],
                  ),
                 SizedBox(height: 30,), 
                Flexible(
                  child: GridView.count(
                    crossAxisCount: 4,
                    shrinkWrap: true,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      OutlinedButton(onPressed: () {Calculate(4,3);}, child: const Text("4 X 3"), style: ButtonStyle(alignment: Alignment.center, shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8) )), padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 0, right: 0)), backgroundColor: MaterialStateProperty.all<Color>(Colors.blue))),
                      OutlinedButton(onPressed: () {Calculate(5,3);}, child: const Text("5 X 3"), style: ButtonStyle(alignment: Alignment.center, shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8) )), padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 0, right: 0)), backgroundColor: MaterialStateProperty.all<Color>(Colors.blue))),
                      OutlinedButton(onPressed: () {Calculate(5,4);}, child: const Text("5 X 4"), style: ButtonStyle(alignment: Alignment.center, shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8) )), padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 0, right: 0)), backgroundColor: MaterialStateProperty.all<Color>(Colors.blue))),
                      OutlinedButton(onPressed: () {Calculate(6,4);}, child: const Text("6 x 4"), style: ButtonStyle(alignment: Alignment.center, shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8) )), padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 0, right: 0)), backgroundColor: MaterialStateProperty.all<Color>(Colors.blue))),
                      OutlinedButton(onPressed: () {Calculate(2,0.5);}, child: const Text("2 x 1/2"), style: ButtonStyle(alignment: Alignment.center, shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8) )), padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 0, right: 0)), backgroundColor: MaterialStateProperty.all<Color>(Colors.blue))),
                      OutlinedButton(onPressed: () {Calculate(3,1.5);}, child: const Text("3 x 1 1/2"), style: ButtonStyle(alignment: Alignment.center, shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8) )), padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 0, right: 0)), backgroundColor: MaterialStateProperty.all<Color>(Colors.blue))),
                      OutlinedButton(onPressed: () {Calculate(4,0.5);}, child: const Text("4 x 1/2"), style: ButtonStyle(alignment: Alignment.center, shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8) )), padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 0, right: 0)), backgroundColor: MaterialStateProperty.all<Color>(Colors.blue))),
                      OutlinedButton(onPressed: () {Calculate(5,1.5);}, child: const Text("5 x 1 1/2"), style: ButtonStyle(alignment: Alignment.center, shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8) )), padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 0, right: 0)), backgroundColor: MaterialStateProperty.all<Color>(Colors.blue))),
                      OutlinedButton(onPressed: () {Calculate(6,1.5);}, child: const Text("6 x 1 1/2"), style: ButtonStyle(alignment: Alignment.center, shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8) )), padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 0, right: 0)), backgroundColor: MaterialStateProperty.all<Color>(Colors.blue))),
                      OutlinedButton(onPressed: () {Calculate(7,0.5);}, child: const Text("7 x 1/2"), style: ButtonStyle(alignment: Alignment.center, shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8) )), padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 0, right: 0)), backgroundColor: MaterialStateProperty.all<Color>(Colors.blue))),
                      OutlinedButton(onPressed: () {Calculate(2,2);}, child: const Text("2 x 2"), style: ButtonStyle(alignment: Alignment.center, shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8) )), padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 0, right: 0)), backgroundColor: MaterialStateProperty.all<Color>(Colors.blue))),
                      OutlinedButton(onPressed: () {Calculate(3,2);}, child: const Text("3 x 2"), style: ButtonStyle(alignment: Alignment.center, shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8) )), padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 0, right: 0)), backgroundColor: MaterialStateProperty.all<Color>(Colors.blue))),
                      OutlinedButton(onPressed: () {Calculate(6,2);}, child: const Text("6 x 2"), style: ButtonStyle(alignment: Alignment.center, shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8) )), padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 0, right: 0)), backgroundColor: MaterialStateProperty.all<Color>(Colors.blue))),
                      OutlinedButton(onPressed: () {Calculate(3,3);}, child: const Text("3 x 3"), style: ButtonStyle(alignment: Alignment.center, shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8) )), padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 0, right: 0)), backgroundColor: MaterialStateProperty.all<Color>(Colors.blue))),
                      OutlinedButton(onPressed: () {Calculate(4,4);}, child: const Text("4 x 4"), style: ButtonStyle(alignment: Alignment.center, shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8) )), padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 0, right: 0)), backgroundColor: MaterialStateProperty.all<Color>(Colors.blue))),
                      OutlinedButton(onPressed: () {Calculate(5,5);}, child: const Text("5 x 5"), style: ButtonStyle(alignment: Alignment.center, shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8) )), padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.only(left: 0, right: 0)), backgroundColor: MaterialStateProperty.all<Color>(Colors.blue))),
                                   
                           ],
                  ),
                ),   
                 SizedBox(height: screenHeight*0.1,), 

                 if(showResults==true)...[
                  Text("The Overall dimensions are $calculated_length"),
                  SizedBox(height: 20,),
                  Text("The Final Rate is $calculated_price"),
                 ]
            

                ],
                )),
       


    );
  }
  
}


Future<void> showError(BuildContext context, String text)
{
 return showDialog(context: context,builder: (context) {
   
   return AlertDialog(
    title: const Text("An error occured"), // title
    content:  Text(text), // content
    
    actions: [

      // This button will send a verification mail and redirect the user
      TextButton(
        onPressed: () 
        {
         Navigator.of(context).pop(); // When the user returns from the verification screen, alert box will appear. To prevent this,we first pop it out.
        },

        child: const Text("OK"))
    ],
    
   );
  },
 );
}



