class ServicesRequest {
  String? nameService;
  String? nameProduct;
  int? priceService;
  int? priceProduct;
  bool? approvation;

  ServicesRequest(
      {this.nameService,
      this.nameProduct,
      this.priceService,
      this.priceProduct,
      this.approvation = false});

  //TODO: agregar a la OS

  Map<String, dynamic> toPreSave() {
    return {
      if (nameService != null && nameService!.isNotEmpty)
        "nameService": nameService,
      if (nameProduct != null && nameProduct!.isNotEmpty)
        "nameProduct": nameProduct,
      if (priceService != null && priceService!.isNaN)
        "priceService": priceService,
      if (priceProduct != null && priceProduct!.isNaN)
        "priceProduct": priceProduct,
      "approvation": approvation
    };
  }

  @override
  String toString() {
    return "ServicesRequest {$nameService, $nameProduct, $priceService, $priceProduct, $approvation}";
  }
}
