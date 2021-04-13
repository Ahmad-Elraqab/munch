class User {
  String cardPin;
  String customerGuid;
  int customerId;
  String deviceSourceType;
  String email;
  String firstName;
  bool isCustomerCare;
  String lastName;
  int loginStatus;
  String mobileTokenId;
  String oldGuestCustomerGuid;
  String password;
  String userName;
  String userNameEmail;
  String token;

  User({
    this.cardPin,
    this.customerGuid,
    this.customerId,
    this.deviceSourceType,
    this.email,
    this.firstName,
    this.isCustomerCare,
    this.lastName,
    this.loginStatus,
    this.mobileTokenId,
    this.oldGuestCustomerGuid,
    this.password,
    this.userName,
    this.userNameEmail,
    this.token,
  });
  User.fromJson(Map<String, dynamic> json)
      : this(
          cardPin: json['CardPin'],
          customerGuid: json['CustomerGuid'],
          customerId: json['CustomerId'],
          deviceSourceType: json['DeviceSourceType'],
          email: json['Email'],
          firstName: json['FirstName'],
          isCustomerCare: json['IsCustomerCare'],
          lastName: json['LastName'],
          loginStatus: json['LoginStatus'],
          mobileTokenId: json['MobileTokenId'],
          oldGuestCustomerGuid: json['OldGuestCustomerGuid'],
          password: json['Password'],
          userName: json['UserName'],
          userNameEmail: json['UserNameEmail'],
          token: json['token'],
        );
  Map<String, dynamic> toJson() => {};
}
