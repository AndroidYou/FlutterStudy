import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget{
  const CommonButton({super.key, required this.text,required this.onPressed});
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
       const SizedBox(
         height: 20,
       ),
       SizedBox(
         width: 200,
         height: 40,
         child: ElevatedButton(
           onPressed: onPressed,
           child:  Text(text),
         ),
       )
     ],
   );
  }
}