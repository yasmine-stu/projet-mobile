import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_ui/pages/inventions.dart';
import '/models/offer.dart';
import '/models/user_model.dart';
import '/services/auth.dart';

import '/screens/offerpage.dart';
import '/screens/paymentpage.dart';
import '/pages/newspage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({Key? key, required this.username}) : super(key: key);
  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference offerCollection =  FirebaseFirestore.instance.collection('offers');
  final TextEditingController offerController = TextEditingController();
  double  _drawerIconSize = 24;
  double _drawerFontSize = 17;
  AuthService authService=AuthService(); 
  
  UserModel user=UserModel(userId: '' , name: '');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    debugShowCheckedModeBanner: false;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).accentColor,]
              )
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only( top: 16, right: 16,),
            child: Stack(
              children: <Widget>[
                Icon(Icons.notifications),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration( color: Colors.green, borderRadius: BorderRadius.circular(6),),
                    constraints: BoxConstraints( minWidth: 12, minHeight: 12, ),
                    child: Text( '5', style: TextStyle(color: Colors.white, fontSize: 8,), textAlign: TextAlign.center,),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration:BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.2),
                    Theme.of(context).accentColor.withOpacity(0.5),
                  ]
              )
          ) ,
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 1.0],
                    colors: [ Theme.of(context).primaryColor,Theme.of(context).accentColor,],
                  ),
                ),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Text("Your menu",
                    style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
             

              /* homepage */
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.home, size: _drawerIconSize,color: Theme.of(context).accentColor,),
                title: Text('Home Page',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
                onTap: () {
                  // Navigator.push( context, MaterialPageRoute(builder: (context) => HomePage()), );
                },
              ),
              /* newspage */
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.new_releases, size: _drawerIconSize,color: Theme.of(context).accentColor,),
                title: Text('News Page',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
                onTap: () {
                  Navigator.push( context, MaterialPageRoute(builder: (context) => NewsPage()), );
                },
              ),
               /* inventions */
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.inventory, size: _drawerIconSize,color: Theme.of(context).accentColor,),
                title: Text('Inventions',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
                onTap: () {
                  Navigator.push( context, MaterialPageRoute(builder: (context) => Inventions()), );
                },
              ),
              /* logout */
              Divider(color: Theme.of(context).primaryColor, height: 1,),
              ListTile(
                leading: Icon(Icons.logout_rounded, size: _drawerIconSize,color: Theme.of(context).accentColor,),
                title: Text('Logout',style: TextStyle(fontSize: _drawerFontSize,color: Theme.of(context).accentColor),),
                // onTap: () {SystemNavigator.pop(); },
      
                onTap: () async{
                     UserModel? userModel=await authService.signOut(); 
                     SystemNavigator.pop();                               //After successful login we will redirect to profile page. Let's create profile page now
                     //print('user logged out');
                },
              ),
            ],
          ),
        ),
      ),
    
      // backgroundColor: const Color(0xFF25C1C1),
      
      
      body: SingleChildScrollView(
        child :Container(
          decoration : BoxDecoration(
        // Box decoration takes a gradient
           gradient: LinearGradient(
          // Where the linear gradient begins and ends
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          // Add one stop for each color. Stops should increase from 0 to 1
          // stops: [0.3, 0.5],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
          
            Colors.cyan.shade50,
            Colors.cyan.shade700,
            
          ],
        ),
      ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFFD9F6F6),
                    ),
                    
                  ),
                  SizedBox(height: size.width * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                const AssetImage('assets/yas.jpg'),
                            radius: size.width * 0.1,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.username,
                            style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: size.width * 0.65,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        child: Column(children: [
                          TextField(
                            autofocus: false,
                            controller: offerController,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'add medicine or ask question',
                            ),
                            minLines: 1,
                            maxLines: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              MaterialButton(
                                onPressed: () async {
                                  FocusScope.of(context).unfocus();
                                  //print(offerController.text.replaceAll(RegExp(r'\n'), '*'));
                                  if(offerController.text.isNotEmpty){
                                    await offerCollection.add({
                                      //TODO: replace current user with the authenticated username
                                      'seller': widget.username,
                                      'content': offerController.text,
                                    });
                                    offerController.clear();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(backgroundColor: Colors.red, content: Text('can\'t submit an empty offer', style: TextStyle(color: Colors.white, fontSize:20.0))));
                                  }
                                },
                                child: const Text('publish'),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                color: const Color(0xFF25C1C1),
                              )
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),
                  SizedBox(height: size.width * 0.1),
                  StreamBuilder<QuerySnapshot>(
                    stream: offerCollection.snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator();
                      }
                      List<QueryDocumentSnapshot> offerDocuments = snapshot.data!.docs;
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: offerDocuments.length,
                        separatorBuilder: (context, index) =>
                            SizedBox(height: size.width * 0.1),
                        itemBuilder: (context, index) {
                          final data = offerDocuments[index].data()!
                              as Map<String, dynamic>;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        const AssetImage('assets/yas.jpg'),
                                    radius: size.width * 0.1,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    data['seller'],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: size.width * 0.65,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                  Text(
                                    data['content'],
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          icon: const Icon(
                                              Icons.shopping_cart_outlined),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const PaymentPage()));
                                          }),
                                      MaterialButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                OfferPage(offer: OfferModel(offerId: offerDocuments[index].id, content: data['content'], seller: data['seller']), username: widget.username,),
                                              ),
                                            );
                                        },
                                        child: const Text('respond'),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        color: const Color(0xFF25C1C1),
                                      )
                                    ],
                                  ),
                                ]),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: const AssetImage('assets/betty.jpg'),
                            radius: size.width * 0.1,
                          ),
                          const SizedBox(height: 5),
                          const Text('betty', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        ],
                      ),
                      Container(
                        width: size.width * 0.65,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white),
                        child: Column(
                          children: [
                            const Text('name : Doliprane\nprice : 3 \$\nCountry : USA\nThis medecine is for head ache and fever it is only available in USA . if you need it DM me', style: TextStyle(fontSize: 18),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(icon: const Icon(Icons.shopping_cart_outlined), onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> const PaymentPage()));}),
                                MaterialButton(onPressed: () {}, child: const Text('respond'), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), color: const Color(0xFF25C1C1),)
                              ],
                            ),
                          ]
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.width * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: const AssetImage('assets/ouss.jpg'),
                            radius: size.width * 0.1,
                          ),
                          const SizedBox(height: 5),
                          const Text('Oussema', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        ],
                      ),
                      Container(
                        width: size.width * 0.65,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white),
                        child: Column(
                          children: [
                            const Text('hi! i m a tunisian and i am looking for HOMEOPTIC drugs for my eyes . it is not available in my country and i will have surgery soon . can anyone afford it for me please ?', style: TextStyle(fontSize: 18),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                MaterialButton(onPressed: (){}, child: const Text('respond'), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)), color: const Color(0xFF25C1C1),)
                              ],
                            ),
                          ]
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      ),
    );
  }
}
