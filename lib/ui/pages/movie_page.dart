part of 'pages.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      //header
      children: <Widget>[
        // note : Header Movie
        Container(
          decoration: BoxDecoration(
              color: accentColor1,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )),
          padding: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 30),
          child: BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (state is UserLoadedState) {
                if (imageFileToUpload != null) {
                  uploadImage(imageFileToUpload).then((downloadURL) {
                    imageFileToUpload = null;
                    context
                        .bloc<UserCubit>()
                        .updateData(profileImage: downloadURL);
                  });
                }
                return Row(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        context.bloc<PageCubit>().goToProfilePage();
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Color(0xFF5F558B), width: 1)),
                        child: Stack(
                          children: <Widget>[
                            SpinKitFadingCircle(
                              color: accentColor2,
                              size: 50,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: (state.user.profilePicture == "")
                                          ? AssetImage("assets/user_pic.png")
                                          : NetworkImage(
                                              state.user.profilePicture),
                                      fit: BoxFit.cover)),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              2 * defaultMargin -
                              78,
                          child: Text(
                            state.user.name,
                            style: whiteTextFont.copyWith(fontSize: 18),
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Text(
                          NumberFormat.currency(
                                  locale: "id_ID",
                                  decimalDigits: 0,
                                  symbol: "IDR ")
                              .format(state.user.balance),
                          style: yellowNumberFont.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return SpinKitFadingCircle(color: accentColor2, size: 20);
              }
            },
          ),
        ),
        //note: Now Playing
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
          child: Text(
            "Now Playing",
            style: blackTextFont.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 140,
          child: BlocBuilder<MovieCubit, MovieState>(
            builder: (context, state) {
              if (state is MovieLoadedState) {
                List<Movie> movies = state.movies.sublist(0, 10);

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (_, index) => Container(
                    margin: EdgeInsets.only(
                        left: (index == 0) ? defaultMargin : 0,
                        right:
                            (index == movies.length - 1) ? defaultMargin : 16),
                    child: MovieCard(movies[index], onTap: () {
                      context.bloc<PageCubit>().goToMovieDetail(movies[index]);
                    }),
                  ),
                );
              } else {
                return SpinKitFadingCircle(
                  color: mainColor,
                  size: 50,
                );
              }
            },
          ),
        ),

        //note: Browse Movie
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
          child: Text("Browse Movie",
              style: blackTextFont.copyWith(
                  fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoadedState) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      state.user.selectedGenres.length,
                      (index) =>
                          BrowseButton(state.user.selectedGenres[index])),
                ),
              );
            } else {
              return SpinKitFadingCircle(
                color: mainColor,
                size: 50,
              );
            }
          },
        ),

        //note : Coming Soon
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
          child: Text(
            "Coming Soon",
            style: blackTextFont.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 140,
          child: BlocBuilder<MovieCubit, MovieState>(
            builder: (context, state) {
              if (state is MovieLoadedState) {
                List<Movie> movies = state.movies.sublist(10);

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.length,
                  itemBuilder: (_, index) => Container(
                    margin: EdgeInsets.only(
                        left: (index == 0) ? defaultMargin : 0,
                        right:
                            (index == movies.length - 1) ? defaultMargin : 16),
                    child: ComingSoonCard(movies[index]),
                  ),
                );
              } else {
                return SpinKitFadingCircle(
                  color: mainColor,
                  size: 50,
                );
              }
            },
          ),
        ),

        //Note: Get Lucky Day
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
          child: Text(
            "Get Lucky Day",
            style: blackTextFont.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Column(
          children: dummyPromo
              .map((e) => Padding(
                  padding:
                      EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 16),
                  child: PromoCard(e)))
              .toList(),
        ),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
