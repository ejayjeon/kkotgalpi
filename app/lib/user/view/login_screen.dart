import 'dart:convert';
import 'dart:io';

import 'package:app/common/components/custom_input.dart';
import 'package:app/common/components/custom_padding.dart';
import 'package:app/common/layout/main_layout.dart';
import 'package:app/common/themes/color_schemes.g.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    final emulatorIp = '10.0.2.2:3000';
    final simulatorIp = '127.0.0.1:3000';

    // Emultor vs. Simulator
    final ip = Platform.isIOS ? simulatorIp : emulatorIp; // IOS 실행
    String email = '';
    String password = '';
    final rawString = 'test@codefactory.ai:testtest';
    Codec<String, String> stringToBase64 = utf8.fuse(base64);
    String token = stringToBase64.encode(rawString);

    return MainLayout(
      // 화면 스크롤 가능하게
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        // 드래그 했을 때 키보드 UI ON/OFF
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
                          style: ElevatedButton.styleFrom(
                            backgroundColor: lightColorScheme.onError,
                          ),
                          onPressed: () async {
                            final refresh =
                                'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3RAY29kZWZhY3RvcnkuYWkiLCJzdWIiOiJmNTViMzJkMi00ZDY4LTRjMWUtYTNjYS1kYTlkN2QwZDkyZTUiLCJ0eXBlIjoicmVmcmVzaCIsImlhdCI6MTY3MDI0MzIwMSwiZXhwIjoxNjcwMzI5NjAxfQ.iDljxEtC82CN4jY6B7uyUc8datsMGUvqpD9yPno49qs, accessToken: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InRlc3RAY29kZWZhY3RvcnkuYWkiLCJzdWIiOiJmNTViMzJkMi00ZDY4LTRjMWUtYTNjYS1kYTlkN2QwZDkyZTUiLCJ0eXBlIjoiYWNjZXNzIiwiaWF0IjoxNjcwMjQzMjAxLCJleHAiOjE2NzAyNDM1MDF9.xPiEyhs01cyn3KJ-R1YYtV8dRS6X3cgvECFuqYeaEdU';
                            final resp = await dio.post(
                              // Token Refresh
                              'http://$ip/auth/token',
                              options: Options(
                                headers: {
                                  'authorization': 'Bearer $refresh',
                                },
                              ),
                            );
                            print(resp.data);
                          },
                          child: const Text('취소'),
                        ),
                      ),
                      const CustomPadding(
                        width: 8.0,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                lightColorScheme.secondaryContainer,
                          ),
                          onPressed: () async {
                            final resp = await dio.post(
                              'http://$ip/auth/login',
                              options: Options(
                                headers: {
                                  'authorization': 'Basic $token',
                                },
                              ),
                            );
                            print(resp.data);
                          },
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
