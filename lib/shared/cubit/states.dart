
abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates
{
   final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates
{
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates
{
  final String error;
  NewsGetScienceErrorState(this.error);
}

class NewsGetTechnologySuccessState extends NewsStates {}

class NewsGetTechnologyLoadingState extends NewsStates {}

class NewsGetTechnologyErrorState extends NewsStates
{
  final String error;
  NewsGetTechnologyErrorState(this.error);
}

class NewsGetHealthSuccessState extends NewsStates {}

class NewsGetHealthLoadingState extends NewsStates {}

class NewsGetHealthErrorState extends NewsStates
{
  final String error;
  NewsGetHealthErrorState(this.error);
}

class NewsGetEntertainmentSuccessState extends NewsStates {}

class NewsGetEntertainmentLoadingState extends NewsStates {}

class NewsGetEntertainmentErrorState extends NewsStates
{
  final String error;
  NewsGetEntertainmentErrorState(this.error);
}

class NewsGetGeneralSuccessState extends NewsStates {}

class NewsGetGeneralLoadingState extends NewsStates {}

class NewsGetGeneralErrorState extends NewsStates
{
  final String error;
  NewsGetGeneralErrorState(this.error);
}


class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates
{
  final String error;
  NewsGetSearchErrorState(this.error);

}









