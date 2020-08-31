import 'package:flutter/material.dart';
import 'package:pet_ui/src/detailScreen.dart';
import 'const.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 1;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: MediaQuery.of(context).size.height,
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? -0.5 : 0),
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isDrawerOpen
                      ? IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            });
                          })
                      : IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            setState(() {
                              xOffset = 230;
                              yOffset = 150;
                              scaleFactor = 0.6;
                              isDrawerOpen = true;
                            });
                          }),
                  Column(
                    children: [
                      Text('Location'),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: primaryGreen,
                          ),
                          Text('Ukraine'),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://avatars1.githubusercontent.com/u/16144571?s=60&v=4'),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Icon(Icons.search), Text('Search pet to adopt'), Icon(Icons.settings)],
              ),
            ),
            Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, idx) {
                  return Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          child: Image.asset(categories[idx]['iconPath'], color: idx == index ? Colors.white : null),
                          height: 60,
                          width: 60,
                          margin: EdgeInsets.only(left: 20),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: idx == index ? primaryGreen : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: shadowList,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            index = idx;
                          });
                        },
                      ),
                      Container(
                        child: Text(categories[idx]['name']),
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 20, top: 10),
                      )
                    ],
                  );
                },
                itemCount: categories.length,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(index: index)));
                  },
                  child: Container(
                    height: 240,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey[300],
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: shadowList,
                                ),
                                margin: EdgeInsets.only(top: 50),
                              ),
                              Align(
                                child: Hero(
                                  tag: index,
                                  child: Image.asset(pets[index]),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 60, bottom: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                              boxShadow: shadowList,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: pets.length,
            )
          ],
        ),
      ),
    );
  }
}
