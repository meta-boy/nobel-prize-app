import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nobel/models/laureates.model.dart';
import 'package:nobel/models/nobel_prize.model.dart';

Future<NobelPrizeResponse> fetchNobelPrizes({@required String url}) async {
  http.Response response = await http.get(url);
  return nobelPrizeResponseFromJson(response.body);
}




Future<LaureatesResponse> fetchLaureates({@required String url}) async {
  http.Response response = await http.get(url);
  return laureatesResponseFromJson(response.body);
}