import 'package:flutter/material.dart';
import 'package:pokemonapp/models/pokemon.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PokemonStats extends StatelessWidget {
  const PokemonStats({Key key, @required this.data}) : super(key: key);
  final Pokemon data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 40, right: 50),
            child: Table(
              columnWidths: {
                0: FlexColumnWidth(2.0),
                1: FlexColumnWidth(1.0),
                2: FlexColumnWidth(5.0),
              },
              children: [
                TableRow(children: [
                  Text('HP',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                  Text(data.stats[5].baseStat.toString(),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  TableCell(
                    child: LinearPercentIndicator(
                      animation: true,
                      animationDuration: 1000,
                      lineHeight: 20.0,
                      percent: data.stats[5].baseStat > 100
                          ? 1
                          : (data.stats[5].baseStat / 100).toDouble(),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: data.stats[5].baseStat > 60
                          ? data.stats[5].baseStat > 80
                              ? Colors.green
                              : Colors.lightGreen
                          : data.stats[5].baseStat < 40
                              ? Colors.red
                              : Colors.orange,
                    ),
                  )
                ]),
                TableRow(children: [
                  SizedBox(height: 15), //SizeBox Widget
                  SizedBox(height: 15),
                  SizedBox(height: 15),
                ]),
                TableRow(children: [
                  Text('Attack',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                  Text(data.stats[4].baseStat.toString(),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  TableCell(
                    child: LinearPercentIndicator(
                      animation: true,
                      animationDuration: 1000,
                      lineHeight: 20.0,
                      percent: data.stats[4].baseStat > 100
                          ? 1
                          : (data.stats[4].baseStat / 100).toDouble(),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: data.stats[4].baseStat > 60
                          ? data.stats[4].baseStat > 80
                              ? Colors.green
                              : Colors.lightGreen
                          : data.stats[4].baseStat < 40
                              ? Colors.red
                              : Colors.orange,
                    ),
                  )
                ]),
                TableRow(children: [
                  SizedBox(height: 15), //SizeBox Widget
                  SizedBox(height: 15),
                  SizedBox(height: 15),
                ]),
                TableRow(children: [
                  Text('Defence',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                  Text(data.stats[3].baseStat.toString(),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  TableCell(
                    child: LinearPercentIndicator(
                      animation: true,
                      animationDuration: 1000,
                      lineHeight: 20.0,
                      percent: data.stats[3].baseStat > 100
                          ? 1
                          : (data.stats[3].baseStat / 100).toDouble(),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: data.stats[3].baseStat > 60
                          ? data.stats[3].baseStat > 80
                              ? Colors.green
                              : Colors.lightGreen
                          : data.stats[3].baseStat < 40
                              ? Colors.red
                              : Colors.orange,
                    ),
                  )
                ]),
                TableRow(children: [
                  SizedBox(height: 15), //SizeBox Widget
                  SizedBox(height: 15),
                  SizedBox(height: 15),
                ]),
                TableRow(children: [
                  Text('Sp.Atk',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                  Text(data.stats[2].baseStat.toString(),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  TableCell(
                    child: LinearPercentIndicator(
                      animation: true,
                      animationDuration: 1000,
                      lineHeight: 20.0,
                      percent: data.stats[2].baseStat > 100
                          ? 1
                          : (data.stats[2].baseStat / 100).toDouble(),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: data.stats[2].baseStat > 60
                          ? data.stats[2].baseStat > 80
                              ? Colors.green
                              : Colors.lightGreen
                          : data.stats[2].baseStat < 40
                              ? Colors.red
                              : Colors.orange,
                    ),
                  )
                ]),
                TableRow(children: [
                  SizedBox(height: 15), //SizeBox Widget
                  SizedBox(height: 15),
                  SizedBox(height: 15),
                ]),
                TableRow(children: [
                  Text('Sp.Def',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                  Text(data.stats[1].baseStat.toString(),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  TableCell(
                    child: LinearPercentIndicator(
                      animation: true,
                      animationDuration: 1000,
                      lineHeight: 20.0,
                      percent: data.stats[1].baseStat > 100
                          ? 1
                          : (data.stats[1].baseStat / 100).toDouble(),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: data.stats[1].baseStat > 60
                          ? data.stats[1].baseStat > 80
                              ? Colors.green
                              : Colors.lightGreen
                          : data.stats[1].baseStat < 40
                              ? Colors.red
                              : Colors.orange,
                    ),
                  )
                ]),
                TableRow(children: [
                  SizedBox(height: 15), //SizeBox Widget
                  SizedBox(height: 15),
                  SizedBox(height: 15),
                ]),
                TableRow(children: [
                  Text('Speed',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                  Text(data.stats[0].baseStat.toString(),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  TableCell(
                    child: LinearPercentIndicator(
                      animation: true,
                      animationDuration: 1000,
                      lineHeight: 20.0,
                      percent: data.stats[0].baseStat > 100
                          ? 1
                          : (data.stats[0].baseStat / 100).toDouble(),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: data.stats[0].baseStat > 60
                          ? data.stats[0].baseStat > 80
                              ? Colors.green
                              : Colors.lightGreen
                          : data.stats[0].baseStat < 40
                              ? Colors.red
                              : Colors.orange,
                    ),
                  )
                ]),
                TableRow(children: [
                  SizedBox(height: 30), //SizeBox Widget
                  SizedBox(height: 30),
                  SizedBox(height: 30),
                ]),
                TableRow(children: [
                  Text('Total',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54)),
                  Text(
                      data.stats
                          .map((title) => title.baseStat)
                          .reduce((prev, next) => prev + next)
                          .toString(),
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  TableCell(
                    child: LinearPercentIndicator(
                      animation: true,
                      animationDuration: 1000,
                      lineHeight: 20.0,
                      percent: data.stats
                                  .map((title) => title.baseStat)
                                  .reduce((prev, next) => prev + next) >
                              600
                          ? 1
                          : (data.stats
                                      .map((title) => title.baseStat)
                                      .reduce((prev, next) => prev + next) /
                                  600)
                              .toDouble(),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: data.stats
                                  .map((title) => title.baseStat)
                                  .reduce((prev, next) => prev + next) >
                              400
                          ? data.stats
                                      .map((title) => title.baseStat)
                                      .reduce((prev, next) => prev + next) >
                                  500
                              ? Colors.green
                              : Colors.lightGreen
                          : data.stats
                                      .map((title) => title.baseStat)
                                      .reduce((prev, next) => prev + next) <
                                  250
                              ? Colors.red
                              : Colors.orange,
                    ),
                  )
                ])
              ],
            ),
          )
        ],
      ),
    );
  }
}
