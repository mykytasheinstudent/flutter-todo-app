import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../Components/navigator_widget.dart';
import '../Components/task_card.dart';
import 'package:easy_pie_chart/easy_pie_chart.dart';

const Color backgroundClr = Color(0xFFF5F8FF);

class DashboardPage extends StatefulWidget{
  const DashboardPage({super.key});
  

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  Widget _buildChartCircle({
    required double score,
    required String label, 
    required Color color
  }) {
    
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: EasyPieChart(
              pieType: PieType.crust,
              size: 100,
              centerText: "$score%",
              centerStyle: TextStyle(
                fontFamily: "Inter",
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),
              shouldAnimate: false,
              start: 0,
              showValue: false,
              children: [
                PieData(value: score, color: color),
                PieData(value: 100 - score, color: const Color(0xFFD9D9D9))
              ]
            )
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.circle, size: 10, color: color),
              SizedBox(width: 8,),
              Text(
                label,
                style: const TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: Color(0xFF192252),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = !kIsWeb && (Platform.isAndroid || Platform.isIOS);

    Widget navigator = const NavigatorWidget(currentPage: "Dashboard");

    Widget contentMain = Column(
      children: [
        Row(
          children:[
            Text(
              "Welcome back, Mykyta",
              style:TextStyle(
                fontFamily: "Montserrat",
                fontSize: 36,
                fontWeight: FontWeight.w600
              )
            ),
            SizedBox(width: 12,),
            Image.asset('assets/images/waving_hand_icon.png', width: 42, height: 42,),
            Spacer(),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/task_image.png',
                    width: 36,
                    height: 36,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 8,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/task_image.png',
                    width: 36,
                    height: 36,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 8,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/task_image.png',
                    width: 36,
                    height: 36,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 8,),
                SizedBox(
                  width: 36,
                  height: 36,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/task_image.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha(120),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            '+4',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Inter',
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 12,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFFFF9090),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                    minimumSize: const Size(100, 44),
                  ),
                  onPressed: (){}, 
                  child: Row(
                    children: [
                      Icon(Icons.person_add),
                      SizedBox(width: 4,),
                      Text("Invite")
                    ],
                  )
                )
              ],
            )
          ]
        ),
        SizedBox(height: 36,),
        Center(
          child: Container(
            padding: const EdgeInsets.all(26.0),
            decoration: BoxDecoration(
              border: BoxBorder.all(color: const Color(0xFFA1A3AB).withAlpha(63))
            ),
            child: SizedBox(
              height: 761,
              child: Row(
                children: [
                  Expanded(
                    
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFF5F8FF)),
                        borderRadius: BorderRadius.circular(14),
                        color: backgroundClr,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withAlpha(25),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(4,4)
                          )
                        ]
                      ),
                      child: 
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 28,
                                child: Image.asset("assets/images/task_icon.png",),
                              ),
                              SizedBox(width: 4,),
                              const Text(
                                "To-Do",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFFFF6767),
                                ),
                              ),
                              const Spacer(),
                              ElevatedButton.icon(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: backgroundClr,
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 10,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                icon: const Icon(Icons.add, size: 18, color:  Color(0xFFFF6767),),
                                label: const Text("Add Task"),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text("20 June", style: TextStyle(color: const Color(0xFF000000),fontFamily: "Inter", fontSize: 12)),
                              SizedBox(width: 8,),
                              Icon(Icons.circle, size: 7, color: const Color(0xFFA1A3AB)),
                              SizedBox(width: 4,),
                              Text("Today", style: TextStyle(color: const Color(0xFFA1A3AB),fontFamily: "Inter", fontSize: 12)),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Expanded(
                            child: Column(
                              children: [
                                TaskCard(
                                  title: "Attend Nischal’s Birthday Party",
                                  description: "Buy gifts on the way and pick up cake from the bakery. (6 PM | Fresh Elements).....",
                                  pictureName: 'assets/images/task_image.png',
                                  priority: "Moderate",
                                  status: "Not Started",
                                  createdOn: "20/06/2023",
                                ),
                                const SizedBox(height: 12),
                                TaskCard(
                                  title: "Landing Page Design for TravelDays",
                                  description: "Get the work done by EOD and discuss with client before leaving. (4 PM | Meeting Room)",
                                  pictureName: 'assets/images/task_image.png',
                                  priority: "Moderate",
                                  status: "In Progress",
                                  createdOn: "20/06/2023",
                                ),
                                const SizedBox(height: 12),
                                TaskCard(
                                  title: "Presentation on Final Product",
                                  description: "Make sure everything is functioning and all the necessities are properly met. Prepare the team and get the documents ready for...",
                                  pictureName: 'assets/images/task_image.png',
                                  priority: "Moderate",
                                  status: "In Progress",
                                  createdOn: "19/06/2023",
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
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFFF5F8FF)),
                              borderRadius: BorderRadius.circular(14),
                              color: backgroundClr,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(25),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: const Offset(4,4)
                                )
                              ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 28,
                                      child: Image.asset("assets/images/task_stats_icon.png",),
                                    ),
                                    SizedBox(width: 4,),
                                    const Text(
                                      "Task Status",
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFFF6767),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    _buildChartCircle(
                                      score: 84,
                                      label: "Completed",
                                      color: const Color(0xFF05A301),
                                    ),
                                    _buildChartCircle(
                                      score: 46,
                                      label: "In Progress",
                                      color: const Color(0xFF0225FF),
                                    ),
                                    _buildChartCircle(
                                      score: 13,
                                      label: "Not started",
                                      color: const Color(0xFFF21E1E),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Expanded(
                          flex: 2,
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(color: const Color(0xFFF5F8FF)),
                              borderRadius: BorderRadius.circular(14),
                              color: backgroundClr,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withAlpha(25),
                                  spreadRadius: 2,
                                  blurRadius: 8,
                                  offset: const Offset(4,4)
                                )
                              ]
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 28,
                                      child: Image.asset("assets/images/task_completed_icon.png",),
                                    ),
                                    SizedBox(width: 8,),
                                    const Text(
                                      "Completed tasks",
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFFF6767),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                TaskCard(
                                  title: "Walk the dog",
                                  description: "Take the dog to the park and bring treats as well.",
                                  pictureName: 'assets/images/task_image.png',
                                  priority: "High",
                                  status: "Completed",
                                  createdOn: "2 days ago",
                                ),
                                const SizedBox(height: 12),
                                TaskCard(
                                  title: "Conduct meeting",
                                  description: "Meet with the client and finalize requirements.",
                                  pictureName: 'assets/images/task_image.png',
                                  priority: "Low",
                                  status: "Completed",
                                  createdOn: "2 days ago",
                                ),
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
        ),
      ],
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
          ? contentMain
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
                        child: contentMain,
                      ),
                  )
                ),
              ],
            ),
      ),
    );
  }
}