import 'package:flutter_auth_task/core/error/exeptions.dart';
import 'package:flutter_auth_task/core/util/toast_message.dart';

void showErrorToast(context, errorMessage) {
  ToastMessage.showErrorToastMessage(msg: errorMessage, context: context);
}

void errorHandler(context, error) {
  switch (error) {
    case ServerException:
      return showErrorToast(context, "server error");
    case EmptyCacheException:
      return showErrorToast(context, "empty cache error");
    case OfflineException:
      return showErrorToast(context, "offline exception");
    default:
      return showErrorToast(context, "something went error");
  }
}
