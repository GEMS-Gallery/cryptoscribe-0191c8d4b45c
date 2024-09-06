import Nat "mo:base/Nat";

import Array "mo:base/Array";
import List "mo:base/List";
import Time "mo:base/Time";
import Text "mo:base/Text";

actor {
  type Post = {
    id: Nat;
    title: Text;
    body: Text;
    author: Text;
    timestamp: Time.Time;
  };

  stable var posts : List.List<Post> = List.nil();
  stable var nextId : Nat = 0;

  public query func getPosts() : async [Post] {
    List.toArray(List.reverse(posts))
  };

  public func createPost(title: Text, body: Text, author: Text) : async () {
    let post : Post = {
      id = nextId;
      title = title;
      body = body;
      author = author;
      timestamp = Time.now();
    };
    posts := List.push(post, posts);
    nextId += 1;
  };
}
