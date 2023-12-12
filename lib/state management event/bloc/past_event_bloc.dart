import 'package:bloc/bloc.dart';
import 'package:climate_hero/features/communities/data_services/data_services.dart';
import 'package:meta/meta.dart';

part 'past_event_event.dart';
part 'past_event_state.dart';

class PastEventBloc extends Bloc<PastEventEvent, PastEventState> {
  PastEventBloc() : super(PastEventInitial()) {
    on<PastEventEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  CommunitiesServices communitiesServices = CommunitiesServices();

  Future<void> getEvents() async {
    emit(EventLoading());
    var articles = await communitiesServices.getEvents();
    if (articles.isNotEmpty) {
      emit(EventLoaded(articles));
    } else if (articles.isEmpty) {
      emit(EventLoadedEmpty());
    } else {
      emit(EventError("Something went wrong"));
    }
  }
}
