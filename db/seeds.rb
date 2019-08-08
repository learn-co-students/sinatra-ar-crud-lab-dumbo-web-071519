Article.destroy_all

articles = [
    {title: "Hello World!",
    content: "This is my first article!"},
    {title: "Second article",
    content: "This is my second article!"}
    ]

Article.create(articles)