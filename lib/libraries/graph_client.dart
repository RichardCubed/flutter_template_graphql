import 'package:graphql_flutter/graphql_flutter.dart';

class GraphClient {
  GraphQLClient _client;

  final HttpLink httpLink = HttpLink(
      uri:
          'https://yggacrkx5rc4dnclfywzufsskq.appsync-api.ap-southeast-2.amazonaws.com/graphql',
      headers: {"x-api-key": "da2-fmncli5wmzcjhnxh3oarte4lqm"});

  GraphQLClient get client {
    _client ??= GraphQLClient(
      cache: InMemoryCache(),
      link: httpLink,
    );
    return _client;
  }
}
