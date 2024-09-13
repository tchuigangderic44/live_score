class PlayOff {
  String homeTeam;
  String awayTeam;
  String homeScore;
  String awayScore;
  String homeFlag;
  String awayFlag;
  List<String> homeScorer;
  List<String> awayScorer;
  String matchDate;
  String matchTime;
  String championshipType;
  PlayOffStatus status;
  String group;
  String matchDay;
  String competitionLevel;
  String stadium;
  String winnerImg;

  PlayOff(
      {required this.homeTeam,
      required this.awayTeam,
      required this.homeScore,
      required this.awayScore,
      required this.homeFlag,
      required this.awayFlag,
      required this.matchDate,
      required this.matchTime,
      required this.championshipType,
      required this.status,
      required this.group,
      required this.matchDay,
      required this.competitionLevel,
      required this.stadium,
      required this.homeScorer,
      required this.awayScorer, required this.winnerImg});

  String getResult() {
    return '$homeScore : $awayScore';
  }
}

enum PlayOffStatus { pending, ongoing, completed, postpone, breack }

extension XPlayOffStatus on PlayOffStatus {
  bool get isPending => this == PlayOffStatus.pending;
  bool get isGoing => this == PlayOffStatus.ongoing;
  bool get isCompleted => this == PlayOffStatus.completed;
  bool get isBreack => this == PlayOffStatus.breack;
  bool get isPostpone => this == PlayOffStatus.postpone;
}
