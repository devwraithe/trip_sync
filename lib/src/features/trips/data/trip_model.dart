import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trip_sync/src/features/trips/domain/trip_entity.dart';

class TripModel {
  final String id, name, reason;

  const TripModel({
    required this.id,
    required this.name,
    required this.reason,
  });

  factory TripModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data()!;
    return TripModel(
      id: snapshot.id,
      name: data['name'],
      reason: data['reason'],
    );
  }

  TripEntity toEntity() {
    return TripEntity(
      id: id,
      name: name,
      reason: reason,
    );
  }

  List<Object?> get props => [
        id,
        name,
        reason,
      ];
}
