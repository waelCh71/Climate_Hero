import 'package:climate_hero/state%20management%20article/bloc/article_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../global/ui/image_container.dart';
import 'single_article.dart';

class Article extends StatefulWidget {
  const Article({super.key});

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ArticleBloc>(context).getArticles();
  }

  //var controller = PageController();
  //List<String> tabs = ["Articles", "Events"];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        //padding: EdgeInsets.zero,
        children: [
          const _dicoverArticle(),
          BlocBuilder<ArticleBloc, ArticleState>(
            builder: (context, state) {
              if (state is ArticleLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.greenAccent.shade200,
                    strokeWidth: 8,
                    //backgroundColor: Colors.black,
                  ),
                );
              } else if (state is ArticleError) {
                return const Center(
                  child: Text("Error wwhile fetching Data"),
                );
              } else if (state is ArticleLoadedEmpty) {
                return const Center(
                  child: Text("No Article to show"),
                );
              } else if (state is ArticleLoaded) {
                return Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.articles.length,
                      itemBuilder: ((context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SingleArticle(
                                        article: state.articles[index])));
                          },
                          child: Row(
                            children: [
                              ImageContainer(
                                //TODO ADD IMAGE TO ARTICLE
                                imageUrl: "assets/images/solution.png",
                                width: 80,
                                height: 80,
                                margin: const EdgeInsets.all(10),
                                borderRadius: 5,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      state.articles[index]["titre"],
                                      maxLines: 2,
                                      overflow: TextOverflow.clip,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.person_outlined,
                                          size: 18,
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        const Text(
                                          "Publisher: ",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        Text(
                                          state.articles[index]["publisher"],
                                          style: const TextStyle(fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      })),
                );
              } else {
                return const Center(
                  child: Text("Error wwhile fetching Data"),
                );
              }
            },
          )
        ],
      ),
    );
  }
}

class _dicoverArticle extends StatelessWidget {
  const _dicoverArticle();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Articles",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text("Connect with our community from all over the world",
              style: Theme.of(context).textTheme.bodySmall!),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'search',
              fillColor: Colors.grey.shade200,
              filled: true,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none),
            ),
          )
        ],
      ),
    );
  }
}


/* Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () async {
                      controller.nextPage(
                          duration: const Duration(microseconds: 500),
                          curve: Curves.easeInOut);
                    },
                    child: const Text("Articles"),
                  ),
                  TextButton(
                    onPressed: () async {
                      controller.initialPage;
                    },
                    child: const Text("Events"),
                  )
                ],
              ),
            ),
           */
            