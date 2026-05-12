import 'package:demo_app/configs/configs.dart';
import 'package:demo_app/widgets/core/app_blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

part 'enums.dart';

class AppTextField extends StatefulWidget {
  final String name;
  final TextEditingController? controller;
  final String? hint;
  final bool? isPass;
  final bool? enabled;
  final double? width;
  final String? label;
  final String? helperText;
  final String? topHelperIcon;
  final String? labelHelperText;
  final bool? autoFocus;
  final FocusNode? node;
  final bool readOnly;
  final TextFieldType type;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final String? errorText;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function()? onEditComplete;
  final List<TextInputFormatter>? inputformatters;
  final void Function()? onTap;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final bool gradientOnFocusOnly;
  final TextStyle? labelStyle;
  final int? maxLength;
  final bool onTapOutside;
  final double? borderRadius;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? spacebtwlabelField;

  const AppTextField({
    super.key,
    required this.name,
    this.node,
    this.label,
    this.controller,
    this.enabled,
    this.errorText,
    this.autoFocus,
    this.prefixIcon,
    this.onChanged,
    this.onEditComplete,
    this.initialValue,
    this.validator,
    this.suffixIcon,
    this.onTap,
    this.hint,
    this.readOnly = false,
    this.isPass = false,
    this.textInputType,
    this.inputformatters,
    this.width = double.infinity,
    this.textInputAction = TextInputAction.done,
    this.textCapitalization = TextCapitalization.sentences,
    this.maxLines,
    this.minLines = 1,
    this.type = TextFieldType.primary,
    this.helperText,
    this.topHelperIcon,
    this.labelHelperText,
    this.fillColor,
    this.style,
    this.hintStyle,
    this.gradientOnFocusOnly = true,
    this.labelStyle,
    this.maxLength,
    this.onTapOutside = true,
    this.borderRadius,
    this.verticalPadding,
    this.horizontalPadding,
    this.spacebtwlabelField,
  });

  @override
  State<AppTextField> createState() => AppTextFieldState();
}

class AppTextFieldState extends State<AppTextField> {
  bool show = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    show = widget.isPass ?? false;
    _focusNode = widget.node ?? FocusNode();

    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    if (widget.node == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if ((widget.label != null &&
                widget.type == TextFieldType.withLableOnly) ||
            widget.type == TextFieldType.withLabelAndIcon) ...[
          Row(
            children: [
              Text(widget.label!, style: widget.labelStyle ?? AppText.b1bm),
              if (widget.labelHelperText != null) ...[
                Space.xf(4),
                Text(
                  widget.labelHelperText!,
                  style: AppText.l1bm!.cl(AppTheme.c.white.s60),
                ),
              ],
              if (widget.topHelperIcon != null) ...[
                Space.xf(4),
                SvgPicture.asset(
                  widget.topHelperIcon!,
                  width: 16.w,
                  height: 16.h,
                ),
              ],
            ],
          ),
          Space.yf(widget.spacebtwlabelField ?? 8),
        ],

        /// ✅ Shadow Wrapper
        AppBlur(
          blur: 64,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 9.r),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 9.r),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.c.white.s20,
                  blurRadius: 0,
                  offset: const Offset(0, 1),
                ),
              ],
              border: GradientBoxBorder(
                gradient: _focusNode.hasFocus
                    ? UIProps.secondaryGradient!
                    : LinearGradient(
                        colors: [Colors.transparent, Colors.transparent],
                      ),
                width: 2.w,
              ),
            ),
            child: FormBuilderTextField(
              name: widget.name,
              controller: widget.controller,
              focusNode: _focusNode,
              maxLength: widget.maxLength,
              minLines: widget.minLines,
              maxLines: widget.maxLines ?? 1,
              enabled: widget.enabled ?? true,
              readOnly: widget.readOnly,
              autofocus: widget.autoFocus ?? false,
              keyboardType: widget.textInputType,
              textInputAction: widget.textInputAction,
              textCapitalization: widget.textCapitalization,
              inputFormatters: widget.inputformatters,
              initialValue: widget.initialValue,
              obscureText: show,
              style: widget.style ?? AppText.b1!.cl(AppTheme.c.black.base),
              cursorColor: AppTheme.c.primary,
              onTap: widget.onTap,
              onTapOutside: widget.onTapOutside
                  ? (_) => FocusScope.of(context).unfocus()
                  : null,
              validator: widget.validator,
              onChanged: widget.onChanged,
              onEditingComplete: widget.onEditComplete,
              decoration: InputDecoration(
                errorText: widget.errorText,
                hintText: widget.hint,
                hintStyle:
                    widget.hintStyle ?? AppText.b1!.cl(AppTheme.c.textGrey),
                prefixIcon: widget.prefixIcon,
                suffixIcon:
                    widget.suffixIcon ??
                    (widget.isPass == true
                        ? IconButton(
                            onPressed: () => setState(() => show = !show),
                            icon: SvgPicture.asset(
                              show
                                  ? 'assets/svgs/eye-disabled.svg'
                                  : 'assets/svgs/eye-open.svg',
                              width: 16.w,
                              height: 16.h,
                              colorFilter: ColorFilter.mode(
                                Color(0xFF989898),
                                BlendMode.srcIn,
                              ),
                            ),
                          )
                        : null),
                filled: true,
                prefixIconConstraints: BoxConstraints(
                  minWidth: 16.w,
                  minHeight: 16.h,
                ),
                suffixIconConstraints: BoxConstraints(
                  minWidth: 24.w,
                  minHeight: 24.h,
                ),
                fillColor: (widget.fillColor ?? AppTheme.c.white.base),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: widget.horizontalPadding ?? 16.w,
                  vertical: widget.verticalPadding ?? 12.h,
                ),

                /// UNFOCUSED
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius ?? 8.r,
                  ),
                  borderSide: BorderSide(
                    color: AppTheme.c.cardBg.s10,
                    width: 2.w,
                  ),
                ),

                /// FOCUSED
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius ?? 8.r,
                  ),
                  borderSide: BorderSide(color: Colors.transparent, width: 0),
                ),

                /// ERROR
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius ?? 8.r,
                  ),
                  borderSide: BorderSide(color: AppTheme.c.red, width: 2.w),
                ),

                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    widget.borderRadius ?? 8.r,
                  ),
                  borderSide: BorderSide(color: AppTheme.c.red, width: 2.w),
                ),
              ),
            ),
          ),
        ),

        if (widget.helperText != null) ...[
          Space.yf(6),
          Text(
            widget.helperText!,
            style: AppText.l2!.cl(AppTheme.c.white.base),
          ),
        ],
      ],
    );
  }
}
