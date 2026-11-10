class PaginatedResponse<T> {
  final int count;
  final int pages;
  final String? next;
  final String? previous;
  final List<T> results;

  const PaginatedResponse({
    required this.count,
    required this.pages,
    this.next,
    this.previous,
    required this.results,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic> json) fromJson,
  ) {
    return PaginatedResponse<T>(
      count: json['info']['count'],
      pages: json['info']['pages'],
      next: json['info']['next'],
      previous: json['info']['prev'],
      results: (json['results'] as List)
          .map((item) => fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
