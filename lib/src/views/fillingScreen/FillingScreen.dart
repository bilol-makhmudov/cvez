import 'package:cv_ez/src/blocs/bloc_barrel.dart';
import 'package:flutter/material.dart';
import '../../templates/template1/template1.dart';
import '../contactScreen/ContactScreen.dart';
import 'Containers/Containers.dart';

class FillingScreen extends StatefulWidget {
  static const String routeName = "/fillingScreen";

  @override
  _FillingScreenState createState() => _FillingScreenState();
}

class _FillingScreenState extends State<FillingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FillingScreenBloc, FillingScreenState>(
        builder: (context, state) {
      FillingScreenBloc bloc = BlocProvider.of<FillingScreenBloc>(context);
      PersonalInfoBloc personalInfoBloc =
          BlocProvider.of<PersonalInfoBloc>(context);
      EducationBloc educationBloc = BlocProvider.of<EducationBloc>(context);
      ExperienceBloc experienceBloc = BlocProvider.of<ExperienceBloc>(context);
      SkillBloc skillBloc = BlocProvider.of<SkillBloc>(context);

      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "CV-ez",
              style: TextStyle(
                  color: Colors.white, fontSize: 30, fontFamily: "Outfit"),
            ),
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: (click) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ContactScreen(),
                  ),
                );
              },
              itemBuilder: (BuildContext context) {
                return {
                  'Contact',
                }.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: Column(
          children: [
            _buildIconRow(bloc),
            _buildPageView(bloc),
            InkWell(
              onTap: (() async {
                if (bloc.currentPageIndex == pages.length - 1) {
                  await generateTemplate1(personalInfoBloc, educationBloc,
                      experienceBloc, skillBloc, context);
                } else {
                  bloc.add(NextPage());
                }
              }),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5)),
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "Next step",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Expanded _buildPageView(FillingScreenBloc bloc) {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      child: PageView.builder(
        controller: bloc.pageController,
        onPageChanged: (index) => bloc.add(PageIndicatorChanged(width, index)),
        itemBuilder: (BuildContext context, int index) => pages[index],
        itemCount: pages.length,
      ),
    );
  }

  SizedBox _buildIconRow(FillingScreenBloc bloc) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        controller: bloc.iconScrollController,
        scrollDirection: Axis.horizontal,
        itemCount: iconsUnselected.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              bloc.add(PageTapped(index));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Icon(
                    bloc.currentPageIndex == index
                        ? iconsSelected[index]
                        : iconsUnselected[index],
                    size: 45,
                    color: bloc.currentPageIndex == index
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(pageNames[index]),
                  ),
                  bloc.currentPageIndex == index
                      ? Container(height: 2, width: 45, color: Colors.blue)
                      : SizedBox()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
