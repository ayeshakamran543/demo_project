import 'package:demo_app/configs/configs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OtpController {
  VoidCallback? _clearCallback;

  void _bind(VoidCallback clearFn) {
    _clearCallback = clearFn;
  }

  void clear() {
    _clearCallback?.call();
  }
}

class OtpField extends StatefulWidget {
  final int length;
  final Function(String) onCompleted;
  final OtpController? controller;

  const OtpField({
    super.key,
    this.length = 6,
    required this.onCompleted,
    this.controller,
  });

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  late List<String> _otp;
  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _otp = List.filled(widget.length, '');
    _textController.addListener(_onChanged);

    /// Bind controller
    widget.controller?._bind(_clear);
  }

  @override
  void dispose() {
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onChanged() {
    final text = _textController.text;
    final newOtp = List<String>.filled(widget.length, '');

    for (int i = 0; i < text.length && i < widget.length; i++) {
      newOtp[i] = text[i];
    }

    setState(() => _otp = newOtp);

    if (text.length == widget.length) {
      _focusNode.unfocus();
      widget.onCompleted(text);
    }
  }

  void _clear() {
    _textController.clear();
    setState(() {
      _otp = List.filled(widget.length, '');
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Future.delayed(Duration.zero, () {
          _focusNode.requestFocus();
        });
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              widget.length,
              (i) => _OtpBox(value: _otp[i]),
            ),
          ),

          /// Hidden TextField
          SizedBox(
            height: 0,
            width: 0,
            child: TextField(
              controller: _textController,
              focusNode: _focusNode,
              keyboardType: TextInputType.number,
              maxLength: widget.length,
              autofocus: true,
              style: const TextStyle(height: 0.1, fontSize: 1),
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OtpBox extends StatelessWidget {
  final String value;

  const _OtpBox({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52.w,
      height: 56.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppTheme.c.white.base,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppTheme.c.cardBg.s10, width: 2.w),
      ),
      child: Text(value, style: AppText.h1xb?.cl(AppTheme.c.black.base)),
    );
  }
}
