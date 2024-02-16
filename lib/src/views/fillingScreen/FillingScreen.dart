import 'package:cv_ez/src/blocs/bloc_barrel.dart';
import 'package:flutter/material.dart';
import 'Containers/Containers.dart';

class FillingScreen extends StatefulWidget {
  static const String routeName = "/fillingScreen";

  @override
  _FillingScreenState createState() => _FillingScreenState();
}

class _FillingScreenState extends State<FillingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FillingScreenBloc(),
      child: BlocConsumer<FillingScreenBloc, FillingScreenState>(
          listener: (context, state) {},
          builder: (context, state) {
            FillingScreenBloc bloc =
                BlocProvider.of<FillingScreenBloc>(context);
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.blue,
                title: const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "CV-ez",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontFamily: "Outfit"),
                  ),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.menu,
                      size: 25,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              body: Column(
                children: [
                  _buildIconRow(bloc),
                  _buildPageView(bloc),
                ],
              ),
            );
          }),
    );
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
      height: 70,
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
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                bloc.currentPageIndex == index
                    ? iconsSelected[index]
                    : iconsUnselected[index],
                size: 45,
                color:
                    bloc.currentPageIndex == index ? Colors.blue : Colors.grey,
              ),
            ),
          );
        },
      ),
    );
  }
}
