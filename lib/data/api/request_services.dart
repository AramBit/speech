import 'package:dio/dio.dart';
import 'package:video_live_project/data/model/recover_send_model.dart';
import 'package:video_live_project/data/model/registration_send_model.dart';
import 'package:video_live_project/data/api/url_constants.dart';
import 'package:video_live_project/data/model/sign_in_get_model.dart';
import 'package:video_live_project/data/model/sign_in_send_model.dart';

import '../model/confirm_model.dart';
import '../model/recover_get_model.dart';
import '../model/registration_get_model.dart';

class RegistrationService {
  static final Dio dio = Dio();

  static Future<RegistracionGetModel?> registerUser(
      RegistrationSendModel registracionModel) async {
    final response = await dio.post(
      UrlParameters.registrationUrl,
      data: registracionModel.toJson(),
    );

    if (response.statusCode == 200) {
      return RegistracionGetModel.fromJson(response.data);
    } else {
      return null;
    }
  }

  static Future<bool> confirmUser(ConfirmModel confirmModel) async {
    try {
      final response = await dio.post(
        UrlParameters.registrationConfirm,
        data: confirmModel.toJson(),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static Future<bool> retryCode(String email) async {
    try {
      final response = await dio.post(
        UrlParameters.retryCodeUrl,
        data: {
          'email': email,
        },
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}

class SignInServices {
  static final Dio dio = Dio();

  static Future<SignInGetModel?> signInUser(SignInSendModel signInModel) async {
    final response = await dio.post(
      UrlParameters.signInUrl,
      options: Options(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
      data: signInModel.toJson(),
    );

    if (response.statusCode == 200) {
      return SignInGetModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}

class RecoverPasswordServices {
  static final Dio dio = Dio();

  static Future<RecoverPasswordGetModel?> recoverPasswordUser(
      RecoverPasswordSendModel recoverPasswordModel) async {
    final response = await dio.post(
      UrlParameters.recoverPsswordUrl,
      options: Options(
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
      data: recoverPasswordModel.toJson(),
    );

    if (response.statusCode == 200) {
      return RecoverPasswordGetModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
