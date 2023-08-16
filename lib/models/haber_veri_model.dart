class HaberVeriModel {
  final String id;
  final String haberId;
  final bool aktif;
  final String eklenmetarihi;
  final String haberbasligi;
  final String haberaciklamasi;
  final String haberresim;

  HaberVeriModel(
      {required this.id,
      required this.haberId,
      required this.aktif,
      required this.eklenmetarihi,
      required this.haberbasligi,
      required this.haberaciklamasi,
      required this.haberresim});

  factory HaberVeriModel.fromJson(Map<String, dynamic> json) {
    return HaberVeriModel(
      id: json["id"],
      haberId: json["haberId"],
      aktif: json["aktif"],
      eklenmetarihi: json["eklenmetarihi"],
      haberbasligi: json["haberbasligi"],
      haberaciklamasi: json["haberaciklamasi"],
      haberresim: json["haberresim"],
    );
  }
}
