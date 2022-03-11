import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rasan_flutter_assessment/domain/cubit/form_cubit.dart';
import 'package:rasan_flutter_assessment/presentation/new_screen.dart';

class ColorFormUi extends StatefulWidget {
  const ColorFormUi({Key? key}) : super(key: key);

  @override
  _ColorFormUiState createState() => _ColorFormUiState();
}

class _ColorFormUiState extends State<ColorFormUi> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _text4Controller = TextEditingController();
  TextEditingController _text2Controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<FormCubit>().loadSuggestData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 32,horizontal: 16),
         children: [
           Form(
             key: _formKey,
             child: BlocBuilder<FormCubit, ColorFormState>(
               builder: (context, state) {
                 if(state is FormInitial){
                   _text4Controller.text=state.textForm4Value;
                   return Column(
                     children: [
                       // this for validation 5<char<=9 & only text
                       TextFormField(
                         key:const Key("TextFormField1"),
                         onChanged: (value){
                           context.read<FormCubit>().TextFormFieldValidation(value);
                           log(value);
                         },
                       ),
                       const SizedBox(height: 16,),
                       // hide if the first one starts with a
                       state.visible?TextFormField(
                         controller:_text2Controller,
                         key:const Key("TextFormField2") ,
                         validator: (value){
                           return null;
                         },
                       ):const SizedBox(),
                       const SizedBox(height: 16,),
                       //validate error from json file and show errorMessage in separate fnc.
                       // auto complete & real time autoSuggestion
                       Autocomplete<String>(
                         optionsBuilder: (TextEditingValue textEditingValue) {
                           if (textEditingValue.text == '') {
                             return const Iterable<String>.empty();
                             //const Iterable<String>.empty();
                           }
                           return state.autoSuggest!.where((String option) {
                             return option.contains(textEditingValue.text);
                           });
                         },
                         onSelected: (String selection) {
                           debugPrint('You just selected $selection');
                         },
                       ),
                       const SizedBox(height: 16,),
                       // assign parsed red key from json file
                       TextFormField(
                         controller:_text4Controller,
                         key:const Key("TextFormField4") ,
                         validator: (value){
                           return null;
                         },
                       ),
                       const SizedBox(height: 16,),
                      TextButton(onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (builder)=>const NewScreen()));
                       }, child: const Text("Navigate to new Screen")),
                     ],
                   );
                 }
                 else if(state is ValidateStateError){
                   _text4Controller.text=state.textForm4Value;
                   return Column(
                     children: [
                       // this for validation 5<char<=9 & only text
                       TextFormField(
                         key:const Key("TextFormField1"),
                         decoration: InputDecoration(
                           errorText: state.error,
                         ),
                         onChanged: (value){
                           context.read<FormCubit>().TextFormFieldValidation(value);
                           log(value);
                         },
                       ),
                       const SizedBox(height: 16,),
                       state.visible?TextFormField(
                         controller:_text2Controller,
                         key:const Key("TextFormField2") ,
                         validator: (value){
                           return null;
                         },
                       ):const SizedBox(),
                       const SizedBox(height: 16,),
                       //validate error from json file and show errorMessage in separate fnc.
                       // auto complete & real time autoSuggestion
                       Autocomplete<String>(
                         optionsBuilder: (TextEditingValue textEditingValue) {
                           if (textEditingValue.text == '') {
                             return const Iterable<String>.empty();
                             //const Iterable<String>.empty();
                           }
                           return state.autoSuggest!.where((String option) {
                             return option.contains(textEditingValue.text);
                           });
                         },
                         onSelected: (String selection) {
                           debugPrint('You just selected $selection');
                         },
                       ),
                       const SizedBox(height: 16,),
                       // assign parsed red key from json file
                       TextFormField(
                         controller:_text4Controller,
                         key:const Key("TextFormField4") ,
                         validator: (value){
                           return null;
                         },
                       ),
                       const SizedBox(height: 16,),
                     ],
                   );
                 }
                 else{
                   return Center(child: Text("${state.props}"));
                 }
               },
             ),
           )
         ],
      ),
    );
  }
}