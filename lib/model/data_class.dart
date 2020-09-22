class Coupon {

  String label;
  String imagePath;
  String sendUnits;
  String amount;
  String soldUnits;
  List<String> soldUnitsUserImages ;

  Coupon({
    this.label,
    this.imagePath,
    this.sendUnits,
    this.amount,
    this.soldUnits,
    this.soldUnitsUserImages
  });
}

class Product{

  String productTitle;
  String imagePath;
  String amount;
  String soldUnits;
  String id;

  Product({
    this.id,
    this.productTitle,
    this.imagePath,
    this.soldUnits,
    this.amount
});
}