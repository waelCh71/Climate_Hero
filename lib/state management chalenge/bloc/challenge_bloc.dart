import 'package:bloc/bloc.dart';
import 'package:climate_hero/features/challenge/data%20services/data_services.dart';
import 'package:meta/meta.dart';

part 'challenge_event.dart';
part 'challenge_state.dart';

class ChallengeBloc extends Bloc<ChallengeEvent, ChallengeState> {
  ChallengeBloc() : super(ChallengeInitial()) {
    on<ChallengeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  ChallengesServices communitiesServices = ChallengesServices();

  Future<void> getChallenge() async {
    emit(ChallengeLoading());
    var articles = await communitiesServices.getChallenges();
    if (articles.isNotEmpty) {
      emit(ChallengeLoaded(articles));
    } else if (articles.isEmpty) {
      emit(ChallengeLoadedEmpty());
    } else {
      emit(ChallengeError("Something went wrong"));
    }
  }
}
