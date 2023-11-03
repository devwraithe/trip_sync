class TripEntity {
  final String id, name, reason;

  const TripEntity({
    required this.id,
    required this.name,
    required this.reason,
  });

  List<Object?> get props => [
        id,
        name,
        reason,
      ];
}
