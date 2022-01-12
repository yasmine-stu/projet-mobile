import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/models/offer.dart';
import 'package:flutter_login_ui/models/user_model.dart';
class OfferPage extends StatefulWidget {
  final OfferModel offer;
  final String username ;
  const OfferPage({Key? key, required this.offer , required this.username}) : super(key: key);
  @override
  State<OfferPage> createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  final TextEditingController responseController = TextEditingController();
  late final CollectionReference responseCollection = FirebaseFirestore.instance.collection('offers').doc(widget.offer.offerId).collection('responses');
  // UserModel user=UserModel(name: '', userId: '');

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xFF25C1C1),
      body: SingleChildScrollView(
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
                          Text(widget.offer.seller,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: size.width * 0.65,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          widget.offer.content,
                          style: const TextStyle(fontSize: 18),
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
                            backgroundImage:
                                const AssetImage('assets/yas.jpg'),
                            radius: size.width * 0.1,
                          ),
                          const SizedBox(height: 5),
                           Text(widget.username,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ],
                      ),
                      Container(
                        width: size.width * 0.65,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Column(children: [
                          TextField(
                            autofocus: false,
                            controller: responseController,
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
                                  if(responseController.text.isNotEmpty){
                                    await responseCollection.add({
                                     
                                      'username':widget.username,
                                      'content': responseController.text,
                                    });
                                   responseController.clear();
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
                    stream: responseCollection.snapshots(),
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
                                    data['username'],
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
                                child: Column(children: [
                                  Text(
                                    data['content'] as String,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ]),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  
                  SizedBox(height:30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                const AssetImage('assets/firas.jpg'),
                            radius: size.width * 0.1,
                          ),
                          const SizedBox(height: 5),
                          const Text('firas',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ],
                      ),
                      Container(
                        width: size.width * 0.65,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                        child: const Text(
                          '+121 63547750 call me ',
                          style: TextStyle(fontSize: 18),
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
                            backgroundImage:
                                const AssetImage('assets/naj.jfif'),
                            radius: size.width * 0.1,
                          ),
                          const SizedBox(height: 5),
                          const Text('najah',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                        ],
                      ),
                      Container(
                        width: size.width * 0.65,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
                        child: const Text(
                          'hi mark ! i would like to commend it please . can you give me your number to call you ?',
                          style: TextStyle(fontSize: 18),
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
      floatingActionButton: FloatingActionButton(onPressed: (){Navigator.pop(context);}, child: const Icon(Icons.arrow_back),),
    );
  }
}
