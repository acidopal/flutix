part of 'pages.dart';

class TicketDetailPage extends StatefulWidget {
  final Ticket ticket;

  TicketDetailPage(this.ticket);

  @override
  _TicketDetailPageState createState() => _TicketDetailPageState();
}

class _TicketDetailPageState extends State<TicketDetailPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          context.cubit<PageCubit>().goToMainPage(
              bottomNavBarIndex: 1,
              isExpired: widget.ticket.time.isBefore(DateTime.now()));
          return;
        },
        child: Scaffold(
          backgroundColor: Color(0xFFF6F7F9),
          body: Container(
            padding: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
            child: ListView(
              children: <Widget>[
                Column(children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Stack(children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => context.cubit<PageCubit>().goToMainPage(
                            bottomNavBarIndex: 1,
                            isExpired:
                                widget.ticket.time.isBefore(DateTime.now())),
                        child: Icon(Icons.arrow_back, color: Colors.black),
                      ),
                    ),
                    Center(
                      child: Text(
                        "Ticket Details",
                        style: blackTextFont.copyWith(fontSize: 20),
                      ),
                    )
                  ])
                ])
              ],
            ),
            // child: Text(widget.ticket.movieDetail.title),
          ),
        ));
  }
}
