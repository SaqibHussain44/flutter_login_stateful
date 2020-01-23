class ValiidationMixin {
  
  String validateEmail(String value) {
    if(!value.contains('@')) {
      return 'Please Enter a Valid Email';
    }
    return null;
  }

  String validatePassword(String value) {
    if(value.length < 4) {
      return 'Passwords must be at least 4 characters';
    }
    return null;
  }

}