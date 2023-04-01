import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:admin/shared/components/1Tooles/5Custom_Navigate.dart';

import '../../../business_logic/1Choose_Type/Choose_Type_Cubit.dart';
import '../../../business_logic/1Choose_Type/Choose_Type_State.dart';
import '../../widgets/Test/test.dart';
import '../3Types/1News/News_Home.dart';
import '../3Types/2Learn/Learn_Home.dart';
import '../3Types/3Quiz/Quiz_Home.dart';
import '../3Types/4Choose_Subject/Choose_Subject.dart';
import '../3Types/5Add_Users/Add_User_Home.dart';
import '../3Types/5Add_Users/Show_Users_Home.dart';

class ChangeTypeScreen extends StatelessWidget {
  const ChangeTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CarouselController _carouselController = new CarouselController();
    return BlocProvider(
      create: (context) => Choose_Type_Cubit(),
      child: BlocBuilder<Choose_Type_Cubit, Choose_Type_States>(
        builder: (context, state) {
          Choose_Type_Cubit cubit = Choose_Type_Cubit.get(context);

          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text(
                '@eldaheeh',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              child: CarouselSlider(
                  carouselController: _carouselController,
                  options: CarouselOptions(
                      height: 400.0,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.70,
                      enlargeCenterPage: true,
                      pageSnapping: true,
                      onPageChanged: (index, reason) {
                        cubit.changeCardIndex(index);
                      }),
                  items: cubit.Type_Content.map((type) {
                    return Builder(
                      builder: (BuildContext context) {
                        return GestureDetector(
                          onTap: () {
                            switch (cubit.current) {
                              case 0:
                                navigateTo(context, News_Home_Screen());
                                break;
                              case 1:
                                navigateTo(
                                    context,
                                    Choose_Subject(
                                      Next: "Learn",
                                    ));
                                // Choose_Subject());
                                break;
                              case 2:
                                navigateTo(
                                    context, Choose_Subject(Next: "Quiz"));
                                // context,
                                // Choose_Subject());

                                break;
                              case 3:
                                navigateTo(context, Show_Users_Screen());
                                // context,
                                // Choose_Subject());

                                break;
                            }
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    color: Colors.red.withOpacity(0.2),
                                    width: 1),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.red.withOpacity(0.2),
                                      blurRadius: 20,
                                      offset: Offset(0, 5))
                                ]),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    height: 320,
                                    margin: EdgeInsets.only(top: 10),
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: Image(
                                        image:
                                            cubit.Type_Images[cubit.current]),
                                    //   child: Image.network(movie['image'],
                                    //       fit: BoxFit.cover),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    type['title'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    type['description'],
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey.shade600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList()),
            ),
          );
        },
      ),
    );
  }
}
