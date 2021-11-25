library movie;

export 'domain/usecases/get_now_playing_movies.dart';
export 'domain/usecases/get_popular_movies.dart';
export 'domain/usecases/get_top_rated_movies.dart';
export 'domain/usecases/get_movie_detail.dart';
export 'domain/usecases/get_movie_recommendations.dart';
export 'domain/usecases/get_watchlist_status.dart';
export 'domain/usecases/get_watchlist_movies.dart';
export 'domain/usecases/remove_watchlist.dart';
export 'domain/usecases/save_watchlist.dart';

export 'presentation/pages/home_movie_page.dart';
export 'presentation/pages/popular_movies_page.dart';
export 'presentation/pages/top_rated_movies_page.dart';
export 'presentation/pages/movie_detail_page.dart';
export 'presentation/pages/watchlist_movies_page.dart';

export 'presentation/provider/popular_movies_notifier.dart';
export 'presentation/provider/top_rated_movies_notifier.dart';
export 'presentation/provider/movie_detail_notifier.dart';
export 'presentation/provider/movie_list_notifier.dart';
export 'presentation/provider/watchlist_movie_notifier.dart';

export 'presentation/bloc/popular_movie_bloc.dart';
export 'presentation/bloc/top_rated_movie_bloc.dart';
export 'presentation/bloc/now_movie_bloc.dart';
export 'presentation/bloc/watchlist_movie_bloc.dart';
export 'presentation/bloc/watchlist_status_movie_bloc.dart';
export 'presentation/bloc/movie_detail_bloc.dart';