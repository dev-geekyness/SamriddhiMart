import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  Local state fields for this page.

  bool signInWithPhone = true;

  bool otpGenerated = false;

  String phoneNumberWithCountryCode = '';

  bool resentOtp = false;

  int otpAttempts = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // State field(s) for phoneNumberTextField widget.
  FocusNode? phoneNumberTextFieldFocusNode;
  TextEditingController? phoneNumberTextFieldController;
  final phoneNumberTextFieldMask = MaskTextInputFormatter(mask: '##########');
  String? Function(BuildContext, String?)?
      phoneNumberTextFieldControllerValidator;
  String? _phoneNumberTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return 'Incorrect Phone Number';
    }
    if (val.length > 10) {
      return 'Incorrect Phone Number';
    }
    if (!RegExp('^[9|8|7|6][0-9]{9}\$').hasMatch(val)) {
      return 'Incorrect Phone Number';
    }
    return null;
  }

  // Stores action output result for [Firestore Query - Query a collection] action in GenerateOtpButton widget.
  int? countSalesmanWIthPhoneNumber;
  // State field(s) for emailAddressTextField widget.
  FocusNode? emailAddressTextFieldFocusNode;
  TextEditingController? emailAddressTextFieldController;
  String? Function(BuildContext, String?)?
      emailAddressTextFieldControllerValidator;
  String? _emailAddressTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for passwordTextField widget.
  FocusNode? passwordTextFieldFocusNode;
  TextEditingController? passwordTextFieldController;
  late bool passwordTextFieldVisibility;
  String? Function(BuildContext, String?)? passwordTextFieldControllerValidator;
  String? _passwordTextFieldControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 6) {
      return 'Minimum 6 characters allowed';
    }

    return null;
  }

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    phoneNumberTextFieldControllerValidator =
        _phoneNumberTextFieldControllerValidator;
    emailAddressTextFieldControllerValidator =
        _emailAddressTextFieldControllerValidator;
    passwordTextFieldVisibility = false;
    passwordTextFieldControllerValidator =
        _passwordTextFieldControllerValidator;
  }

  void dispose() {
    unfocusNode.dispose();
    phoneNumberTextFieldFocusNode?.dispose();
    phoneNumberTextFieldController?.dispose();

    emailAddressTextFieldFocusNode?.dispose();
    emailAddressTextFieldController?.dispose();

    passwordTextFieldFocusNode?.dispose();
    passwordTextFieldController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
