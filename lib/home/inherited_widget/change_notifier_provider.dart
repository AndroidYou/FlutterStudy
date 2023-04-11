import 'package:flutter/cupertino.dart';
import 'package:flutterstudy/home/inherited_widget/inherited_provider.dart';

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget{
    const ChangeNotifierProvider({super.key, required this.data, required this.child});
  final Widget child;
  final T data;


  static T of<T>(BuildContext context,bool listen){
    final type = _typeOf<InheritedProvider<T>>();
    print("object:${type}");
    var provider =context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>();
     //  :
   // (context.getElementForInheritedWidgetOfExactType<InheritedProvider<T>>() ==null? null:(context.getElementForInheritedWidgetOfExactType<InheritedProvider<T>>()!.widget  as InheritedProvider<T>));
    print("object:${provider}");
    return provider!.data;

  }
  static Type _typeOf<T>() =>T;

  @override
  State<StatefulWidget> createState() =>_ChangeNotifierProviderState();
}
class _ChangeNotifierProviderState<T extends ChangeNotifier> extends State<ChangeNotifierProvider>{
  void update(){
    setState(() {
    });
  }
  @override
  void didUpdateWidget(covariant ChangeNotifierProvider<ChangeNotifier> oldWidget) {
     if(oldWidget.data != widget.data){
       oldWidget.data.removeListener(update);
       widget.data.addListener(update);
     }
     super.didUpdateWidget(oldWidget);
  }
  @override
  void initState() {
    print("object:${widget.data}");
    widget.data.addListener(update);
    super.initState();
  }
  @override
  void dispose() {
    widget.data.removeListener(update);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return InheritedProvider(data: widget.data, child: widget.child);
  }

}