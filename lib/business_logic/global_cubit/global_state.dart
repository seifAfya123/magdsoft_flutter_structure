part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

// class errorstate extends GlobalState {
//   final String mesg;
//   errorstate({
//     required this.mesg,
//   });
// }

// class dataloaded extends GlobalState {
//   final MyResponse respo;
//   dataloaded({
//     required this.respo,
//   });
// }
