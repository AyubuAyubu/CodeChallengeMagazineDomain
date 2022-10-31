class Author
  #A name **cannot** be changed after it is initialized
  attr_reader :name

  @@all_authors=[]

  #An author is initialized with a name, as a string
  def initialize(name)
    @name = name
    @@all_authors << self
  end
  
  def self.all
   @@all_authors
  end

  #Returns an array of Article instances the author has written
  def articles
   Article.all.filter{|article| article.author.name == @name}
  end

  #Returns a **unique** array of Magazine instances for which the author has contributed to
  def magazines
    #Magazine.contributed
    articles.all.collect{|article| article.magazine}.uniq
  end
 
  #Given a magazine (as Magazine instance) and a title (as a string), creates a new Article instance and associates it with that author and that magazine
 def add_article(magazine,title)
   Article.new(magazine,title,self)
 end
 
 #Returns a **unique** array of strings with the categories of the magazines the author has contributed to
 def topic_areas
   Magazine.collect{|magazine|magazine.category}.uniq
 end

 def self.find_by_name
   Author.all.find{|magazine|magazine.name == name}
 end
end
