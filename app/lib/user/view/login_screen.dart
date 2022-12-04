import 'package:app/common/components/custom_input.dart';
import 'package:app/common/components/custom_padding.dart';
import 'package:app/common/layout/main_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String email = '';
    String password = '';

    return MainLayout(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SafeArea(
          top: true,
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _Title(
                  title: 'SIGN IN',
                  style: Theme.of(context).textTheme.headline2,
                ),
                const CustomPadding(
                  height: 8.0,
                ),
                _Title(
                  title: 'Please enter your e-mail and password.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const CustomPadding(
                  height: 8.0,
                ),
                CustomInput(
                  hintText: '이메일을 입력해주세요',
                  isPassword: false,
                  autoFocus: true,
                  prefixIcon: Icons.mail_outline,
                  onChanged: (String value) {
                    email = value;
                    print(value);
                  },
                  // errorText: '이메일을 다시 한 번 확인해 주세요',
                ),
                const CustomPadding(
                  height: 8.0,
                ),
                CustomInput(
                  hintText: '비밀번호를 입력해주세요',
                  isPassword: true,
                  autoFocus: true,
                  prefixIcon: Icons.lock_outline,
                  onChanged: (String value) {
                    password = value;
                    print(value);
                  },
                  // errorText: '비밀번호를 다시 한 번 확인해 주세요',
                ),
                const CustomPadding(
                  height: 8.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('취소'),
                        ),
                      ),
                      const CustomPadding(
                        width: 8.0,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text('확인'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String title;
  final TextStyle? style;
  const _Title({
    super.key,
    required this.title,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style,
    );
  }
}
