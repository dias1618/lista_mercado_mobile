abstract class Controller<T>{
  Future post(T object);
  Future get(int id);
  Future put(T object);
  Future delete(int id);
  Future find(Map<String, dynamic>? query);
}