class SignInGetModel {
    SignInGetModel({
        required this.accessToken,
        required this.tokenType,
    });

    final String? accessToken;
    final String? tokenType;

    SignInGetModel copyWith({
        String? accessToken,
        String? tokenType,
    }) {
        return SignInGetModel(
            accessToken: accessToken ?? this.accessToken,
            tokenType: tokenType ?? this.tokenType,
        );
    }

    factory SignInGetModel.fromJson(Map<String, dynamic> json){ 
        return SignInGetModel(
            accessToken: json["access_token"],
            tokenType: json["token_type"],
        );
    }

}
