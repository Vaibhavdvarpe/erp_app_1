import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AccountMaster extends StatefulWidget {
  const AccountMaster({Key? key}) : super(key: key);

  @override
  State<AccountMaster> createState() => _AccountMasterState();
}

class _AccountMasterState extends State<AccountMaster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 90,
        // leading: ,
        title: const Text(
          "Account Master",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),

        leadingWidth: 108,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Row(
              children: [
                // Icon(Icons.arrow_back_ios),
                Text("<",
                    style:
                        TextStyle(fontSize: 27, fontWeight: FontWeight.w500)),
                Text("Back",
                    style:
                        TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
              ],
            ),
            style: ElevatedButton.styleFrom(
                elevation: 0, primary: Color.fromRGBO(35, 133, 59, 1)),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: 35,
                  width: 80,
                  color: Colors.white,
                  child: Center(
                    child: Row(
                      children: [
                        Icon(
                          Icons.person_outlined,
                          color: Color.fromRGBO(35, 133, 59, 1),
                        ),
                        Text("I ",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(35, 133, 59, 1))),
                        Text("Add",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(35, 133, 59, 1))),
                      ],
                    ),
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                  elevation: 0, primary: Color.fromRGBO(35, 133, 59, 1)),
            ),
          ),
        ],
        titleSpacing: 20,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                padding: EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      color: Color.fromARGB(255, 232, 232, 232),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)),
                      elevation: 0.5,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sr. No. 10622",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(35, 133, 59, 1)),
                                ),
                                TextButton(
                                    onPressed: () {
                                      // Navigator.pop(context);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.edit_note,
                                          color: Color.fromRGBO(35, 133, 59, 1),
                                        ),
                                        // Text(
                                        //   "I",
                                        //   style: TextStyle(
                                        //       color: Color.fromRGBO(35, 133, 59, 1),
                                        //       fontSize: 20),
                                        // ),
                                        Text(
                                          "Edit",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  35, 133, 59, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                            Text("21st Century Fashions Pvt. Ltd.",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                            HeightBox(5),
                            Text("24AABCT3036B1Z0",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                            HeightBox(5),
                            Text("525-25, Adarsh Market-1, Ring Road",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                            HeightBox(10),
                            Divider(
                              thickness: 0.5,
                              color: Color.fromRGBO(35, 133, 59, 1),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.phone_in_talk,
                                      color: Color.fromRGBO(35, 133, 59, 1),
                                      size: 24,
                                    ),
                                    Text(
                                      "+91 99014 94330",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                TextButton(
                                    onPressed: () {
                                      // Navigator.pop(context);
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.circle_sharp,
                                          color: Color.fromRGBO(35, 133, 59, 1),
                                          size: 15,
                                        ),
                                        WidthBox(4),
                                        // Text(
                                        //   "I",
                                        //   style: TextStyle(
                                        //       color: Color.fromRGBO(35, 133, 59, 1),
                                        //       fontSize: 20),
                                        // ),
                                        Text(
                                          "Active",
                                          style: TextStyle(
                                              color: Color.fromRGBO(
                                                  35, 133, 59, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
