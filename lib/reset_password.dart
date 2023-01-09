import 'package:flutter/material.dart';
import 'package:dangnhap_lms/text_field_custom.dart';
import 'package:get/get.dart';
import 'package:dangnhap_lms/password_retrieval.dart';
import 'package:flutter_svg/svg.dart';



class Reset_password extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Detail_Reset_password();
  }
}
class Detail_Reset_password extends State<Reset_password> {
  bool ischecked = false;
  TextEditingController controllerUserName = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController note1 = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool checkCorrectOrError = true;
  bool enable = true;
  bool setSubmit = false;
  bool showHelptext = false;
  FocusNode focusUserName = FocusNode();
  FocusNode focusPassword = FocusNode();
  String helperText = "";
  var stateInput = StateType.DEFAULT;
  String icoSuffix = "";
  bool? _obscured = true;

  void validateAndSave() {
    final FormState? form = formKey.currentState;
    if (form?.validate() == null) {
      print('Form is valid');
    } else {
      print('Form is invalid');
    }
  }

  String getTempIFSCValidation(String text) {
    return text.length > 8 ? "This line is helper text" : "";
  }

  getIconSuffix() {
    switch (stateInput) {
      case StateType.SUCCESS:
        return icoSuffix = "assets/Images/icon_success.svg";
      case StateType.ERROR:
        return icoSuffix = "assets/Images/icon_Error.svg";
      case StateType.DISABLE:
        return icoSuffix = "assets/Images/iconDefault.png";
      case StateType.DEFAULT:
        return icoSuffix = "";
    }

  }

  StateType getState(TextEditingController controller) {
    if (controller.text.length > 8) {
      stateInput = StateType.SUCCESS;
      helperText = "chính xác";
    } else {
      stateInput = StateType.ERROR;
      if (controller.text.isEmpty) {
        helperText = "Không được để trống";
      } else {
        helperText = "bạn nhập chưa đủ 8 kí tự";
      }
      ;
    }

    return stateInput;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Center(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 44),
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.arrow_back_outlined))
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 300,
                          height: 44,
                          child: const Text(
                            'Đặt Lại Mật Khẩu',
                            style: TextStyle(
                                fontSize: 32,
                                color: Color.fromRGBO(26, 26, 26, 1),
                                fontFamily: 'static/Inter-Medium.ttf',fontWeight: FontWeight.w500),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 8),
                            width: 280,
                            height: 15,
                            child: const Text(
                              'Mật khẩu mới phải khác so với mật khẩu cũ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(133, 133, 133, 1),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'static/Inter-Regular.ttf'),
                            ))
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 32),
                    child: Column(
                      children: [
                        LabelOutSideTextFormField(
                          state: enable
                              ? (setSubmit
                              ? (getState(controllerUserName))
                              : StateType.DEFAULT)
                              : StateType.DISABLE,
                          hintText: "Nhập Email hoặc số điện thoại",
                          controller: controllerUserName,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          autofocus: false,
                          validation: (textToValidate) {
                            return getTempIFSCValidation(textToValidate);
                          },
                          enable: enable,
                          showHelperText: true,
                          iconPrefix: "assets/Images/icon_useName.svg",
                          iconSuffix: getIconSuffix(),
                          helperText: "",
                          obscureText: false,
                          errorText: "(Sai Email/ Số điện thoại)",
                          labelText: "Email or số điện thoại",
                          showIconHideShow: false,
                          focusNode: focusUserName,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        LabelOutSideTextFormField(
                          state: enable
                              ? (setSubmit
                              ? (getState(controllerPassword))
                              : StateType.DEFAULT)
                              : StateType.DISABLE,
                          hintText: "Nhập mật khẩu",
                          controller: controllerPassword,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          autofocus: false,
                          validation: (textToValidate) {
                            return getTempIFSCValidation(textToValidate);
                          },
                          enable: enable,
                          showHelperText: true,
                          iconPrefix: "assets/Images/icon_passWord.svg",
                          iconSuffix: getIconSuffix(),
                          helperText: "Mật khẩu có ít nhất 8 kí tự",
                          obscureText: _obscured,
                          errorText: "(Mật khẩu không hợp lệ)",
                          labelText: "Mật khẩu",
                          showIconHideShow: true,
                          focusNode: focusPassword,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          checkColor: Colors.white,
                          activeColor: const Color.fromRGBO(248, 129, 37, 1),
                          value: ischecked,
                          onChanged: (bool? value) {
                            setState(() {
                              ischecked = value!;
                            });
                          },
                        ),
                        const Text(
                          'Nhớ mật khẩu',
                          style: TextStyle(
                              fontSize: 14, color: Color.fromRGBO(26, 26, 26, 1),fontWeight: FontWeight.w400, fontFamily: 'static/Inter-Regular.ttf'),
                        ),
                        const Expanded(child: Text('')),
                        TextButton(
                            onPressed: () {
                              Get.to(const Password_retrieval());
                            },
                            child: const Text(
                              'Quên mật khẩu ?',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(248, 129, 37, 1),
                                  fontFamily: 'static/Inter-Regular.ttf', fontWeight: FontWeight.w400),
                            ))
                      ],
                    ),
                  ),
                  Expanded(flex: 2, child: Container()),
                  SizedBox(
                    width: 360,
                    height: 46,
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (controllerUserName?.text.length == 0 &&
                                controllerPassword?.text.length == 0) {
                              setSubmit = false;
                            } else {
                              setSubmit = true;
                            }
                            if (controllerUserName?.text.length == 0 &&
                                controllerPassword?.text.length == 0) {
                              showHelptext = false;
                            } else {
                              showHelptext = true;
                            }
                            FocusScope.of(context).requestFocus(focusPassword);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            backgroundColor: Color.fromRGBO(248, 129, 37, 1)),
                        child: const Text(
                          'Đăng Nhập',
                          style: TextStyle(fontSize: 16),
                        )),
                  ),
                  Expanded(flex: 3, child: Container()),
                  Container(
                    child: RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                            text: 'Chưa có tài khoản?',
                            style: TextStyle(
                                color: Color.fromRGBO(177, 177, 177, 1),
                                fontSize: 12,
                                fontFamily: 'static/Inter-Regular.ttf')),
                        TextSpan(
                            text: ' Đăng Ký Ngay',
                            style: TextStyle(
                                color: Color.fromRGBO(248, 129, 37, 1),
                                fontSize: 12,
                                fontFamily: 'static/Inter-Regular.ttf')),
                      ]),
                    ),
                  ),
                  Expanded(flex: 1, child: Container()),
                ],
              ),
            )),
      ),
    );
  }
}
