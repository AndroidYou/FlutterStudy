import 'package:flutter/cupertino.dart';

class TurnBox extends StatefulWidget{
  const TurnBox({super.key,this.turns = 0,this.speed =200,required this.child,this.onTap});
  final double turns;
  final int speed;
  final Widget child;
  final GestureTapCallback? onTap;

  @override
  State<StatefulWidget> createState()=>_TurnBoxState();

}
class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(vsync: this,lowerBound: -1,upperBound: 1,duration: const Duration(milliseconds: 1000));
    //_controller.value = widget.turns;
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   return RotationTransition(turns: _controller,child: GestureDetector(
     onTap: (){
       _controller.reset();
       _controller.forward();
     },
     child: widget.child,
   ),);
  }
  @override
  void didUpdateWidget(covariant TurnBox oldWidget) {
    if(oldWidget.turns != widget.turns){
      _controller.animateTo(widget.turns,duration:Duration(milliseconds: widget.speed??200),curve: Curves.easeOut);
    }
    super.didUpdateWidget(oldWidget);
  }

}