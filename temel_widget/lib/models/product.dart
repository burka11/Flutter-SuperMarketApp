class Product {
  int id;
  String name;
  String description;
  double UnitPrice;

  Product({this.name,this.description, this.UnitPrice});
  Product.withId(this.id,this.name,this.description, this.UnitPrice);

  Map<String,dynamic> toMap(){
    var map= new Map<String,dynamic>();
    map["name"]=name;
    map["description"]=description;
    map["unitPrice"]=UnitPrice;
    if(id!=null){
      map["id"]=id;

    }
    return map;
  }

    Product.fromObject(dynamic o){
    this.id=int.tryParse(o["id"]);
    this.name=o["name"];
    this.description=o["description"];
    this.UnitPrice=double.tryParse(o["UnitPrice"].toString());

    }
}
