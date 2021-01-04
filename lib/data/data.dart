import 'package:flutter/material.dart';

class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setDesc(
      "Jangan takut kebablasan rebahan, dengan My Task tugas jadi terbayang terus");
  sliderModel.setTitle("Kelola Tugas Dengan Mudah");
  sliderModel.setImageAssetPath("assets/images/1.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setDesc(
      "Tambahkan tugas dan deadline agar kamu tidak ketakutan dikejar deadline");
  sliderModel.setTitle("Tambahkan Tugas dan Deadline");
  sliderModel.setImageAssetPath("assets/images/2.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setDesc(
      "Selesaikan tugasmu tepat waktu agar bisa pamer di instastory dan dapatkan point hadiah");
  sliderModel.setTitle("Selesaikan Tugas Tepat Waktu");
  sliderModel.setImageAssetPath("assets/images/3.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
