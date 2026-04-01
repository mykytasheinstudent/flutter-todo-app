import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Components/navigator_widget.dart';
import 'package:todo_app/Components/task_card_meta.dart';

const Color backgroundClr = Color(0xFFF5F8FF);

class ViewTaskPage extends StatefulWidget{
  const ViewTaskPage({super.key});

  @override
  _ViewTaskPageState createState() => _ViewTaskPageState();
}

class _ViewTaskPageState extends State<ViewTaskPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    bool isMobile = !kIsWeb && (Platform.isAndroid || Platform.isIOS);

    Widget navigator = const NavigatorWidget(currentPage: "View Task");

    Widget content = Align(
          alignment: Alignment.topCenter,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1400),
            // padding: const EdgeInsets.all(26.0),
            // padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
            // decoration: BoxDecoration(
              // border: BoxBorder.all(color: const Color(0xFFA1A3AB).withAlpha(63))
            // ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 96 - 54 - 80,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFFA1A3AB).withAlpha(63)),
                              borderRadius: BorderRadius.circular(16),
                              color: backgroundClr,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(25),
                                  spreadRadius: 2,
                                  blurRadius: 1,
                                  offset: const Offset(1,1)
                                )
                              ]
                            ),
                            child: Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(14),
                                      child: Image.asset(
                                        'assets/images/task_image.png',
                                        width: 158,
                                        height: 158,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 12,),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Submit Documents",
                                            style: TextStyle(
                                              fontFamily: "Inter",
                                              fontSize: 24,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          SizedBox(height: 4,),
                                          TaskCardMeta(label: "Priority:", value: "Extreme", valueColor: Color(0xFFF21E1E),),
                                          TaskCardMeta(label: "Status:", value: "Not Started", valueColor: Color(0xFFF21E1E)),
                                          TaskCardMeta(label: "Created On:", value: "20/06/2023"),
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 12),
                                    TextButton(
                                      onPressed: () {},
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        minimumSize: Size(0, 0),
                                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      child: Text(
                                        "Go Back",
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                          decoration: TextDecoration.underline,
                                          color: const Color(0xFF000000),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height:16),
                                Row(
                                  children:[
                                    RichText(
                                      text: TextSpan(
                                        text: 'Task Title: ',
                                        style: TextStyle(
                                          fontSize: 16, 
                                          fontWeight: FontWeight.bold, 
                                          fontFamily: "Inter", 
                                          letterSpacing: 0.8,
                                          wordSpacing: 0.8,
                                          color: const Color(0xFF747474)
                                        ),
                                        children: const <TextSpan>[
                                          TextSpan(text: 'Document Submission.\n\n', style: TextStyle(fontWeight: FontWeight.normal)),
                                          TextSpan(text: 'Objective: '),
                                          TextSpan(text: 'To submit required documents for something important.\n\n', style: TextStyle(fontWeight: FontWeight.normal)),
                                          TextSpan(text: 'Task Description: '),
                                          TextSpan(text: 'Review the list of documents required for submission and ensure all necessary documents are ready. \nOrganize the documents accordingly and scan them if physical copies need to be submitted digitally. Rename the \nscanned files appropriately for easy identification and verify the accepted file formats. Upload the documents securely to \nthe designated platform, double-check for accuracy, and obtain confirmation of successful submission. Follow up if \nnecessary to ensure proper processing.\n\n', style: TextStyle(fontWeight: FontWeight.normal)),
                                          TextSpan(text: 'Additional Notes: \n\n'),
                                          TextSpan(text: '• Ensure that the documents are authentic and up-to-date.\n\n', style: TextStyle(fontWeight: FontWeight.normal)),
                                          TextSpan(text: '• Maintain confidentiality and security of sensitive \ninformation during the submission process.\n\n', style: TextStyle(fontWeight: FontWeight.normal)),
                                          TextSpan(text: '• If there are specific guidelines or deadlines for \nsubmission, adhere to them diligently.\n\n', style: TextStyle(fontWeight: FontWeight.normal)),
                                          TextSpan(text: 'Deadline for Submission: '),
                                          TextSpan(text: 'End of Day.\n\n', style: TextStyle(fontWeight: FontWeight.normal)),
                                        ],
                                      ),
                                    )
                                  ]
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Spacer(),
                                    SizedBox(
                                      height: 52,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFFFF6767),
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          elevation: 0,
                                        ),
                                        child: const Icon(Icons.delete, ),
                                      ),
                                    ),
                                    SizedBox(width: 12,),
                                    SizedBox(
                                      height: 52,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFFFF6767),
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          elevation: 0,
                                        ),
                                        child: const Icon(Icons.edit,),
                                      ),
                                    ),
                                    SizedBox(width: 12,),
                                    SizedBox(
                                      height: 52,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFFFF6767),
                                          foregroundColor: Colors.white,
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                          elevation: 0,
                                        ),
                                        child: const Icon(Icons.priority_high,),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  
    return Scaffold(
      backgroundColor: backgroundClr,
      appBar: AppBar(
        backgroundColor: Color(0xFFF8F8F8),
        shadowColor: Colors.black54,
        surfaceTintColor: Colors.transparent,
        elevation: 6,
        automaticallyImplyLeading: false,
        toolbarHeight: 96,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Row(
            children: [
              Image.asset(
                'assets/images/dashboard_logo.png',
                width: 169,
                // height: 44,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 120),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(25),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: const Offset(1, 1),
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search your task here...',
                            hintStyle: const TextStyle(
                              fontFamily: "Montserrat",
                              color: Color(0xFF848FAC),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF7F9FC),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(width: 12),
                    SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF6767),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Icon(Icons.search),
                      ),
                    ),
                  ],
                ),
              ),
              // Spacer(),
              const SizedBox(width: 120),
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6767),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Icon(Icons.notifications_none),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6767),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Icon(Icons.calendar_month_outlined),
                ),
              ),
              const SizedBox(width: 120),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    'Tuesday',
                    style: TextStyle(
                      color: Color(0xFF192252),
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '31/03/2026',
                    style: TextStyle(
                      color: Color(0xFF3ABEFF),
                      fontFamily: "Montserrat",
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 12, 24, 0),
        child: isMobile
          ? content
          : Row(
              children: [
                Expanded(
                  flex: 1,
                  child: navigator,
                ),
                const SizedBox(width: 24),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child:
                      SingleChildScrollView(
                        child: content,
                      ),
                  )
                ),
              ],
            ),
      ),
    );
  }
}