class Article
    
    @@all_articles=[]
    
    #An article is initialized with an author as an Author object, a magazine as a Magazine object, and title as a string
    def initialize(author,magazine,title)
     @author=author
     @magazine=magazine
     @title=title
     @@all_articles << self
    end
    
    #Returns the title for that given article
    def title
     @title
    end
    
    #Returns an array of all Article instances
    def self.all
     @@all_articles
    end
    
    #Returns the author for that given article
    def author
        @author.name
    end

    #Returns the magazine for that given article
    def magazine
     @author.magazine
    end

end

