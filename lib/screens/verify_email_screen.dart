import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_task/constants.dart';
import 'package:flutter_auth_task/models/verify_email_request/verify_email_request.dart';
import 'package:flutter_auth_task/models/verify_email_response/verify_email_response.dart';
import 'package:flutter_auth_task/providers/client_provider.dart';
import 'package:flutter_auth_task/providers/login_info_provider.dart';
import 'package:flutter_auth_task/providers/twofa_token_provider.dart';
import 'package:flutter_auth_task/screens/home_screen.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '/core/application.dart';
import '../../style/style.dart';

class VerfyEmailScreen extends HookConsumerWidget {
  final String email;
  const VerfyEmailScreen({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final codeController = useTextEditingController();
    final isMounted = useIsMounted();

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Text(
              application.translate('verifyEmail'),
              style: Style.mainFont.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              application.translate('verifyEmailDesc'),
              style: Style.mainFont.bodySmall,
            ),
            Text(
              email,
              style: Style.mainFont.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            // ========= this is the pin code field =========
            PinCodeTextField(
              appContext: context,
              pastedTextStyle: Style.mainFont.bodyMedium?.copyWith(color: Style.secondary),
              length: 4,
              obscureText: false,
              obscuringCharacter: '•',
              autoDismissKeyboard: true,
              autoDisposeControllers: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              enablePinAutofill: true,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              textCapitalization: TextCapitalization.characters,
              textStyle: Style.mainFont.titleSmall,
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                inactiveColor: Style.lines,
                activeColor: Style.lines,
                selectedColor: Style.lines,
                activeFillColor: Style.field,
                inactiveFillColor: Style.field,
                selectedFillColor: Style.field,
                fieldWidth: 50,
                fieldHeight: 50,
              ),
              cursorColor: Style.secondary,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              controller: codeController,
              keyboardType: TextInputType.text,
              onCompleted: (v) async {
                final client = ref.read(clientProvider);
                final loginResponse = ref.read(loginResponseProvider);
                debugPrint('Verifying with $loginResponse');
                try {
                  final response = await client.post(
                    twoFAUrl,
                    queryParameters: VerifyEmailRequest(
                      code: codeController.text,
                      token: loginResponse.twoFactorToken,
                    ).toJson(),
                  );
                  final verificationResponse = VerifyEmailResponse.fromJson(
                    response.data,
                  );
                  debugPrint('Verification Response: $verificationResponse');
                  if (!isMounted()) return;
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProviderScope(
                        overrides: [
                          twoFAProvider.overrideWithValue(
                            verificationResponse.access,
                          ),
                        ],
                        child: const HomeScreen(),
                      ),
                    ),
                  );
                } on DioError catch (e) {
                  debugPrint('${e.response}');
                }
              },
              onChanged: (value) {
                debugPrint(value);
              },
              onAutoFillDisposeAction: AutofillContextAction.cancel,
            ),

            const SizedBox(height: 16),

            const Spacer(flex: 4),
          ],
        ),
      ),
    );
  }
}
