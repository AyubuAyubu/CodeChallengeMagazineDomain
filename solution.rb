# Please copy/paste all three classes into this file to submit your solution!

class Article
    
    @@all_articles=[]

    def initialize(author,magazine,title)
     @author=author
     @magazine=magazine
     @title=title
     @@all_articles << self
    end

    def title
     @title
    end

    def self.all
     @@all_articles
    end

    def author
        @author.name
    end

    def magazine
     @author.magazine
    end

end

#Author class 
class Author 
  attr_reader :name

  @@all_authors=[]

  def initialize(name)
    @name = name
    @@all_authors << self
  end
  
  def self.all
   @@all_authors
  end

  def articles
   Article.all.filter{|article| article.author.name == @name}
  end

  def magazines
    #Magazine.contributed
    articles.all.collect{|article| article.magazine}.uniq
  end

 def add_article(magazine,title)
   Article.new(magazine,title,self)
 end

 def topic_areas
   Magazine.collect{|magazine|magazine.category}.uniq
 end

 def self.find_by_name
   Author.all.find{|magazine|magazine.name == name}
 end
end

#Magazine class
class Magazine
  attr_accessor :name, :category

  @@all_magazines=[]

  def initialize(name, category)
    @name = name
    @category = category
    @@all_magazines << self
  end

  def self.all
   @@all_magazines
  end

  def magazine_articles
    Article.all.filter{|article| article.magazine.name == @name}
  end

  def contributors
   #articles=Article.all.filter{|article| article.magazine.name == @name}
   #articles.collect{|article|article.author}.uniq
  all_authors.uniq
  end 

  def self.find_by_name(name)
   # magazine=self.all.find{|search_name|search_name.name.include?(name) }
    #magazine.name
    Magazine.all.find{|magazine|magazine.name==name}
  end

  def article_titles
   #articles=Article.all.collect{|title| title.magazine.name == @name} 
   magazine_articles.collect{|article|article.title}
  end

   def all_authors
    magazine_articles.collect{|article|article.author}
   end

  def contributing_authors
    author_books=[]
    all_authors.tally.each{|key,value|value>2 && {author_books<<key}}
    author_books.map{|name|Author.find_by_name{name}}
  end
  
end
