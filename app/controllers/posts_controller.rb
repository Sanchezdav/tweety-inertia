class PostsController < ApplicationController
  def index
    posts = Post.all
    render inertia: 'Posts/Index', props: {
      posts: jbuilder do |json|
        json.array!(posts) do |post|
          json.extract! post, :id, :content, :created_at
          json.user do
            json.email post.user.email
            json.name post.user.name.familiar
            json.avatar post.user.gravatar_url
          end
        end
      end
    }
  end
end
