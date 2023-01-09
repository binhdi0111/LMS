import 'package:flutter/material.dart';
import 'package:dangnhap_lms/text_field_custom.dart';
import 'package:get/get.dart';
import 'package:dangnhap_lms/get_a_confirmation_code.dart';


class Password_retrieval extends StatefulWidget {
  const Password_retrieval({super.key});

  @override
  State<StatefulWidget> createState() {
    return Detail_Password_retrieval();
  }
}
class Detail_Password_retrieval extends State<Password_retrieval> {
  TextEditingController controllerUserName = TextEditingController();
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
  bool Enable_button = false;

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
        return icoSuffix = "assets/Images/iconSuccess.png";
      case StateType.ERROR:
        return icoSuffix = "assets/Images/iconError.png";
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
      if (FocusScope.of(context).hasFocus) {
        stateInput = StateType.ERROR;
        if (controller.text.isEmpty) {
          helperText = "Không được để trống";
        } else {
          helperText = "bạn nhập chưa đủ 8 kí tự";
        }
      } else {
        stateInput = StateType.DEFAULT;
      }
    }

    return stateInput;
  }

  @override
  void initState() {
    super.initState();
    controllerUserName.addListener(() {
      final isEnable_button = controllerUserName.text.length >= 10;
      setState(() {
        this.Enable_button = isEnable_button;

      });
    });
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
              margin: EdgeInsets.all(10),
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
                            icon: const Icon(Icons.arrow_back_outlined))
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: 44,
                            margin: EdgeInsets.only(right: 16,left: 16),
                            child: const
                            Text(
                              'Lấy Lại Mật Khẩu',
                              style: TextStyle(
                                fontSize: 36,
                                color: Color.fromRGBO(26, 26, 26, 1),
                                fontFamily: 'static/Inter-Medium.ttf', fontWeight:FontWeight.w500, ),
                            )
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 48, right: 48),
                          margin: EdgeInsets.only(top: 8,right: 16,left: 16),
                          child: Text(
                            'Nhập Email hoặc số điện thoại để Slova giúp bạn lấy lại mật khẩu nhé',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(133, 133, 133, 1),
                                fontSize: 12,
                                fontFamily: 'static/Inter-Regular.ttf'),
                          )),
                        Container(
                          margin: EdgeInsets.only(top: 48),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                errorText: "(Email không khả dụng)",
                                labelText: "Email/ số điện thoại đăng ký",
                                showIconHideShow: false,
                                focusNode: focusUserName,
                              ),
                              Container(
                                width: 500,
                                margin: EdgeInsets.only(left: 16, right: 16),
                                height: 46,
                                child: ElevatedButton(
                                    onPressed: Enable_button
                                        ? () {
                                      setState(() {
                                        if (controllerUserName?.text.length ==
                                            0) {
                                          setSubmit = false;
                                        } else {
                                          setSubmit = true;
                                        }
                                        if (controllerUserName?.text.length ==
                                            0) {
                                          showHelptext = false;
                                        } else {
                                          showHelptext = true;
                                          Get.to(Get_a_confirmation_code());
                                        }
                                        Enable_button = true;
                                        FocusScope.of(context)
                                            .requestFocus(focusPassword);
                                      });
                                    }
                                        : null,
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(6)),
                                        backgroundColor:
                                        Color.fromRGBO(248, 129, 37, 1)),
                                    child: const Text(
                                      'Gửi Mã',
                                      style: TextStyle(fontSize: 16),
                                    )),
                              ),
                              Container(

                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(
                                      top: 22,left: 16, right: 16
                                  ),
                                  child: RichText(
                                    text: const TextSpan(children: [
                                      TextSpan(
                                          text: 'Slova sẽ gửi đến ',
                                          style: TextStyle(
                                              color: Color.fromRGBO(177, 177, 177, 1),
                                              fontFamily: 'static/Inter-Regular.ttf',
                                              fontSize: 12)),
                                      TextSpan(
                                          text: 'Email/số điện thoại ',
                                          style: TextStyle(
                                              color: Color.fromRGBO(248, 129, 37, 1),
                                              fontFamily: 'static/Inter-Regular.ttf',
                                              fontSize: 12)),
                                      TextSpan(
                                          text:
                                          'của bạn 1 đoạn mã để đặt lại mật khẩu',
                                          style: TextStyle(
                                              color: Color.fromRGBO(177, 177, 177, 1),
                                              fontFamily: 'static/Inter-Regular.ttf',
                                              fontSize: 12)),
                                    ]),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container())
                ],
              ),
            )),
      ),
    );
  }
}