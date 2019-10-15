class FormValidator {
  static FormValidator _instance;

  factory FormValidator() => _instance ??= new FormValidator._();

  FormValidator._();

  String validatePassword(String value) {
    String patttern = r'(^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{6,}$)';
    RegExp regExp = new RegExp(patttern);
    if (value.isEmpty) {
      return "Password is Required";
    } else if (value.length > 8) {
      return "Password must minimum eight characters";
    } else if (!regExp.hasMatch(value)) {
      return "Password at least one uppercase letter, one lowercase letter and one number";
    }
    return null;
  }

  String validateLastFirstName(String value) {
    if (value.isEmpty) {
      return "Name is Required";
    }
    return null;
  }

  String validateEmail(String value) {
    print(value);
    String pattern = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = new RegExp(pattern);
    print(regExp.hasMatch(value));
    if (value.isEmpty) {
      return "Email is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }
}
