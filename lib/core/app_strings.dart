import 'dart:math';

class AppStrings {

  static String leftArrow='assets/icons/left_arrow.svg';
  static String rightArrow='assets/icons/right_arrow.svg';


  static List<String> carouselImageList = [
    'https://images.unsplash.com/photo-1490730141103-6cac27aaab94?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZnJlZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1499084732479-de2c02d45fcc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTAxfHxmcmVlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1532983330958-4b32bbe9bb0e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGZyZWV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    'https://images.unsplash.com/photo-1418489098061-ce87b5dc3aee?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fGZyZWV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
    'https://plus.unsplash.com/premium_photo-1669497496791-67b873997e13?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8ODV8fGZyZWV8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60',
  ];


  static  String generateRandomString(int lengthOfString){
    final random = Random();
    const allChars='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    // below statement will generate a random string of length using the characters
    // and length provided to it
    final randomString = List.generate(lengthOfString,
            (index) => allChars[random.nextInt(allChars.length)]).join();
    return randomString;    // return the generated string
  }
}