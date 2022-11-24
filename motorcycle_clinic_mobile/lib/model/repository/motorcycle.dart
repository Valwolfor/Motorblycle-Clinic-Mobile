import 'package:cloud_firestore/cloud_firestore.dart';

import '../entity/dx.dart';
import '../entity/reason.dart';
import '../entity/motorcycle.dart';
import '../entity/services.dart';
import '/controller/request/motorcycle_request.dart';

class MotorcycleRepository {
  late final CollectionReference _collection;
  late final String iud;

  MotorcycleRepository() {
    _collection = FirebaseFirestore.instance.collection("motorcycles");
  }

  Future<void> newMotorcycle(MotorcycleEntity motorcycle) async {
    await _collection
        .withConverter(
            fromFirestore: MotorcycleEntity.fromFirestore,
            toFirestore: (value, options) => value.toFirestore())
        .add(motorcycle);
  }

  Future<MotorcycleEntity> findByPlate(String plateQuery) async {
    final query = await _collection
        .withConverter(
          fromFirestore: MotorcycleEntity.fromFirestore,
          toFirestore: (value, options) => value.toFirestore(),
        )
        .where("plate", isEqualTo: plateQuery)
        .get();
//el cast convierte los dato al formato toFirestore
    var motorclycle = query.docs.cast();
    if (motorclycle.isEmpty) {
      return Future.error("La moto $plateQuery no se encuentra registrada.");
    }
    //Para recibir id de la BD
    var plate = motorclycle[0];
    var response = plate.data();

    return response;
  }

  Future<void> addReason(ReasonEntity reason, MotorcycleRequest request) async {
    try {
      final query = await _collection
          .withConverter(
            fromFirestore: MotorcycleEntity.fromFirestore,
            toFirestore: (value, options) => value.toFirestore(),
          )
          .where("plate", isEqualTo: request.plate)
          .get();
//el cast convierte los dato al formato toFirestore
      var motorclycle = query.docs.cast();

      var plate = motorclycle.first;
      var idDoc = plate.id;
      await _collection.doc(idDoc).set(
        {
          "serviceOrdersMaps": {
            "${request.serviceOrder!.date}": {
              "reason": {
                "reason": reason.reason,
                "reasonDetail": reason.reasonDetail,
                "mileage": reason.mileage,
                "lvlGas": reason.lvlGas,
                "documents": reason.documents,
                "advancePayment": reason.advancePayment,
                "advanceValue": reason.advanceValue,
                "authRute": reason.authRute
              }
            }
          }
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addDx(DxEntity dx, MotorcycleRequest request) async {
    try {
      final query = await _collection
          .withConverter(
            fromFirestore: MotorcycleEntity.fromFirestore,
            toFirestore: (value, options) => value.toFirestore(),
          )
          .where("plate", isEqualTo: request.plate)
          .get();
//el cast convierte los dato al formato toFirestore
      var motorclycle = query.docs.cast();

      var plate = motorclycle.first;
      var idDoc = plate.id;
      await _collection.doc(idDoc).set(
        {
          "serviceOrdersMaps": {
            "${request.serviceOrder!.date}": {
              "dx": {
                "indicators": dx.indicators,
                "oilState": dx.oilState,
                "oilLvl": dx.oilLvl,
                "brakeFluid": dx.brakeFluid,
                "clutchFluid": dx.clutchFluid,
                "coolantFluid": dx.coolantFluid,
                "mirrows": dx.mirrows,
                "horm": dx.horm,
                "tank": dx.tank,
                "ligths": dx.ligths,
                "tires": dx.tires,
                "forwardBrake": dx.frontBrake,
                "backBrake": dx.backBrake,
                "clutch": dx.clutch,
                "chain": dx.chain,
                "sparkPlug": dx.sparkPlug,
                "batery": dx.batery,
                "motor": dx.motor,
                "tapes": dx.tapes,
                "dragKit": dx.dragKit,
                "detailDx": dx.detailDx
              }
            }
          }
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      rethrow;
    }
  }

  void addServices(ServicesEntity services, MotorcycleRequest request) async {
    try {
      final query = await _collection
          .withConverter(
            fromFirestore: MotorcycleEntity.fromFirestore,
            toFirestore: (value, options) => value.toFirestore(),
          )
          .where("plate", isEqualTo: request.plate)
          .get();
//el cast convierte los dato al formato toFirestore
      var motorclycle = query.docs.cast();

      var plate = motorclycle.first;
      var idDoc = plate.id;
      await _collection.doc(idDoc).set(
        {
          "serviceOrdersMaps": {
            "${request.serviceOrder!.date}": {
              "listServices": {
                "services": services.services,
              }
            }
          }
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      rethrow;
    }
  }
}
