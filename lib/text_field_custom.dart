import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum StateType { ERROR, SUCCESS, DEFAULT, DISABLE }

class OutlineBorderTextFormField extends StatefulWidget {
  FocusNode focusNode = FocusNode();
  TextEditingController? controller;
  String? labelText;
  TextInputType? keyboardType;
  bool? autofocus = false;
  TextInputAction? textInputAction;
  Function? validation;
  bool enable = true;
  bool? showHelperText = false;
  StateType state = StateType.DEFAULT;
  String? iconPrefix;
  String? iconSuffix;
  double? height = 48;
  String? helperText;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OutlineBorderTextFormField();
  }

  OutlineBorderTextFormField({
    this.labelText,
    this.autofocus,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.validation,
    required this.enable,
    this.showHelperText,
    required this.iconPrefix,
    required this.iconSuffix,
    required this.state,
    this.height,
    this.helperText,
  });
}

class _OutlineBorderTextFormField extends State<OutlineBorderTextFormField> {
  bool focusText = false;
  String statusString = "";

  getLabelTextStyle(color) {
    return TextStyle(fontSize: 12.0, color: color,fontWeight: FontWeight.bold);
  } //label text style

  getTextFieldStyle() {
    return const TextStyle(
      fontSize: 12.0,
      color: Color.fromRGBO(26, 26, 26, 1),
    );
  } //textfield style

  getStatusTextFieldStyle() {
    var color = getColorState(widget.state);
    return TextStyle(
      fontSize: 10.0,
      color: color,
    );
  } // Error text style

  getBorderColor() {
    return widget.focusNode.hasFocus
        ? const Color.fromRGBO(248, 129, 37, 1)
        : const Color.fromRGBO(192, 192, 192, 1);
  } //Border colors according to focus

  Widget getIconSuffix(String? iconSuffix) {
    var iconSuffix = widget.iconSuffix ?? "";
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Visibility(
          visible: iconSuffix.isNotEmpty ? true : false,
          child: Image.asset(
            iconSuffix,
            width: 14,
            height: 24,
            fit: BoxFit.cover,
              colorBlendMode: BlendMode.multiply,
            color: widget.enable
                ? (widget.focusNode.hasFocus
                    ? const Color.fromRGBO(26, 26, 26, 1)
                    : getColorState(widget.state))
                : const Color.fromRGBO(177, 177, 177, 1),

          ),
        ),
        SizedBox(
          width: 15,
        )
      ],
    );
  }

  Widget getIconPrefix(String? path) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          path ?? "",
          width: 14,
          height: 24,
          color: Colors.black,
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }

  getColorState(state) {
    switch (state) {
      case StateType.SUCCESS:
        return const Color.fromRGBO(77, 197, 145, 1);
      case StateType.ERROR:
        return const Color.fromRGBO(255, 69, 89, 1);
      case StateType.DISABLE:
        return const Color.fromRGBO(246, 246, 246, 1);
      default:
        return const Color.fromRGBO(177, 177, 177, 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FocusScope(
            node: FocusScopeNode(),
            child: Focus(
                onFocusChange: (focus) {
                  //Called when ever focus changes
                  print("focus: $focus");
                  setState(() {
                    focusText = focus;
                    getStatusTextFieldStyle();
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: widget.height,
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                      color: widget.enable
                          ? Colors.white
                          : Color.fromRGBO(246, 246, 246, 1),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(6.0)),
                      border: Border.all(
                        width: 1,
                        style: BorderStyle.solid,
                        color: widget.state == StateType.DEFAULT
                            ? getBorderColor()
                            : getColorState(widget.state),
                      )),
                  child: TextFormField(
                    onTap: () {
                      if (widget.controller?.selection ==
                          TextSelection.fromPosition(TextPosition(
                              offset:
                              widget.controller?.text.length.toInt() ??
                                  0 - 1))) {
                        setState(() {
                          widget.controller?.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: widget.controller?.text.length
                                      .toInt() ??
                                      0));
                        });
                      }
                    },
                    cursorColor: const Color.fromRGBO(248, 129, 37, 1),
                    focusNode: widget.focusNode,
                    controller: widget.controller,
                    style: getTextFieldStyle(),
                    autofocus: widget.autofocus!,
                    keyboardType: widget.keyboardType,
                    textInputAction: widget.textInputAction,
                    validator: (string) {
                      if (widget.validation!(widget.controller?.text)
                          .toString()
                          .isNotEmpty) {
                        setState(() {
                          focusText = true;
                          statusString =
                              widget.validation!(widget.controller?.text);
                        });
                        return "";
                      } else {
                        setState(() {
                          focusText = false;
                          statusString =
                              widget.validation!(widget.controller?.text);
                        });
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {},
                    decoration: InputDecoration(
                        labelText: widget.labelText,
                        labelStyle: getLabelTextStyle(
                            widget.state == StateType.DEFAULT
                                ? const Color.fromRGBO(133, 133, 133, 1)
                                : getColorState(widget.state)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 7, horizontal: 16),
                        prefixIcon: getIconPrefix(widget.iconPrefix),
                        suffixIcon: getIconSuffix(widget.iconSuffix),
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        border: InputBorder.none,
                        errorStyle: const TextStyle(height: 0),
                        focusedErrorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        floatingLabelBehavior: FloatingLabelBehavior.auto),
                  ),
                )),
          ),
          Visibility(
            visible: widget.showHelperText!,
            child: Container(
                padding: const EdgeInsets.only(left: 15.0, top: 2.0),
                child: Text(
                  "${widget!.helperText}",
                  style: getStatusTextFieldStyle(),
                )),
          )
        ],
      ),
    );
  }
}

class LabelOutSideTextFormField extends StatefulWidget {
  FocusNode focusNode = FocusNode();
  TextEditingController? controller;
  TextInputType? keyboardType;
  bool? autofocus = false;
  String? hintText;
  TextInputAction? textInputAction;
  Function? validation;
  bool enable = true;
  bool? showHelperText = false;
  StateType state = StateType.DEFAULT;
  String? iconPrefix;
  String? iconSuffix;
  double? height = 48;
  String? helperText;
  String? errorText;
  bool? obscureText = false;
  String? labelText;
  bool? showIconHideShow;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LabelOutSideTextFormField();
  }

  LabelOutSideTextFormField({
    this.autofocus,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.validation,
    required this.enable,
    this.showHelperText,
    required this.iconPrefix,
    required this.iconSuffix,
    required this.state,
    this.height,
    this.helperText,
    this.errorText,
    this.hintText,
    this.obscureText,
    this.labelText,
    this.showIconHideShow,
    required this.focusNode,
  });
}

class _LabelOutSideTextFormField extends State<LabelOutSideTextFormField> {
  bool focusText = false;
  String statusString = "";

  getLabelTextStyle(color) {
    return TextStyle(fontSize: 12.0, color: color);
  } //label text style

  getTextFieldStyle() {
    return const TextStyle(
      fontSize: 16.0,
      color: Color.fromRGBO(26, 26, 26, 1),
    );
  } //textfield style

  getStatusTextFieldStyle() {
    var color = getColorState(widget.state);
    return TextStyle(
      fontSize: 10.0,
      color: color,
    );
  } // Error text style

  getBorderColor() {
    return widget.focusNode.hasFocus
        ? const Color.fromRGBO(248, 129, 37, 1)
        : const Color.fromRGBO(192, 192, 192, 1);
  } //Border colors according to focus

  Widget getIconSuffix(String? iconSuffix) {
    var iconSuffix = widget.iconSuffix ?? "";
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Visibility(
          visible: iconSuffix.isNotEmpty ? true : false,
          child: SvgPicture.asset(
            iconSuffix,
            width: 14,
            height: 14,
            color: widget.enable
                ? widget.state == StateType.DEFAULT
                    ? ((widget.focusNode.hasFocus
                        ? const Color.fromRGBO(26, 26, 26, 1)
                        : getColorState(widget.state)))
                    : (getColorState(widget.state))
                : const Color.fromRGBO(177, 177, 177, 1),
          ),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }

  Widget getIconPrefix(String? path) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          path ?? "",
          width: 14,
          height: 14,
          color: Colors.black,
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }

  getColorState(state) {
    switch (state) {
      case StateType.SUCCESS:
        return const Color.fromRGBO(77, 197, 145, 1);
      case StateType.ERROR:
        return const Color.fromRGBO(255, 69, 89, 1);
      case StateType.DISABLE:
        return const Color.fromRGBO(246, 246, 246, 1);
      default:
        return const Color.fromRGBO(177, 177, 177, 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(bottom: 2),
            child: Row(children: [
              Text(
                "${widget.labelText}",
                style: TextStyle(
                    color: Color.fromRGBO(26, 26, 26, 1), fontSize: 14,fontWeight: FontWeight.w500),
              ),
              Visibility(
                  visible: widget.state == StateType.ERROR,
                  child: Text(
                    "${widget.errorText}",
                    style: TextStyle(
                        color: Color.fromRGBO(255, 69, 89, 1), fontSize: 14, fontWeight: FontWeight.w500),
                  ))
            ]),
          ),
          FocusScope(
            node: FocusScopeNode(),
            child: Focus(
                onFocusChange: (focus) {
                  //Called when ever focus changes
                  print("focus: $focus");
                  setState(() {
                    focusText = focus;
                    if (focusText == true) {
                    } else {
                      if (widget.controller?.text.length == 0) {
                        widget.state = StateType.DEFAULT;
                        widget.iconSuffix = "";
                        print(widget.iconSuffix);
                        print(widget.state);
                      }
                    }
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                      color: widget.enable
                          ? Colors.white
                          : Color.fromRGBO(246, 246, 246, 1),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(6.0)),
                      border: Border.all(
                        width: 1,
                        style: BorderStyle.solid,
                        color: widget.state == StateType.DEFAULT
                            ? getBorderColor()
                            : getColorState(widget.state),
                      )),
                  child: TextFormField(
                    onTap: () {
                      if (widget.controller?.selection ==
                          TextSelection.fromPosition(TextPosition(
                              offset: widget.controller?.text.length.toInt() ??
                                  0 - 1))) {
                        setState(() {
                          widget.controller?.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset:
                                      widget.controller?.text.length.toInt() ??
                                          0));
                        });
                      }
                    },

                    cursorColor: const Color.fromRGBO(248, 129, 37, 1),
                    focusNode: widget.focusNode,
                    controller: widget.controller,
                    obscureText: widget.obscureText!,
                    style: getTextFieldStyle(),
                    autofocus: widget.autofocus!,
                    keyboardType: widget.keyboardType,
                    textInputAction: widget.textInputAction,
                    validator: (string) {
                      if (widget.validation!(widget.controller?.text)
                          .toString()
                          .isNotEmpty) {
                        setState(() {
                          focusText = true;
                          statusString =
                              widget.validation!(widget.controller?.text);
                        });
                        return "";
                      } else {
                        setState(() {
                          focusText = false;
                          statusString =
                              widget.validation!(widget.controller?.text);
                        });
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) {},
                    textAlignVertical: TextAlignVertical.center,

                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 7),
                        hintText: widget.hintText,
                        hintStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color.fromRGBO(177, 177, 177, 1)),
                        prefixIcon: getIconPrefix(widget.iconPrefix),
                        suffixIcon: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              getIconSuffix(widget.iconSuffix),
                              Visibility(
                                  visible: widget.showIconHideShow!,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        widget.obscureText =
                                        !widget.obscureText!;
                                        print(
                                            "widget.obscureText ${widget.obscureText}");
                                      });
                                    },
                                    constraints: BoxConstraints(),
                                    padding: const EdgeInsets.fromLTRB(0, 0, 6, 0),
                                    splashColor: Colors.transparent,
                                    icon: Icon(
                                      widget.obscureText!
                                          ? Icons.visibility_off_rounded
                                          : Icons.visibility_rounded,
                                      size: 18,
                                      color: Color.fromRGBO(133, 133, 133, 1),
                                    ),
                                  ))
                            ]
                        ),
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        border: InputBorder.none,
                        errorStyle: const TextStyle(height: 0),
                        focusedErrorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        floatingLabelBehavior: FloatingLabelBehavior.auto),
                  ),
                )),
          ),
          Visibility(
            visible: widget.showHelperText!,
            child: Container(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(
                  "${widget!.helperText}",
                  style: TextStyle(
                      color: Color.fromRGBO(192, 192, 192, 1), fontSize: 12),
                )),
          )
        ],
      ),
    );
  }
}

