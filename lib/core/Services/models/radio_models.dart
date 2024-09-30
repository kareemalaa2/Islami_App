import 'radio.dart';

class RadioListModel {
  List<RadioModel>? radios;

  RadioListModel({this.radios});

  factory RadioListModel.fromJson(Map<String, dynamic> json) => RadioListModel(
    radios: (json['radios'] as List<dynamic>?)
        ?.map((e) => RadioModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}