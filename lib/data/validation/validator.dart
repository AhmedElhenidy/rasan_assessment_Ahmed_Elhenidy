
class FormValidator{
 dynamic textFormField1Validator(String?  value){
    String? validationMsg;
    var val = int.tryParse(value!);
      if(val!=null){
        validationMsg = "you must enter characters";
      }
      else if (value.length < 5)
      {
        validationMsg = "less than 5 characters";
      }
      else if (value.length > 9) {
        validationMsg = "more than 9 characters";
      }
      if(value.isEmpty){
        validationMsg =null;
      }
    return validationMsg;
  }

  bool textFormField2State(String value){
   //false mean invisible and true mean to make it visible
   return value.startsWith("a")?false:true;

  }
}