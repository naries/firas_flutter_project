class BalanceModel {
  String? balance;
  String? currency;

  BalanceModel(this.balance, this.currency);

  factory BalanceModel.fromMap(Map<String, dynamic> json) {
    return BalanceModel(json['balance'], json['currency']);
  }
  factory BalanceModel.fromJson(Map<String, dynamic> data) {
    return BalanceModel(data['balance'].toString(), data['currency']);
  }

  static BalanceModel iFromJson(x) => BalanceModel.fromJson(x['data']);
}
