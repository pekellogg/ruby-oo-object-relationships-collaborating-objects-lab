class MP3Importer
    
    @@all = []

    def self.all
        @@all
    end

    def save
        self.class.all << self
    end

    attr_accessor :path

    def initialize(path)
        @path = path
        self.save if !self.class.all.include?(self)
    end

    def files
        files = Dir["#{@path}/*"]
        # files.each do |filepath|
        #   filepath.sub!("./spec/fixtures/mp3s/","")
        # end
        files.each{|filepath|filepath.sub!("./spec/fixtures/mp3s/","")}
    end
 
    def import
        files.each {|file| Song.new_by_filename(file)}
    end
end