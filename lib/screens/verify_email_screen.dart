import 'package:flutter/material.dart';
import 'package:flutter_auth_task/core/providers/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart' as p;
import '../core/controllers/controllers_exporter.dart';
import '/core/application.dart';
import '../../style/style.dart';

class VerfyEmailScreen extends HookConsumerWidget {
  final String? email;
  const VerfyEmailScreen({Key? key, required this.email}) : super(key: key);

static String id = '/VerfyEmailScreen';

  @override
  Widget build(BuildContext context, ref) {
    final codeController = TextEditingController();
    final user = p.Provider.of<UserProvider>(context);
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
              email ?? '',
              style: Style.mainFont.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            // ========= this is the pin code field =========
            PinCodeTextField(
              appContext: context,
              pastedTextStyle:
                  Style.mainFont.bodyMedium?.copyWith(color: Style.secondary),
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
               await UserController.verifyEmailCredintials(context: context, code: 'MUBQ', tocken: await user.getString('Token') ?? '');
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
