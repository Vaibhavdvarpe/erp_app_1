import 'package:flutter_bloc/flutter_bloc.dart';
import "package:rxdart/subjects.dart";
import '../../repo/repository.dart';

class LogoutBloc extends Cubit<dynamic> {
  LogoutBloc(initialState) : super(initialState);
  final _repo = Repository();
  final _publishSubject = PublishSubject<dynamic>();

  Stream streamData() {
    return _publishSubject.stream;
  }

  sinkData(token) async {
    dynamic data = await _repo.logout(token);
    _publishSubject.sink.add(data);
  }

  dispose() {
    _publishSubject.close();
  }

  // streamData() {
  //   return _publishSubject.stream;
  // }
}
final logoutBloc = LogoutBloc(null);
