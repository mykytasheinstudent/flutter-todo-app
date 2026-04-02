import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Components/navigator_widget.dart';
import 'package:todo_app/Components/task_card.dart';
import 'package:todo_app/Components/task_card_meta.dart';

const Color backgroundClr = Color(0xFFF5F8FF);

class TodoPage extends StatefulWidget{
  const TodoPage({super.key});

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

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

    Widget navigator = const NavigatorWidget(currentPage: "My Task");

    Widget content = Align(
          alignment: Alignment.topCenter,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1400),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 96 - 54 - 80,
              child: Row(
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFA1A3AB).withAlpha(63)),
                        borderRadius: BorderRadius.circular(14),
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

                        children: [
                          Expanded(
                            
                            child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "My Tasks",
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  ]
                                ),
                                SizedBox(height: 16),
                                TaskCard(
                                  title: "Attend Nischal’s Birthday Party",
                                  description: "Buy gifts on the way and pick up cake from the bakery. (6 PM | Fresh Elements).....",
                                  pictureName: 'assets/images/task_image.png',
                                  priority: "Moderate",
                                  status: "Not Started",
                                  createdOn: "20/06/2023",
                                  isSelected: true,
                                  rowsToDisplay: 4,
                                ),
                                const SizedBox(height: 12),
                                TaskCard(
                                  title: "Landing Page Design for TravelDays",
                                  description: "Get the work done by EOD and discuss with client before leaving. (4 PM | Meeting Room)",
                                  pictureName: 'assets/images/task_image.png',
                                  priority: "Moderate",
                                  status: "In Progress",
                                  createdOn: "20/06/2023",
                                  rowsToDisplay: 2,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 9,
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
                              children: [
                                Row(
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
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Submit Documents",
                                          style: TextStyle(
                                            fontFamily: "Inter",
                                            fontSize: 16,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                        SizedBox(height: 4,),
                                        TaskCardMeta(label: "Priority:", value: "Extreme", valueColor: Color(0xFFF21E1E),),
                                        TaskCardMeta(label: "Status:", value: "Not Started", valueColor: Color(0xFFF21E1E)),
                                        TaskCardMeta(label: "Created On:", value: "20/06/2023"),
                                      ],)
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
                                          TextSpan(text: 'Document Submission.\n', style: TextStyle(fontWeight: FontWeight.normal)),
                                          TextSpan(text: 'Objective: '),
                                          TextSpan(text: 'To submit required documents for something\n important.\n', style: TextStyle(fontWeight: FontWeight.normal)),
                                          TextSpan(text: 'Task Description: '),
                                          TextSpan(text: 'Review the list of documents required for \nsubmission and ensure all necessary documents are ready. \nOrganize the documents accordingly and scan them if \nphysical copies need to be submitted digitally. Rename the \nscanned files appropriately for easy identification and verify \nthe accepted file formats. Upload the documents securely to \nthe designated platform, double-check for accuracy, and \nobtain confirmation of successful submission. Follow up if \nnecessary to ensure proper processing.\n', style: TextStyle(fontWeight: FontWeight.normal)),
                                          TextSpan(text: 'Additional Notes: \n'),
                                          TextSpan(text: '• Ensure that the documents are authentic and up-to-date.\n', style: TextStyle(fontWeight: FontWeight.normal)),
                                          TextSpan(text: '• Maintain confidentiality and security of sensitive \ninformation during the submission process.\n', style: TextStyle(fontWeight: FontWeight.normal)),
                                          TextSpan(text: '• If there are specific guidelines or deadlines for \nsubmission, adhere to them diligently.\n', style: TextStyle(fontWeight: FontWeight.normal)),
                                          TextSpan(text: 'Deadline for Submission: '),
                                          TextSpan(text: 'End of Day.\n', style: TextStyle(fontWeight: FontWeight.normal)),
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