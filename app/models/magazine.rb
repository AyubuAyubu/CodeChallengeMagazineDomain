class Magazine
  #The name and category of the magazine **can be** changed after being initialized
  attr_accessor :name, :category

  @@all_magazines=[]
  
  #A magazine is initialized with a name as a string and a category as a string
  def initialize(name, category)
    @name = name
    @category = category
    @@all_magazines << self
  end
  
  #Returns an array of all Magazine instances
  def self.all
   @@all_magazines
  end
  
  #Returns an array of Author instances who have written for this magazine
  #part 1-return magazines
  def magazine_articles
    Article.all.filter{|article| article.magazine.name == @name}
  end
  
  #part 2
  def all_authors
    magazine_articles.collect{|article|article.author}
  end
 
  #part 3
  def contributors
   #articles=Article.all.filter{|article| article.magazine.name == @name}
   #articles.collect{|article|article.author}.uniq
  all_authors.uniq
  end 

  #Given a string of magazine's name, this method returns the first magazine object that matches
  def self.find_by_name(name)
   # magazine=self.all.find{|search_name|search_name.name.include?(name) }
    #magazine.name
    Magazine.all.find{|magazine|magazine.name==name}
  end
  
  #Returns an array strings of the titles of all articles written for that magazine
  def article_titles
   #articles=Article.all.collect{|title| title.magazine.name == @name} 
   magazine_articles.collect{|article|article.title}
  end
  
  #Returns an array of authors who have written more than 2 articles for the magazine
  def contributing_authors
    author_books=[]
    all_authors.tally.each{|key,value|value>2 && {author_books<<key}}
    author_books.map{|name|Author.find_by_name{name}}
  end
  
end
