import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:percent_indicator/percent_indicator.dart';


class Inventions extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    
      home: Scaffold(

          body:
          Stack(
              children: <Widget>
              [
                Positioned.fill(  
                  child: Image(
                    image: AssetImage('assets/back.jpg'),
                    fit : BoxFit.fill,
                  ),
                ),
                ListView(
                    children: [
                      Column(
                        children: [

                         AnimatedDefaultTextStyle(
                         duration : const Duration (milliseconds: 300),
                          style : TextStyle(
                          fontSize : 100,
                          color : Colors.black,
                         fontWeight : FontWeight.bold,
                               ),
                          child: Text(
                        'MEDECINE',
                         textAlign : TextAlign.center,
                        
                             ),
                           ),




                          Column(
                              children: [
                                Container(
                                  child: Stack(
                                      children: [


                                        Container(
                                          margin: EdgeInsets.all(10.0),
                                          height: 150,
                                          width: 200,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10.0),
                                                topLeft: Radius.circular(10.0)),
                                            image: DecorationImage(
                                                image: AssetImage('assets/Abacavir.png'),
                                                fit: BoxFit.cover
                                            ),
                                          ),
                                        ),
                                      ]
                                  ),
                                ),
                                Container(
                                    width: 300,
                                    child: Text("This medicine is an antiretroviral active against the human immunodeficiency virus (HIV).",
                                      style: TextStyle(
                                        fontSize: 13,

                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    )
                                )
                              ]
                          ),
                          SizedBox(width: 200,),
                          Column(

                                 children : [
                                   AnimatedContainer(
                                     duration: const Duration(milliseconds: 100),
                                          margin: EdgeInsets.all(10.0),
                                          height: 150,
                                          width: 200,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10.0),
                                                topLeft: Radius.circular(10.0)),
                                            image: DecorationImage(
                                                image: AssetImage('assets/amantadine.jpg'),
                                                fit: BoxFit.cover
                                            ),
                                          ),
                                        ),
]
                                  ),

                                Container(
                                    width: 300,
                                    child: Text("Amantadine would act by causing the release of dopamine in the striatum. In infectiology, an antiviral agent administered orally, amantadine is effective against influenzae type A viruses.",
                                      style: TextStyle(
                                        fontSize: 13,


                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    )
                                )
                              ]
                          ),

                          Column(
                              children: [
                                Container(
                                  child: Stack(
                                      children: [

                                        Container(
                                          margin: EdgeInsets.all(10.0),
                                          height: 150,
                                          width: 200,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10.0),
                                                topLeft: Radius.circular(10.0)),
                                            image: DecorationImage(
                                                image: AssetImage('crotorax.jpg'),
                                                fit: BoxFit.cover
                                            ),
                                          ),
                                        ),
                                      ]
                                  ),
                                ),
                                Container(
                                    width: 300,
                                    child: Text("Crotorax HC Cream is a combination medicine which is used in the treatment of scabies",
                                      style: TextStyle(
                                        fontSize: 13,

                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    )
                                )
                              ]
                          ),


                          Column(
                              children: [
                                Container(
                                  child: Stack(
                                      children: [

                                        Container(
                                          margin: EdgeInsets.all(10.0),
                                          height: 150,
                                          width: 200,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10.0),
                                                topLeft: Radius.circular(10.0)),
                                            image: DecorationImage(
                                                image: AssetImage('assets/glucose.jpg'),
                                                fit: BoxFit.cover
                                            ),
                                          ),
                                        ),
                                      ]
                                  ),
                                ),
                                Container(
                                    width: 300,
                                    child: Text("??pondre ?? la demandLe glucose est un sucre (glucide) simple stock?? dans notre organisme sous la forme de glycog??ne qui peut ??tre mobilis?? ?? tout moment pour re de la cellule concern??e : c'est le carburant de notre organisme.",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    )
                                )
                              ]
                          ),
                          Column(
                              children: [
                                Container(
                                  child: Stack(
                                      children: [

                                        Container(
                                          margin: EdgeInsets.all(10.0),
                                          height: 150,
                                          width: 200,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10.0),
                                                topLeft: Radius.circular(10.0)),
                                            image: DecorationImage(
                                                image: AssetImage('assets/pfizer.jpg'),
                                                fit: BoxFit.cover
                                            ),
                                          ),
                                        ),
                                      ]
                                  ),
                                ),
                                Container(
                                    width: 300,
                                    child: Text("2 sept. 2021 ??? D'apr??s le SAGE, le vaccin ?? ARNm Pfizer/BioNTech contre la COVID-19 est s??r et efficace.",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                      ),
                                    )
                                )
                              ]
                          ),




                        ],
                      )
                    ]
                )







    )
    );

  }
  

}
