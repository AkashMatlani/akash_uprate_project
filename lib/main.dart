import 'package:akash_uprate_project/constant.dart';
import 'package:akash_uprate_project/util/colors.dart';
import 'package:akash_uprate_project/widgets/CommentBox.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WeeklyComments(),
      ),
    );
  }
}

class WeeklyComments extends StatefulWidget {
  const WeeklyComments({super.key});

  @override
  State<WeeklyComments> createState() => _WeeklyCommentsState();
}

class _WeeklyCommentsState extends State<WeeklyComments> {
  bool? isShow = false;
  TextEditingController controller= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: constraints.maxHeight * .4 + 70, //70 for bottom
                child: Stack(
                  children: [
                    Positioned(
                        top: 0,
                        bottom: 70,
                        left: 0,
                        right: 0,
                        child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Card(
                              color: const Color.fromRGBO(255, 255, 255, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 60,
                                            right: 20,
                                            top: 30,
                                            bottom: 10),
                                        child: Text(
                                          'Weekly Comments',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontFamily: 'Montserrat',
                                              color: grayColor),
                                        ),
                                      ),
                                      const Spacer(),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 60,
                                              top: 30,
                                              bottom: 10),
                                          child: Text(
                                            'This Week',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Montserrat',
                                              color: purpleColor,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          )),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: days
                                        .map(
                                          (day) => Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                if (kDebugMode) {
                                                  print(day);
                                                  isShow = true;
                                                }
                                                setState(() {});
                                              },
                                              child: Column(
                                                children: [
                                                  Center(
                                                    child: Container(
                                                      width: 100,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 24.0,
                                                          vertical: 8.0),
                                                      decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromRGBO(
                                                            250, 250, 250, 1),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                8.0), // Rounded corners
                                                      ),
                                                      child: Text(
                                                        day,
                                                        style: TextStyle(
                                                          color: Colors
                                                              .grey.shade800,
                                                          fontSize: 18.0,
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight: FontWeight
                                                              .w600, // Normal weight for the font
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const CommentBox(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ],
                              ),
                            ))),
                    isShow != null && isShow!
                        ? Visibility(
                            visible: isShow!,
                            child: Positioned(
                                top: 80,
                                height: 300,
                                left: 200,
                                right: 10,
                                child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Container(
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  "Add Comment",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Montserrat',
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    isShow = false;
                                                    setState(() {});
                                                  },
                                                  child: Icon(
                                                    Icons.close,
                                                    color: Colors.grey[500],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 16),
                                            TextField(
                                              controller: controller,
                                              maxLines: 4,
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  borderSide: BorderSide(
                                                    color: Colors.grey[300]!,
                                                  ),
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.all(12),
                                              ),
                                            ),
                                            const SizedBox(height: 16),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: ElevatedButton.icon(
                                                onPressed: () {
                                                  isShow = false;
                                                  setState(() {});
                                                },
                                                icon: const Icon(Icons.send,color: Colors.white,),
                                                label: const Text("Post",style: TextStyle(color: Colors.white),),
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:  const Color(0xFFAE99DB),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )))))
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
