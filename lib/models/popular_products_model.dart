class popularProduct {
late List <popularProductModel> adverts;


  popularProduct({required this.adverts});

  popularProduct.fromJson(Map<String, dynamic> json) {
    if (json['Adverts'] != null) {
      adverts = <popularProductModel>[];
      json['Adverts'].forEach((v) {
        adverts.add(popularProductModel.fromJson(v));
      });
    }
  }

}

class popularProductModel {
  String? advertID;
  String? advertType;
  String? advertTitle;
  String? advertSubTitle;
  String? advertDescription;
  String? deepLink;
  String? deepValue;
  String? shortLink;
  String? bannerURL;
  String? videoURL;
  String? actionText;
  String? actionURL;

  popularProductModel(
      {this.advertID,
        this.advertType,
        this.advertTitle,
        this.advertSubTitle,
        this.advertDescription,
        this.deepLink,
        this.deepValue,
        this.shortLink,
        this.bannerURL,
        this.videoURL,
        this.actionText,
        this.actionURL});

  popularProductModel.fromJson(Map<String, dynamic> json) {
    advertID = json['advertID'];
    advertType = json['advertType'];
    advertTitle = json['advertTitle'];
    advertSubTitle = json['advertSubTitle'];
    advertDescription = json['advertDescription'];
    deepLink = json['deepLink'];
    deepValue = json['deepValue'];
    shortLink = json['shortLink'];
    bannerURL = json['bannerURL'];
    videoURL = json['videoURL'];
    actionText = json['actionText'];
    actionURL = json['actionURL'];
  }

}