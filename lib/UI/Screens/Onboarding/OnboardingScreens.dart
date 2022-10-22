// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
//onBoarding is page

import 'package:dna_graduation/UI/Screens/BNB.dart';
import 'package:flutter/material.dart';
import 'package:dna_graduation/UI/Screens/Onboarding/OnboardingModels.dart';
import 'package:dna_graduation/UI/Screens/Onboarding/Slide.dart';
import 'package:dna_graduation/UI/Screens/Onboarding/Dot.dart';

class onBoarding extends StatefulWidget {
  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  //activePage variable used to identify which page is active ATM
  int activePage = 0;
  PageController pageController = PageController(initialPage: 0);
  @override

  //build widget is used to draw the element on the screen (building the widget)
  Widget build(BuildContext context) {
    //the text needs the structure to edit it, if u dont use it the text will be ugly
    //the structure is called scafflold
    return Scaffold(
      //PageView.builder is useful to take a dynamic number of elements that we want to display
      //it will only show the elements that has passed to
        body: PageView.builder(
            controller:
            pageController, //PageView.builder takes the the count of the items that u want
            //in our case its the lenghth of our List of onBoarding
            //and an itex builder to make an index
            itemCount: onBoardingList.length,

            /*onPageChanged is used for identify which page is it RN, we passed to it index var and assigned it to activePage
                                              to make some changes on the dots */
            onPageChanged: (index) {
              //setState function used to redrdaw or recolor the dots, this function used in SFW to make sure the change will happen
              setState(() {
                activePage = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Spacer(),
                  Slide(
                      image: onBoardingList[index].image,
                      title: onBoardingList[index].title,
                      subtitle: onBoardingList[index].subtitle),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:

                    //creating a dynamic number of dots on the page, the number of dots is same as onBoardingList.length
                    List.generate(
                        onBoardingList.length,

                        //passed to dot two parameters, index and activePage
                            (index) => dot(
                          index: index,
                          activePage: activePage,
                        )),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(45.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, //background color
                        onPrimary: Colors.purple, //ripple color
                        textStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        fixedSize: Size(
                          MediaQuery.of(context).size.width,
                          50,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: BorderSide(color: Colors.purple)),
                      ),
                      onPressed: () {
                        if (activePage < onBoardingList.length - 1) {
                          pageController.animateToPage(activePage + 1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        } else {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => BNB()),
                                  (route) => false);
                        }
                      },
                      child: Text(
                        activePage == onBoardingList.length - 1
                            ? 'Start'
                            : 'Next',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      /*...*/
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => BNB()),
                              (route) => false);
                    },
                    child: Text(
                      "Skip",
                    ),
                  )
                ],
              );
            }

          //this method of adding slides is not prefered, cuz u might have 1000 images, you cant just reapeat that 100 times!
          //so we will use PageView.builder
          // children: [
          //   Slide(
          //       image: onBoardingList[0].image,
          //       subtitle: onBoardingList[0].title,
          //       title: onBoardingList[0].subtitle),
          //   Slide(
          //       image: onBoardingList[1].image,
          //       subtitle: onBoardingList[1].title,
          //       title: onBoardingList[1].subtitle),
          // ],
        ));
  }
}
