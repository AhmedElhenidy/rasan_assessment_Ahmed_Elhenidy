part of 'form_cubit.dart';

abstract class ColorFormState extends Equatable {
  const ColorFormState();
}

class FormInitial extends ColorFormState {
  List<String>? autoSuggest; bool visible,validForm; String textForm4Value;
  FormInitial({this.autoSuggest, this.visible=true,this.validForm=false,this.textForm4Value=""});
  @override
  List<Object> get props => [];
}

class ValidateStateError extends ColorFormState {
  String error;bool visible ;List<String>? autoSuggest;String textForm4Value;
  ValidateStateError({this.error="", this.autoSuggest, this.visible=true,this.textForm4Value=""});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
