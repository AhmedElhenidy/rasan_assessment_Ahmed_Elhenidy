import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rasan_flutter_assessment/data/request/fetch_data.dart';
import 'package:rasan_flutter_assessment/data/response/colors_response.dart';
import 'package:rasan_flutter_assessment/data/validation/validator.dart';

part 'form_state.dart';

class FormCubit extends Cubit<ColorFormState> {
  final FormValidator _validator;
  FormCubit(this._validator) : super(FormInitial(
    textForm4Value: "",
    autoSuggest:const [] ,
    visible:true,
  ));
  //late FormValidator _validator;

  loadSuggestData()async{
    ColorModelResponse _colorModelResponse= await FetchData().readJson();
    if(_colorModelResponse!=null){
      emit(FormInitial(
        autoSuggest:_colorModelResponse.groupOfColors!.autoSuggestionsColors,
        textForm4Value:_colorModelResponse.red!,
        visible:true ,
        //
      ));
    }else{
      emit(FormInitial(
        textForm4Value: "",
        autoSuggest:const [] ,
        visible:true,
      ));
    }
  }

  TextFormFieldValidation(String value) async {
    String? status = _validator.textFormField1Validator(value);
    bool? visible = _validator.textFormField2State(value);
    ColorModelResponse _colorModelResponse= await FetchData().readJson();
    if(status!=null){
      emit(ValidateStateError(
        autoSuggest: _colorModelResponse.groupOfColors!.autoSuggestionsColors,
        textForm4Value:_colorModelResponse.red!,
        error:status ,
        visible:visible,
      ));
    }
    else{
      emit(FormInitial(
        validForm: true,
        visible: visible,
        textForm4Value: _colorModelResponse.red!,
        autoSuggest:_colorModelResponse.groupOfColors!.autoSuggestionsColors,
      ));
    }
  }

  asyncValidationColors(String value)async{
    String? status;
    bool? visible = _validator.textFormField2State( value);
    ColorModelResponse _colorModelResponse= await FetchData().readJson();
    if(_colorModelResponse.groupOfColors!.asyncValidationColors!.first.error=="true"){
      status = _colorModelResponse.groupOfColors!.asyncValidationColors!.first.errorMessage;
      emit(ValidateStateError(
        autoSuggest: _colorModelResponse.groupOfColors!.autoSuggestionsColors,
        textForm4Value:_colorModelResponse.red!,
        error:status! ,
        visible:visible,
      ));
    }else{
      emit(FormInitial(
        validForm: true,
        visible: visible,
        textForm4Value: _colorModelResponse.red!,
        autoSuggest:_colorModelResponse.groupOfColors!.autoSuggestionsColors,
      ));
    }
  }
}
