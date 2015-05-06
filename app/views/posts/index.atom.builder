atom_feed do |feed|
  feed.title "Guide To Be Blog"
  feed.updated(@posts[0].created_at) if @posts.length > 0
  @posts.each do |post|
    feed.entry post, published: post.published_on do |entry|
      entry.title post.title
      entry.content(post.body.html_safe, type: 'html')
    
      entry.author do |author|
        author.name (post.author)
      end
    end
  end
end