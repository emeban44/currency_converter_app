import 'package:currency_converter_app/models/timeseries.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'line_titles.dart';

class YearlyChart extends StatelessWidget {
  final Timeseries timeseries;
  final String symbol;
  final String interval;
  YearlyChart(this.timeseries, this.symbol, this.interval);

  final today = DateTime.now();
  final List<double> pastYearData = [];
  final List<String> pastYearDates = [];
  final List<double> pastYearUnsortedData = [];
  final Map<String, double> mjerenja = {};

  void calculateEverything() {
    for (int i = 0; i < 365; i++) {
      final day = today.subtract(Duration(days: i)).toString();
      pastYearDates.add(day.substring(0, 10));
      //print(timeseries.rates[pastWeekDates[i]]);
      pastYearData.add(timeseries.rates[pastYearDates[i]][symbol]);
      pastYearUnsortedData.add(timeseries.rates[pastYearDates[i]][symbol]);
      mjerenja[i.toString()] = pastYearUnsortedData.last;
    }

    //print(mjerenja);
    //print(pastWeekDates);
    pastYearData.sort();
    //print(pastWeekData);
    //print(pastWeekData);
  }

  double getY(int x) {
    int xx = x;
    final List<double> pastYearReversed = pastYearData.reversed.toList();
    //print();
    // print(pastWeekDates[0]);
    // print(timeseries.rates[pastWeekDates[0]][symbol]);
    //print(xx);
    int toReturn = int.parse(mjerenja.keys.firstWhere((e) {
      return mjerenja[e] == pastYearReversed[xx];
    }));

    return toReturn.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    calculateEverything();
    return Container(
      //color: Colors.grey,
      height: 600,
      margin: EdgeInsets.only(left: 20, right: 35, top: 15),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 364,
          minY: 0,
          maxY: pastYearData.length.toDouble() - 1,
          gridData: FlGridData(
            show: true,
            horizontalInterval: 2.5,
            //drawVerticalLine: true,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: Colors.indigo,
                strokeWidth: 1,
              );
            },
            getDrawingHorizontalLine: (value) {
              return FlLine(
                color: Colors.black26,
                strokeWidth: 1,
              );
            },
          ),
          titlesData: LineTitles.getYearlyTitleData(
              pastYearData, pastYearDates, timeseries.base),
          borderData: FlBorderData(
            show: true,
            border: Border(
              //top: BorderSide(color: Colors.black26),
              bottom: BorderSide(color: Colors.black26),
              right: BorderSide(color: Colors.black12),
              left: BorderSide(color: Colors.black12),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              isCurved: true,
              dotData: FlDotData(show: false),
              barWidth: 1,
              colors: [
                Colors.blue.shade300,
                Colors.blue.shade400,
                Colors.blue.shade600,
                Colors.blue.shade700,
                Colors.blue.shade800,
              ],
              spots: [
                FlSpot(0, getY(0).toDouble()),
                FlSpot(1, getY(1).toDouble()),
                FlSpot(2, getY(2).toDouble()),
                FlSpot(3, getY(3).toDouble()),
                FlSpot(4, getY(4).toDouble()),
                FlSpot(5, getY(5).toDouble()),
                FlSpot(6, getY(6).toDouble()),
                FlSpot(7, getY(7).toDouble()),
                FlSpot(8, getY(8).toDouble()),
                FlSpot(9, getY(9).toDouble()),
                FlSpot(10, getY(10).toDouble()),
                FlSpot(11, getY(11).toDouble()),
                FlSpot(12, getY(12).toDouble()),
                FlSpot(13, getY(13).toDouble()),
                FlSpot(14, getY(14).toDouble()),
                FlSpot(15, getY(15).toDouble()),
                FlSpot(16, getY(16).toDouble()),
                FlSpot(17, getY(17).toDouble()),
                FlSpot(18, getY(18).toDouble()),
                FlSpot(19, getY(19).toDouble()),
                FlSpot(20, getY(20).toDouble()),
                FlSpot(21, getY(21).toDouble()),
                FlSpot(22, getY(22).toDouble()),
                FlSpot(23, getY(23).toDouble()),
                FlSpot(24, getY(24).toDouble()),
                FlSpot(25, getY(25).toDouble()),
                FlSpot(26, getY(26).toDouble()),
                FlSpot(27, getY(27).toDouble()),
                FlSpot(28, getY(28).toDouble()),
                FlSpot(29, getY(29).toDouble()),
                FlSpot(30, getY(30).toDouble()),
                FlSpot(31, getY(31).toDouble()),
                FlSpot(32, getY(32).toDouble()),
                FlSpot(33, getY(33).toDouble()),
                FlSpot(34, getY(34).toDouble()),
                FlSpot(35, getY(35).toDouble()),
                FlSpot(36, getY(36).toDouble()),
                FlSpot(37, getY(37).toDouble()),
                FlSpot(38, getY(38).toDouble()),
                FlSpot(39, getY(39).toDouble()),
                FlSpot(40, getY(40).toDouble()),
                FlSpot(41, getY(41).toDouble()),
                FlSpot(42, getY(42).toDouble()),
                FlSpot(43, getY(43).toDouble()),
                FlSpot(44, getY(44).toDouble()),
                FlSpot(45, getY(45).toDouble()),
                FlSpot(46, getY(46).toDouble()),
                FlSpot(47, getY(47).toDouble()),
                FlSpot(48, getY(48).toDouble()),
                FlSpot(49, getY(49).toDouble()),
                FlSpot(50, getY(50).toDouble()),
                FlSpot(51, getY(51).toDouble()),
                FlSpot(52, getY(52).toDouble()),
                FlSpot(53, getY(53).toDouble()),
                FlSpot(54, getY(54).toDouble()),
                FlSpot(55, getY(55).toDouble()),
                FlSpot(56, getY(56).toDouble()),
                FlSpot(57, getY(57).toDouble()),
                FlSpot(58, getY(58).toDouble()),
                FlSpot(59, getY(59).toDouble()),
                FlSpot(60, getY(60).toDouble()),
                FlSpot(61, getY(61).toDouble()),
                FlSpot(62, getY(62).toDouble()),
                FlSpot(63, getY(63).toDouble()),
                FlSpot(64, getY(64).toDouble()),
                FlSpot(65, getY(65).toDouble()),
                FlSpot(66, getY(66).toDouble()),
                FlSpot(67, getY(67).toDouble()),
                FlSpot(68, getY(68).toDouble()),
                FlSpot(69, getY(69).toDouble()),
                FlSpot(70, getY(70).toDouble()),
                FlSpot(71, getY(71).toDouble()),
                FlSpot(72, getY(72).toDouble()),
                FlSpot(73, getY(73).toDouble()),
                FlSpot(74, getY(74).toDouble()),
                FlSpot(75, getY(75).toDouble()),
                FlSpot(76, getY(76).toDouble()),
                FlSpot(77, getY(77).toDouble()),
                FlSpot(78, getY(78).toDouble()),
                FlSpot(79, getY(79).toDouble()),
                FlSpot(80, getY(80).toDouble()),
                FlSpot(81, getY(81).toDouble()),
                FlSpot(82, getY(82).toDouble()),
                FlSpot(83, getY(83).toDouble()),
                FlSpot(84, getY(84).toDouble()),
                FlSpot(85, getY(85).toDouble()),
                FlSpot(86, getY(86).toDouble()),
                FlSpot(87, getY(87).toDouble()),
                FlSpot(88, getY(88).toDouble()),
                FlSpot(89, getY(89).toDouble()),
                FlSpot(90, getY(90).toDouble()),
                FlSpot(91, getY(91).toDouble()),
                FlSpot(92, getY(92).toDouble()),
                FlSpot(93, getY(93).toDouble()),
                FlSpot(94, getY(94).toDouble()),
                FlSpot(95, getY(95).toDouble()),
                FlSpot(96, getY(96).toDouble()),
                FlSpot(97, getY(97).toDouble()),
                FlSpot(98, getY(98).toDouble()),
                FlSpot(99, getY(99).toDouble()),
                FlSpot(100, getY(100).toDouble()),
                FlSpot(101, getY(101).toDouble()),
                FlSpot(102, getY(102).toDouble()),
                FlSpot(103, getY(103).toDouble()),
                FlSpot(104, getY(104).toDouble()),
                FlSpot(105, getY(105).toDouble()),
                FlSpot(106, getY(106).toDouble()),
                FlSpot(107, getY(107).toDouble()),
                FlSpot(108, getY(108).toDouble()),
                FlSpot(109, getY(109).toDouble()),
                FlSpot(110, getY(110).toDouble()),
                FlSpot(111, getY(111).toDouble()),
                FlSpot(112, getY(112).toDouble()),
                FlSpot(113, getY(113).toDouble()),
                FlSpot(114, getY(114).toDouble()),
                // FlSpot(115, getY(115).toDouble()),
                // FlSpot(116, getY(116).toDouble()),
                // FlSpot(117, getY(117).toDouble()),
                // FlSpot(118, getY(118).toDouble()),
                // FlSpot(119, getY(119).toDouble()),
                // FlSpot(120, getY(120).toDouble()),
                // FlSpot(121, getY(121).toDouble()),
                // FlSpot(122, getY(122).toDouble()),
                // FlSpot(123, getY(123).toDouble()),
                // FlSpot(124, getY(124).toDouble()),
                // FlSpot(125, getY(125).toDouble()),
                // FlSpot(126, getY(126).toDouble()),
                // FlSpot(127, getY(127).toDouble()),
                FlSpot(128, getY(128).toDouble()),
                FlSpot(129, getY(129).toDouble()),
                FlSpot(130, getY(130).toDouble()),
                FlSpot(131, getY(131).toDouble()),
                FlSpot(132, getY(132).toDouble()),
                FlSpot(133, getY(133).toDouble()),
                FlSpot(134, getY(134).toDouble()),
                FlSpot(135, getY(135).toDouble()),
                FlSpot(136, getY(136).toDouble()),
                FlSpot(137, getY(137).toDouble()),
                FlSpot(138, getY(138).toDouble()),
                FlSpot(139, getY(139).toDouble()),
                FlSpot(140, getY(140).toDouble()),
                FlSpot(141, getY(141).toDouble()),
                FlSpot(142, getY(142).toDouble()),
                FlSpot(143, getY(143).toDouble()),
                FlSpot(144, getY(144).toDouble()),
                FlSpot(145, getY(145).toDouble()),
                FlSpot(146, getY(146).toDouble()),
                FlSpot(147, getY(147).toDouble()),
                FlSpot(148, getY(148).toDouble()),
                FlSpot(149, getY(149).toDouble()),
                FlSpot(150, getY(150).toDouble()),
                FlSpot(151, getY(151).toDouble()),
                FlSpot(152, getY(152).toDouble()),
                FlSpot(153, getY(153).toDouble()),
                FlSpot(154, getY(154).toDouble()),
                FlSpot(155, getY(155).toDouble()),
                FlSpot(156, getY(156).toDouble()),
                FlSpot(157, getY(157).toDouble()),
                FlSpot(158, getY(158).toDouble()),
                FlSpot(159, getY(159).toDouble()),
                FlSpot(160, getY(160).toDouble()),
                FlSpot(161, getY(161).toDouble()),
                FlSpot(162, getY(162).toDouble()),
                FlSpot(163, getY(163).toDouble()),
                FlSpot(164, getY(164).toDouble()),
                FlSpot(165, getY(165).toDouble()),
                FlSpot(166, getY(166).toDouble()),
                FlSpot(167, getY(167).toDouble()),
                FlSpot(168, getY(168).toDouble()),
                FlSpot(169, getY(169).toDouble()),
                FlSpot(170, getY(170).toDouble()),
                FlSpot(171, getY(171).toDouble()),
                FlSpot(172, getY(172).toDouble()),
                FlSpot(173, getY(173).toDouble()),
                FlSpot(174, getY(174).toDouble()),
                FlSpot(175, getY(175).toDouble()),
                FlSpot(176, getY(176).toDouble()),
                FlSpot(177, getY(177).toDouble()),
                FlSpot(178, getY(178).toDouble()),
                FlSpot(179, getY(179).toDouble()),
                FlSpot(180, getY(180).toDouble()),
                FlSpot(181, getY(181).toDouble()),
                FlSpot(182, getY(182).toDouble()),
                FlSpot(183, getY(183).toDouble()),
                FlSpot(184, getY(184).toDouble()),
                FlSpot(185, getY(185).toDouble()),
                FlSpot(186, getY(186).toDouble()),
                FlSpot(187, getY(187).toDouble()),
                FlSpot(188, getY(188).toDouble()),
                FlSpot(189, getY(189).toDouble()),
                FlSpot(190, getY(190).toDouble()),
                FlSpot(191, getY(191).toDouble()),
                FlSpot(192, getY(192).toDouble()),
                FlSpot(193, getY(193).toDouble()),
                FlSpot(194, getY(194).toDouble()),
                FlSpot(195, getY(195).toDouble()),
                FlSpot(196, getY(196).toDouble()),
                FlSpot(197, getY(197).toDouble()),
                FlSpot(198, getY(198).toDouble()),
                FlSpot(199, getY(199).toDouble()),
                FlSpot(200, getY(200).toDouble()),
                FlSpot(201, getY(201).toDouble()),
                FlSpot(202, getY(202).toDouble()),
                FlSpot(203, getY(203).toDouble()),
                FlSpot(204, getY(204).toDouble()),
                FlSpot(205, getY(205).toDouble()),
                FlSpot(206, getY(206).toDouble()),
                FlSpot(207, getY(207).toDouble()),
                FlSpot(208, getY(208).toDouble()),
                FlSpot(209, getY(209).toDouble()),
                FlSpot(210, getY(210).toDouble()),
                FlSpot(211, getY(211).toDouble()),
                FlSpot(212, getY(212).toDouble()),
                FlSpot(213, getY(213).toDouble()),
                FlSpot(214, getY(214).toDouble()),
                FlSpot(215, getY(215).toDouble()),
                FlSpot(216, getY(216).toDouble()),
                FlSpot(217, getY(217).toDouble()),
                FlSpot(218, getY(218).toDouble()),
                FlSpot(219, getY(219).toDouble()),
                FlSpot(220, getY(220).toDouble()),
                FlSpot(221, getY(221).toDouble()),
                FlSpot(222, getY(222).toDouble()),
                FlSpot(223, getY(223).toDouble()),
                FlSpot(224, getY(224).toDouble()),
                FlSpot(225, getY(225).toDouble()),
                FlSpot(226, getY(226).toDouble()),
                FlSpot(227, getY(227).toDouble()),
                FlSpot(228, getY(228).toDouble()),
                FlSpot(229, getY(229).toDouble()),
                FlSpot(230, getY(230).toDouble()),
                FlSpot(231, getY(231).toDouble()),
                FlSpot(232, getY(232).toDouble()),
                FlSpot(233, getY(233).toDouble()),
                FlSpot(234, getY(234).toDouble()),
                FlSpot(235, getY(235).toDouble()),
                FlSpot(236, getY(236).toDouble()),
                FlSpot(237, getY(237).toDouble()),
                FlSpot(238, getY(238).toDouble()),
                // FlSpot(239, getY(239).toDouble()),
                // FlSpot(240, getY(240).toDouble()),
                // FlSpot(241, getY(241).toDouble()),
                // FlSpot(242, getY(242).toDouble()),
                // FlSpot(243, getY(243).toDouble()),
                // FlSpot(244, getY(244).toDouble()),
                // FlSpot(245, getY(245).toDouble()),
                // FlSpot(246, getY(246).toDouble()),
                // FlSpot(247, getY(247).toDouble()),
                // FlSpot(248, getY(248).toDouble()),
                // FlSpot(249, getY(249).toDouble()),
                FlSpot(250, getY(250).toDouble()),
                FlSpot(251, getY(251).toDouble()),
                FlSpot(252, getY(252).toDouble()),
                FlSpot(253, getY(253).toDouble()),
                FlSpot(254, getY(254).toDouble()),
                FlSpot(255, getY(255).toDouble()),
                FlSpot(256, getY(256).toDouble()),
                FlSpot(257, getY(257).toDouble()),
                FlSpot(258, getY(258).toDouble()),
                FlSpot(259, getY(259).toDouble()),
                FlSpot(260, getY(260).toDouble()),
                FlSpot(261, getY(261).toDouble()),
                FlSpot(262, getY(262).toDouble()),
                FlSpot(263, getY(263).toDouble()),
                FlSpot(264, getY(264).toDouble()),
                FlSpot(265, getY(265).toDouble()),
                FlSpot(266, getY(266).toDouble()),
                FlSpot(267, getY(267).toDouble()),
                FlSpot(268, getY(268).toDouble()),
                FlSpot(269, getY(269).toDouble()),
                FlSpot(270, getY(270).toDouble()),
                FlSpot(271, getY(271).toDouble()),
                FlSpot(272, getY(272).toDouble()),
                FlSpot(273, getY(273).toDouble()),
                FlSpot(274, getY(274).toDouble()),
                FlSpot(275, getY(275).toDouble()),
                FlSpot(276, getY(276).toDouble()),
                FlSpot(277, getY(277).toDouble()),
                FlSpot(278, getY(278).toDouble()),
                FlSpot(279, getY(279).toDouble()),
                FlSpot(280, getY(280).toDouble()),
                FlSpot(281, getY(281).toDouble()),
                FlSpot(282, getY(282).toDouble()),
                FlSpot(283, getY(283).toDouble()),
                FlSpot(284, getY(284).toDouble()),
                FlSpot(285, getY(285).toDouble()),
                FlSpot(286, getY(286).toDouble()),
                FlSpot(287, getY(287).toDouble()),
                FlSpot(288, getY(288).toDouble()),
                FlSpot(289, getY(289).toDouble()),
                FlSpot(290, getY(290).toDouble()),
                FlSpot(291, getY(291).toDouble()),
                FlSpot(292, getY(292).toDouble()),
                FlSpot(293, getY(293).toDouble()),
                FlSpot(294, getY(294).toDouble()),
                // FlSpot(295, getY(295).toDouble()),
                // FlSpot(296, getY(296).toDouble()),
                // FlSpot(297, getY(297).toDouble()),
                // FlSpot(298, getY(298).toDouble()),
                // FlSpot(299, getY(299).toDouble()),
                // FlSpot(300, getY(300).toDouble()),
                // FlSpot(301, getY(301).toDouble()),
                // FlSpot(302, getY(302).toDouble()),
                // FlSpot(303, getY(303).toDouble()),
                // FlSpot(304, getY(304).toDouble()),
                FlSpot(305, getY(305).toDouble()),
                FlSpot(306, getY(306).toDouble()),
                FlSpot(307, getY(307).toDouble()),
                FlSpot(308, getY(308).toDouble()),
                FlSpot(309, getY(309).toDouble()),
                FlSpot(310, getY(310).toDouble()),
                FlSpot(311, getY(311).toDouble()),
                FlSpot(312, getY(312).toDouble()),
                FlSpot(312, getY(312).toDouble()),
                FlSpot(313, getY(313).toDouble()),
                FlSpot(314, getY(314).toDouble()),
                FlSpot(315, getY(315).toDouble()),
                FlSpot(316, getY(316).toDouble()),
                FlSpot(317, getY(317).toDouble()),
                FlSpot(318, getY(318).toDouble()),
                FlSpot(319, getY(319).toDouble()),
                FlSpot(320, getY(320).toDouble()),
                FlSpot(321, getY(321).toDouble()),
                FlSpot(322, getY(322).toDouble()),
                FlSpot(323, getY(323).toDouble()),
                FlSpot(324, getY(324).toDouble()),
                FlSpot(325, getY(325).toDouble()),
                FlSpot(326, getY(326).toDouble()),
                FlSpot(327, getY(327).toDouble()),
                FlSpot(328, getY(328).toDouble()),
                FlSpot(329, getY(329).toDouble()),
                FlSpot(330, getY(330).toDouble()),
                FlSpot(331, getY(331).toDouble()),
                FlSpot(332, getY(332).toDouble()),
                FlSpot(333, getY(333).toDouble()),
                FlSpot(334, getY(334).toDouble()),
                FlSpot(335, getY(335).toDouble()),
                FlSpot(336, getY(336).toDouble()),
                FlSpot(337, getY(337).toDouble()),
                FlSpot(338, getY(338).toDouble()),
                FlSpot(339, getY(339).toDouble()),
                FlSpot(340, getY(340).toDouble()),
                FlSpot(341, getY(341).toDouble()),
                FlSpot(342, getY(342).toDouble()),
                FlSpot(343, getY(343).toDouble()),
                FlSpot(344, getY(344).toDouble()),
                FlSpot(345, getY(345).toDouble()),
                FlSpot(346, getY(346).toDouble()),
                FlSpot(347, getY(347).toDouble()),
                FlSpot(348, getY(348).toDouble()),
                FlSpot(349, getY(349).toDouble()),
                FlSpot(350, getY(350).toDouble()),
                FlSpot(351, getY(351).toDouble()),
                FlSpot(352, getY(352).toDouble()),
                FlSpot(353, getY(353).toDouble()),
                FlSpot(354, getY(354).toDouble()),
                FlSpot(355, getY(355).toDouble()),
                FlSpot(356, getY(356).toDouble()),
                FlSpot(357, getY(357).toDouble()),
                FlSpot(358, getY(358).toDouble()),
                FlSpot(359, getY(359).toDouble()),
                FlSpot(360, getY(360).toDouble()),
                FlSpot(361, getY(361).toDouble()),
                FlSpot(362, getY(362).toDouble()),
                FlSpot(363, getY(363).toDouble()),
                FlSpot(364, getY(364).toDouble()),
                //FlSpot(89, getY(89).toDouble()),
                //FlSpot(5, y),
              ],
            )
          ],
          //backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
