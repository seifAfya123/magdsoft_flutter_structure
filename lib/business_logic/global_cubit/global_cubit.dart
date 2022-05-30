import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/constants/end_points.dart';
import 'package:magdsoft_flutter_structure/data/models/account_model.dart';
import 'package:magdsoft_flutter_structure/data/models/my_repo.dart';
import 'package:magdsoft_flutter_structure/data/network/responses/login_response.dart';

part 'global_state.dart';

class GlobalCubit extends Cubit<GlobalState> {
  GlobalCubit() : super(GlobalInitial());

  // GlobalCubit(this.personRepo) : super(GlobalInitial());
  // final MyRepo personRepo;
  // late MyResponse response;

  // dynamic getPerson(dynamic b) {
  //   personRepo.postData(url: baseURL + 'login', body: b).then((value) {
  //     if (value.status == 200) {
  //       emit(dataloaded(respo: value));
  //       response = value;
  //     }
  //   });
  //   return response;
  // }

  static GlobalCubit get(context) => BlocProvider.of(context);
}
