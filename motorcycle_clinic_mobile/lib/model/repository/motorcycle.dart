import 'package:cloud_firestore/cloud_firestore.dart';

import '../entity/dx.dart';
import '../entity/reason.dart';
import '../entity/motorcycle.dart';
import '../entity/services.dart';
import '/controller/request/motorcycle_request.dart';

class MotorcycleRepository {
  late final CollectionReference _collection;

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

  Future<dynamic> findLength(String plateQuery) async {
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
      return 0;
    }
    //Para recibir id de la BD
    var plate = motorclycle.first;
    var response = plate.data();

    return response.serviceOrdersMaps.length;
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
      //se consigue el IUD
      var plate = motorclycle.first;
      var idDoc = plate.id;
      var data = plate.data();

      int index = data.serviceOrdersMaps.length;
      if (index != 1) {
        index += 1;
      }
      String key = index.toString();

      var newReasonOrder = {
        "date": "${request.serviceOrder!.date}",
        "reason": {
          "reason": reason.reason,
          "reasonDetail": reason.reasonDetail,
          "mileage": reason.mileage,
          "lvlGas": reason.lvlGas,
          "documents": reason.documents,
          "advancePayment": reason.advancePayment,
          "advanceValue": reason.advanceValue,
          "authRute": reason.authRute,
        },
        "dx": {},
        "listServices": []
      };

      await _collection.doc(idDoc).set(
        {
          "serviceOrdersMaps": {key: newReasonOrder},
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
      var data = plate.data();

      int index = data.serviceOrdersMaps.length;

      String key = index.toString();

      var newDxOrder = {
        "date": "${request.serviceOrder!.date}",
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
        },
        "listServices": []
      };

      await _collection.doc(idDoc).set(
        {
          "serviceOrdersMaps": {key: newDxOrder},
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addServices(
      ServicesEntity services, MotorcycleRequest request) async {
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
      var data = plate.data();

      int index = data.serviceOrdersMaps.length;

      String key = index.toString();

      await _collection.doc(idDoc).set(
        {
          "serviceOrdersMaps": {
            key: {
              "listServices": {
                "services": services.services,
              }
            }
          },
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      rethrow;
    }
  }

  // {
  //         "serviceOrdersMaps": {
  //           "${request.serviceOrder!.date}": {
  //             "listServices": {
  //               "services": services.services,
  //             }
  //           }
  //         }
  //       },

  // Consultar datos
  Future<List<MotorcycleEntity>> getMotorcycleRecords() async {
    var query = await _collection
        .withConverter<MotorcycleEntity>(
          fromFirestore: MotorcycleEntity.fromFirestore,
          toFirestore: (value, options) => value.toFirestore(),
        )
        .get();

    // List<MotorcycleEntity> MotlistMotorcycle = [];
    // var motorcycle;

    var motorclycles = query.docs.cast().map<MotorcycleEntity>((e) {
      var motorcycle = e.data();
      motorcycle.id = e.id;

      return motorcycle;
    });

    return motorclycles.toList();
  }
}
