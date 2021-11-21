import 'package:flutter/material.dart';

class TestStage extends StatelessWidget {
  const TestStage({Key? key}) : super(key: key);
  static String id = "Settings";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Card(
          color: Colors.grey[300],
          child: Container(
              height: 600,
              margin: EdgeInsets.all(30),
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
                  Text(
                    '1 - Product Discovery ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    'Introduction',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                      'As defined by Mixpanel, product discovery is a method of deeply understanding your customers to develop products that perfectly suit their needs. It is a critical stage in the product design process because If companies do not accurately prove or disprove their assumptions about their customers, they may waste time building products that nobody needs. You will get tools for interacting with your potential customers and users in order to recognize their problems, helping you to improve your idea.'),
                  Spacer(),
                  Text(
                    'Learning Resources',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                  Spacer(),
                  Row(
                    children: [
                      InkWell(
                        //on hover
                        child: Container(
                          margin: EdgeInsets.only(right: 30),
                          child: Icon(
                            Icons.file_copy_outlined,
                            size: 60,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 30),
                        child: Icon(
                          Icons.file_copy_outlined,
                          size: 60,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 30),
                        child: Icon(
                          Icons.file_copy_outlined,
                          size: 60,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 30),
                        child: Icon(
                          Icons.file_copy_outlined,
                          size: 60,
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
