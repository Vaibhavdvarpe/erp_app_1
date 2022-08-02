import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import "package:rxdart/subjects.dart";
import '../../repo/repository.dart';

class ChangePassBloc extends Cubit<dynamic> {
  ChangePassBloc(initialState) : super(initialState);
  final _repo = Repository();
  final _publishSubject = PublishSubject<dynamic>();

  Stream streamData() {
    return _publishSubject.stream;
  }

  sinkData(token,currentpass,newpass) async {
    dynamic data = await _repo.changePass(token,currentpass,newpass);
    _publishSubject.sink.add(data);
  }

  dispose() {
    _publishSubject.close();
  }

  // streamData() {
  //   return _publishSubject.stream;
  // }
}
final changePassBloc = ChangePassBloc(null);
