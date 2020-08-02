part of 'ticket_cubit.dart';

abstract class TicketState extends Equatable {
  const TicketState();
}

class TicketInitial extends TicketState {
  @override
  List<Object> get props => [];
}

class MyTicketState extends TicketState {
 final List<Ticket> tickets;

  const MyTicketState(this.tickets);

  @override
  List<Object> get props => [tickets];
}

class BuyTicket extends TicketState {
  final Ticket ticket;
  final String userID;

  BuyTicket(this.ticket, this.userID);
  
  @override
  List<Object> get props => [ticket, userID];
}