import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app/app_color.dart';
import '../app/app_style.dart';

class DialogUtil {
  DialogUtil._();

  static createDialog(BuildContext context, {Widget? child}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(20),
          child: child,
        );
      },
    );
  }

  static createDialogReload(
      {required BuildContext context,
      String title = '',
      String message = '',
      VoidCallback? onCancelPressed,
      VoidCallback? onReloadPressed}) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Column(
            children: [
              Text(
                title,
                style: AppStyle.medium(fontSize: 13),
                textAlign: TextAlign.center,
              ),
              message.isEmpty
                  ? Container()
                  : Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        message,
                        style: AppStyle.regular(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (onCancelPressed != null) {
                  onCancelPressed();
                }
              },
              style: _buttonStyle(),
              child: Text(
                'Hủy bỏ',
                style: AppStyle.semiBold(color: AppColors.primary),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (onReloadPressed != null) {
                  onReloadPressed();
                }
              },
              style: _buttonStyle(),
              child: Text(
                'Tải lại',
                style: AppStyle.semiBold(color: AppColors.primary),
              ),
            ),
          ],
        );
      },
    );
  }

  static createDialogMessage(
      {required BuildContext context,
      String title = '',
      String message = '',
      String buttonTitle = 'Đồng ý',
      VoidCallback? onPressed}) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Column(
            children: [
              title.isEmpty
                  ? Container()
                  : Text(
                      title,
                      style: AppStyle.medium(),
                      textAlign: TextAlign.center,
                    ),
              message.isEmpty
                  ? Container()
                  : Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Text(
                        message,
                        style: AppStyle.regular(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (onPressed != null) {
                  onPressed();
                }
              },
              style: _buttonStyle(),
              child: Text(
                buttonTitle,
                style: AppStyle.semiBold(color: AppColors.primary),
              ),
            ),
          ],
        );
      },
    );
  }

  static createDialogConfirm(
      {required BuildContext context,
      String title = '',
      String message = '',
      VoidCallback? onPressedOk,
      VoidCallback? onPressedCancel}) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          content: Column(
            children: [
              if (title.isNotEmpty)
                Text(
                  title,
                  style: AppStyle.medium(),
                  textAlign: TextAlign.center,
                ),
              if (message.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Text(
                    message,
                    style: AppStyle.regular(),
                    textAlign: TextAlign.center,
                  ),
                ),
              const SizedBox(height: 10),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (onPressedCancel != null) {
                  onPressedCancel();
                }
              },
              style: _buttonStyle(),
              child: Text(
                'Hủy',
                style: AppStyle.semiBold(color: AppColors.primary),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (onPressedOk != null) {
                  onPressedOk();
                }
              },
              style: _buttonStyle(),
              child: Text(
                'Đồng ý',
                style: AppStyle.semiBold(color: AppColors.primary),
              ),
            ),
          ],
        );
      },
    );
  }

  static ButtonStyle _buttonStyle() {
    return TextButton.styleFrom(
      minimumSize: const Size(100, 50),
      padding: EdgeInsets.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
    );
  }
}
