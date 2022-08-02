import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import "package:rxdart/subjects.dart";
import '../../repo/repository.dart';
import 'authmodel.dart';

class UserAuthBloc extends Cubit<dynamic> {
  UserAuthBloc(initialState) : super(initialState);
  final _repo = Repository();
  final _publishSubject = PublishSubject<UserAuthModel>();

  Stream<UserAuthModel> streamData() {
    return _publishSubject.stream;
  }

  sinkData(username, password) async {
    UserAuthModel data = await _repo.authenticateUser(username, password);
    _publishSubject.sink.add(data);
  }

  dispose() {
    _publishSubject.close();
  }

  // streamData() {
  //   return _publishSubject.stream;
  // }
}

final userAuthBloc = UserAuthBloc(null);
