import 'dart:math';

import 'package:aura_patient/providers/FBProvider.dart';
import 'package:aura_patient/widgets/CustomCard.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  String name;

  HomeScreen({@required this.name});

  FBProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<FBProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Patient details'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            // vertical: 15.0,
            horizontal: 15.0,
          ),
          physics: ScrollPhysics(),
          child: Column(
            children: [
              _getProfileCard(context),
              _getNormalValues(),
              Divider(
                color: Colors.grey,
                thickness: 4.0,
                indent: 10,
                endIndent: 10,
              ),
              _getAvgValues(),
            ],
          ),
        ),
      ),
    );
  }

  _getProfileCard(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2.8,
        width: MediaQuery.of(context).size.width,
        child: Card(
          color: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 4.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/profile.png',
                width: MediaQuery.of(context).size.height / 6,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$name',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    _generateRandomAge(),
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _getNormalValues() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomCard(
            title: 'SPO2',
            assetPath: 'assets/spo2.png',
            data: provider.fetchLatestSPO2(),
            size: 40.0,
          ),
          CustomCard(
            title: 'Pulse',
            assetPath: 'assets/heart.png',
            data: provider.fetchLatestPulse(),
            size: 40.0,
          ),
        ],
      ),
    );
  }

  _getAvgValues() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomCard(
            title: 'Avg\nSPO2',
            assetPath: 'assets/spo2.png',
            data: provider.avgSPO2,
            size: 40.0,
          ),
          CustomCard(
            title: 'Avg \nPulse',
            assetPath: 'assets/heart.png',
            data: provider.avgPulseRate,
            size: 40.0,
          ),
        ],
      ),
    );
  }

  _generateRandomAge() {
    Random rnd = Random();
    int min = 20, max = 60;
    return (min + rnd.nextInt(max - min)).toString();
  }
}
