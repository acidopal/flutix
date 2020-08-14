import 'package:bloc/bloc.dart';
import 'package:bwa_flutix/models/models.dart';
import 'package:bwa_flutix/services/services.dart';
import 'package:equatable/equatable.dart';

part 'ticket_state.dart';

class TicketCubit extends Cubit<TicketState> {
  TicketCubit() : super(TicketInitial());

  void buyTicket(userID, ticket) async {
    await TicketServices.saveTicket(userID, ticket);

    List<Ticket> tickets = ticket + [ticket];

    emit(MyTicketState(tickets));
  }

  void getTicket(userID) async {
    List<Ticket> tickets = await TicketServices.getTickets(userID);

    emit(MyTicketState(tickets));
  }
}
