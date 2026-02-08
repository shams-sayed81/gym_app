class CoachModel {
  final String id;
  final String name;
  final String jobTitle;
  final double price;
  final double rating;
  final int reviewsCount;
  final String bio;
  final String service;
  final String turnaround;
  final List<String>? sessionIds;


  CoachModel({
    required this.id,
    required this.name,
    required this.jobTitle,
    required this.price,
    required this.rating,
    required this.reviewsCount,
    required this.bio,
    required this.service,
    required this.turnaround,
    this.sessionIds
  });

}