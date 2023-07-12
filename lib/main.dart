// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.dark;
  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile App 7Learn',
      theme: themeMode == ThemeMode.dark
          ? MyAppThemeConfig.dark().getTheme()
          : MyAppThemeConfig.light().getTheme(),
      home: HomePage(
        toggleThemeMode:() {
       print("toggleThemeMode");
         setState(() {
          if (themeMode == ThemeMode.dark) {
           themeMode =  ThemeMode.light;
          } else {
            themeMode = ThemeMode.dark;
          }
        });
      },),
    );
  }
}

class HomePage extends StatefulWidget {
   final Function toggleThemeMode;

   HomePage({super.key, required this.toggleThemeMode});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SkillType _skill = SkillType.photoShop;

  void updateSelectedSkill(SkillType skillType) {
    setState(() {
      this._skill = skillType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile App"),
        actions: [
          Icon(CupertinoIcons.chat_bubble),
          InkWell(
            onTap: () {
              widget.toggleThemeMode();
            },
            child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Icon(CupertinoIcons.ellipsis_vertical)),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 10),
              //image and title info about me
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 60,
                      width: 60,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child:
                              Image.asset("assets/images/profile_image.png"))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Amirreza Azarmjo",
                          style: Theme.of(context).textTheme.subtitle1),
                      SizedBox(height: 5),
                      Text("Mobile Developer and Computer technician",
                          style: Theme.of(context).textTheme.bodyText1),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          Icon(
                            CupertinoIcons.location_solid,
                            color: Theme.of(context).primaryColor,
                            size: 14,
                          ),
                          SizedBox(width: 3),
                          Text(
                            "Iran Ramsar",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                               
                          ),
                        ],
                      ),
                    ],
                  ),
                  Icon(
                    CupertinoIcons.heart,
                    color: Colors.red,
                  )
                ],
              ),
              //body more text about me
              SizedBox(height: 10),
              //body Text info about me
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.  ",
                style: Theme.of(context).textTheme.bodyText2,
              ),
              SizedBox(height: 10),
              //Divider1
              Divider(height: 10),
              SizedBox(height: 10),
              //Skills
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Text(
                      'Skills',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(width: 2),
                    Icon(
                      CupertinoIcons.chevron_down,
                      color: Colors.white,
                      size: 12,
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              //Icons Skills
              Center(
                child: Wrap(
                  direction: Axis.horizontal,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Skill(
                      type: SkillType.photoShop,
                      onTap: () {
                        updateSelectedSkill(SkillType.photoShop);
                      },
                      isActive: _skill == SkillType.photoShop,
                      title: 'Photoshop',
                      imagePath: 'assets/images/app_icon_01.png',
                      shadowColor: Colors.blueAccent,
                    ),
                    Skill(
                      type: SkillType.lightRoom,
                      onTap: () {
                        updateSelectedSkill(SkillType.lightRoom);
                      },
                      isActive: _skill == SkillType.lightRoom,
                      title: 'Lightroom',
                      imagePath: 'assets/images/app_icon_02.png',
                      shadowColor: Colors.blue,
                    ),
                    Skill(
                      type: SkillType.afterEffect,
                      onTap: () {
                        updateSelectedSkill(SkillType.afterEffect);
                      },
                      isActive: _skill == SkillType.afterEffect,
                      title: 'After Effect',
                      imagePath: 'assets/images/app_icon_03.png',
                      shadowColor: Colors.deepPurpleAccent,
                    ),
                    Skill(
                      type: SkillType.illustrator,
                      onTap: () {
                        updateSelectedSkill(SkillType.illustrator);
                      },
                      isActive: _skill == SkillType.illustrator,
                      title: 'Illustrator',
                      imagePath: 'assets/images/app_icon_04.png',
                      shadowColor: Colors.red,
                    ),
                    Skill(
                      type: SkillType.xd,
                      onTap: () {
                        updateSelectedSkill(SkillType.xd);
                      },
                      isActive: _skill == SkillType.xd,
                      title: 'Adobe XD',
                      imagePath: 'assets/images/app_icon_05.png',
                      shadowColor: Colors.pink,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              //Divider2
              Divider(height: 10),
              SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Personal Information',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.copyWith(fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(CupertinoIcons.at),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: Icon(CupertinoIcons.lock),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () {}, child: Text('Save')))
            ],
          ),
        ),
      ),
    );
  }
}

enum SkillType {
  photoShop,
  xd,
  illustrator,
  afterEffect,
  lightRoom,
}

class Skill extends StatelessWidget {
  //attributes
  final String title;
  final String imagePath;
  final Color shadowColor;
  final bool isActive;
  final SkillType type;
  final Function() onTap;
  //constructor
  const Skill({
    required this.onTap,
    required this.type,
    required this.title,
    required this.imagePath,
    required this.isActive,
    required this.shadowColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Container(
        width: 90,
        height: 90,
        decoration: isActive
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0x0dffffff))
            : null,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: isActive
                  ? BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: shadowColor.withOpacity(0.5),
                          blurRadius: 15,
                        )
                      ],
                    )
                  : null,
              child: Image.asset(
                imagePath,
                width: 40,
                height: 40,
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
            )
          ],
        ),
      ),
    );
  }
}

class MyAppThemeConfig {
  final Color primaryTextColor;
  final Color secondaryTextColor;
  final Color surfaceColor;
  final Color backgroundColor;
  final Color appBarColor;
  final primaryColor = Colors.pink.shade400;
  final Brightness brightness;

  MyAppThemeConfig.dark()
      : primaryTextColor = Colors.white,
        secondaryTextColor = Colors.white70,
        surfaceColor = Color(0x0dffffff),
        backgroundColor = Color.fromARGB(255, 30, 30, 30),
        appBarColor = Colors.black,
        brightness = Brightness.dark;

  MyAppThemeConfig.light()
      : primaryTextColor = Colors.black,
        secondaryTextColor =Colors.black,
        surfaceColor = Color(0x0d000000),
        backgroundColor = Colors.white,
        appBarColor = Color.fromARGB(255, 235, 235, 235),
        brightness = Brightness.light;

  ThemeData getTheme() {
    return ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: surfaceColor,
        ),
        primarySwatch: Colors.pink,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(primaryColor),
          ),
        ),
        brightness: brightness,
        
        dividerTheme: DividerThemeData(
          color: surfaceColor,
          indent: 20,
          thickness: 1,
          endIndent: 20,
        ),
        appBarTheme: AppBarTheme(backgroundColor: appBarColor),
        scaffoldBackgroundColor: backgroundColor,
        textTheme: GoogleFonts.latoTextTheme(
          TextTheme(
            bodyText2: TextStyle(fontSize: 14, color: primaryTextColor),
            bodyText1: TextStyle(
              fontSize: 12,
              color: secondaryTextColor,
            ),
            headline6:
                TextStyle(fontWeight: FontWeight.w900, color: primaryTextColor),
            subtitle1: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: primaryTextColor),
          ),
        ));
  }
}

