part of 'article_bloc.dart';

@immutable
sealed class ArticleState {}

final class ArticleInitial extends ArticleState {}


class ArticleLoading extends ArticleState {}

class ArticleLoaded extends ArticleState {
  final List articles;

  ArticleLoaded(this.articles);
}

class ArticleLoadedEmpty extends ArticleState {
  final List articles=[];

  ArticleLoadedEmpty();
}

class ArticleError extends ArticleState {
  final String  error;

  ArticleError(this.error);
}
