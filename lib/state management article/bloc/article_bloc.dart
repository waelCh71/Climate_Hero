import 'package:bloc/bloc.dart';
import 'package:climate_hero/features/communities/data_services/data_services.dart';
import 'package:meta/meta.dart';

part 'article_event.dart';
part 'article_state.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  ArticleBloc() : super(ArticleInitial()) {
    on<ArticleEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  CommunitiesServices communitiesServices = CommunitiesServices();

  Future<void> getArticles() async {
    emit(ArticleLoading());
    var articles = await communitiesServices.getArticles();
    if (articles.isNotEmpty) {
      emit(ArticleLoaded(articles));
    } else if (articles.isEmpty) {
      emit(ArticleLoadedEmpty());
    } else {
      emit(ArticleError("Something went wrong"));
    }
  }
}
