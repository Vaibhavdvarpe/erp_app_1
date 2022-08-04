import 'package:erp_app/bloc/user_verification_bloc/check_user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import "package:rxdart/subjects.dart";
import '../../repo/repository.dart';

class CheckUserBloc extends Cubit<dynamic> {
  CheckUserBloc(initialState) : super(initialState);
  final _repo = Repository();
  final _publishSubject = PublishSubject<CheckUserModel>();

  Stream<CheckUserModel> streamData() {
    return _publishSubject.stream;
  }

  sinkData(username, clientcode) async {
    CheckUserModel data = await _repo.repoCheckUser(username, clientcode);
    _publishSubject.sink.add(data);
  }

  dispose() {
    _publishSubject.close();
  }

  // streamData() {}
}

final checkUserBloc = CheckUserBloc(null);
