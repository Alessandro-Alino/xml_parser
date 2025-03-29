import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_event.dart';
part 'api_state.dart';
part 'api_bloc.freezed.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(const ApiState.initial()) {
    on<ApiEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
