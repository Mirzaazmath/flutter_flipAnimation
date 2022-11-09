import 'package:flutter/material.dart';

import 'flip.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Color>_colors=[
   const  Color(0xffc94b4b),
   const  Color(0xff4b134f)

  ];


  bool isfliped= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: AnimatedContainer(
        duration:const  Duration(milliseconds: 1000),
       decoration: BoxDecoration(
         gradient: LinearGradient(
           begin:isfliped? Alignment.topLeft: Alignment.bottomLeft,
           colors: _colors
         )
       ),
        child: Center(
          child: Column(

             mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlipWidget(from: from(),to: to(),animationStatus: isfliped?AnimationStatus.reverse:AnimationStatus.forward,),
             const  SizedBox(
                height: 20,
              ),

              ElevatedButton(onPressed: (){
                setState(() {
                  isfliped=!isfliped;
                  if(isfliped){
                    _colors=[
                       const Color(0xffc94b4b),
                      const  Color(0xff4b134f)

                    ];
                  }else{
                    _colors=[
                    const   Color(0xfffffbd5),
                      const Color(0xffb20a2c),



                    ];

                  }


                });
              }, child:const Text("Flip"))
            ],
          ),
        ),
      ),
    );
  }
  Widget from(){
    return Container(height: 300,width: 300,
      decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            image: AssetImage("assets/image1.jpeg"),fit: BoxFit.fill,
          )

      ),
    );
  }
  Widget to(){
    return Container(height: 300,width: 300,
      decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            image: AssetImage("assets/image2.jpeg"),fit: BoxFit.fill,
          )

      ),
    );
  }
}
