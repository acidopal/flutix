import 'package:bloc/bloc.dart';
import 'package:bwa_flutix/models/models.dart';
import 'package:bwa_flutix/services/services.dart';
import 'package:equatable/equatable.dart';

part 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit() : super(TicketInitial());

  void buyTicket(Ticket ticket, String userID) async {
    await TicketServices.saveTicket(ticket, userID);

    List<Ticket> tickets = await TicketServices.getTickets(userID);

    emit(MyTicketState(tickets));
  }

  void getTicket(String userID) async {
    List<Ticket> tickets = await TicketServices.getTickets(userID);

    emit(MyTicketState(tickets));
  }
}
