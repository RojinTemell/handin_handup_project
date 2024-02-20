class InfoModel {
  final String userId;
  final String country;
  final String state;
  final String city;
  final String info;

  InfoModel({
    required this.userId,
    required this.country,
    required this.state,
    required this.city,
    required this.info,
  });

  factory InfoModel.fromFirestore(Map<String, dynamic> data) {
    return InfoModel(
      userId: data['userId'] ?? '',
      country: data['country'] ?? '',
      state: data['state'] ?? '',
      city: data['city'] ?? '',
      info: data['info'] ?? '',
    );
  }
}