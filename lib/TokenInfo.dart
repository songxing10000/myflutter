class TokenInfo {
  String? accessToken;
  int? expiresIn;
  String? jti;
  String? refreshToken;
  String? scope;
  String? tokenType;

  TokenInfo(
      {this.accessToken,
      this.expiresIn,
      this.jti,
      this.refreshToken,
      this.scope,
      this.tokenType});

  TokenInfo.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
    jti = json['jti'];
    refreshToken = json['refresh_token'];
    scope = json['scope'];
    tokenType = json['token_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['expires_in'] = this.expiresIn;
    data['jti'] = this.jti;
    data['refresh_token'] = this.refreshToken;
    data['scope'] = this.scope;
    data['token_type'] = this.tokenType;
    return data;
  }
}
