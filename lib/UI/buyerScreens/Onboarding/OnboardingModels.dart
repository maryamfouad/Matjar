class onBoarding0 {
  String image;
  String title;
  String subtitle;
  onBoarding0({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

final onBoardingList = [
  //created list of onBoarding object above, its not hardcoded anymore !!
  onBoarding0(
      image: 'images/1.jpg',
      title: 'We Welcome You to Matjar ',
      subtitle: 'where you can find anything you\'d need'),
  onBoarding0(
      image: 'images/2.jpg',
      title: 'Buy Anything You Like',
      subtitle: 'all of the products made with love'),

  onBoarding0(
      image: 'images/3.jpg',
      title: 'Stunning Offers',
      subtitle: 'our Offers and prices are very catchy '),

  onBoarding0(
      image: 'images/4.jpg',
      title: 'Reilable Deleviry ',
      subtitle: 'we will get to you in no time, with one delivery price!'),
];
