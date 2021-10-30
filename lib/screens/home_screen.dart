import 'package:furniture_app/models/chair.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(

          elevation: 3,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(2000),bottomLeft: Radius.circular(500))),
          backgroundColor: Colors.blue,
          title: const Text("Best Furniture",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          bottom: PreferredSize(

              child: Container(

                padding: const EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                height: 70,
                child: const Text("Perfect Choice",
                    style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.w500)),
              ),
              preferredSize: const Size.fromHeight(70)),
        ),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 300,
                  height: 60,
                  child: TextFormField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      fillColor: Colors.white,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                const Icon(
                  Icons.subject_outlined,
                  size: 30,
                )
              ],
            ),
          const  SizedBox(
              height: 30,
            ),
            TabBar(
                unselectedLabelColor: Colors.black,
                isScrollable: true,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black,
                ),
                tabs:  [
                  TabData(txt: "All"),
                 TabData(txt: "chair"),
                 TabData(txt: "Table"),
                TabData(txt: "Lamp"),
              TabData(txt: "Floor")
                ]),
          const  SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: Chair.myChairs.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(15),
                        borderOnForeground: true,
                        child: Row(

                          children: [
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    child: Image.asset(
                                        "${Chair.myChairs[i]['img1']}"),
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.3),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                  ),
                                ),
                              const  Positioned(right: 10,top: 10,child: CircleAvatar(radius: 14,backgroundColor:Colors.white ,child: Icon(Icons.favorite_outlined,color: Colors.red,size: 20,),))
                              ],
                            ),
                           const SizedBox(width: 5,),
                            Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                              Text("${Chair.myChairs[i]['label']}",style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),textAlign: TextAlign.left,),
                              const SizedBox(height: 15,),
                              Text("${Chair.myChairs[i]['owner']}",style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 15,),textAlign: TextAlign.left,),
                              const  SizedBox(height: 12,),
                              Text("${Chair.myChairs[i]['discrip']}",softWrap: true,style:const TextStyle(fontSize: 12,),textAlign: TextAlign.left,),
                             const   SizedBox(height: 15,),
                              Row(children: [const Text("\$1222",style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),const SizedBox(width: 15,),
                              ElevatedButton(onPressed: (){}, child:const Text("buy"),style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),primary: Colors.blue),)
                              ]),

                            ],)
                          ],
                        ),
                      ),
                    );
                  },
                ))
          ],
        )),
        bottomNavigationBar: CurvedNavigationBar(
          height: 60,
          backgroundColor: Colors.transparent,
          color: Colors.blue,
          buttonBackgroundColor: Colors.blue,
          items: const[
            Icon(Icons.home, size: 30,color: Colors.white,),
            Icon(Icons.shopping_bag, size: 30,color: Colors.white,),
            Icon(Icons.star, size: 30,color: Colors.white,),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Tab TabData({required String txt}) {
    return Tab(
                  child: Text(txt),
                );
  }
}
