import 'package:alnamaa_charity/core/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOrphanes extends StatelessWidget {
  const MyOrphanes({key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
            toolbarHeight: 80,
            actions: [
              const CircleAvatar(
                child: Text("H"),
              ),
            ],
            backgroundColor: Colors.white,
            elevation: 2,
            title: Text(
              "أيتامي",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.cyan[600]),
            ),
            centerTitle: true,
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.backspace_outlined,
                  color: Colors.cyan[600],
                ))),
        body: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: 10, // number of ListTiles you want to display
            itemBuilder: (context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 150,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage("images/1.png"),
                                radius: 50,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text("$index")
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                      useSafeArea: true,
                                      context: context,
                                      builder: (context) => Dialog(
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  100,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  3,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text("إلغاء الكفالة"),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Icon(Icons
                                                            .warning_outlined),
                                                        Text(
                                                            "الرجاء ذكر السبب "),
                                                      ],
                                                    ),
                                                    TextFormFieldWidget(
                                                      label: "",
                                                      maxlines: 5,
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      children: [
                                                        ElevatedButton(
                                                            style: ElevatedButton
                                                                .styleFrom(
                                                                    backgroundColor:
                                                                        Colors
                                                                            .cyan),
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            child:
                                                                Text("رجوع")),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        ElevatedButton(
                                                          onPressed: () {},
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .red),
                                                          child: Text("تأكيد"),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ));
                                },
                                icon: Icon(Icons.delete),
                                tooltip: "حذف",
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.edit),
                                tooltip: "تعديل",
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              );
              //   return ListTile(
              //     leading: Container(
              //       child: CircleAvatar(
              //         backgroundImage: AssetImage("images/1.png"),
              //         radius: 100,
              //       ),
              //     ),
              //     title: Text("List Tile $index"),
              //     subtitle: Text("List SubTile $index"),
              //     trailing: IconButton(
              //         onPressed: () {
              //           showDialog(
              //               context: context,
              //               builder: ((context) {
              //                 return Dialog(
              //                   child: Row(
              //                     children: [
              //                       IconButton(
              //                           onPressed: () {}, icon: Icon(Icons.delete)),
              //                       IconButton(
              //                           onPressed: () {}, icon: Icon(Icons.edit))
              //                     ],
              //                   ),
              //                 );
              //               }));
              //         },
              //         icon: Icon(Icons.edit)),
              //   );
              // },
            }),
      ),
    );
  }
}
