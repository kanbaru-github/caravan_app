class BlogsController < ApplicationController

  def show
    @blog = Blog.find(params[:id])
    # URLにパラメータが設定されているので、params[:id]と記述することで記事のIDを取得できます。
  end

  def index
    @blogs = Blog.all
    p "標準出力にのみ反映"
    # このprintデバッグでは一覧表示の中身をログに出力させます。
    logger.debug("標準出力とログファイルに記録される")
    # デバッグの結果を記録しておきたい場合もあると思います。
    # こういった場合にはlog/development.logなどログファイルに記録されるようにデバッグを行わなければなりません。
  end

  def new
    @blog = Blog.new
    # Blog.newと記述すると、空のモデルが生成されます。
  end

  def create
    # createアクションは、newアクションの下に追加して、関係性をわかりやすくしましょう。
    blog = Blog.new(blog_params)
    # paramsはRailsで送られてきた値を受け取るためのメソッドです。
    binding.pry
    # 変数blogにどういった値が入っているのかを確認してみます。
    blog.save
    redirect_to blogs_path(blog.id)
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :category, :body)
  end

end
