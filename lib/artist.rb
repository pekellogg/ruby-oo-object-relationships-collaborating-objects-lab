class Artist

    @@all = []

    def self.all
        @@all
    end

    def self.find_artist(artist_name)
        self.all.find {|artist| artist.name == artist_name}
    end

    def self.find_or_create_by_name(artist_name)
        self.find_artist(artist_name) || self.new(artist_name)
    end

    attr_accessor :name

    def initialize(name)
        @name = name
        self.save
    end

    def save
        self.class.all << self
    end

    def songs
        Song.all.find_all{|song|song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end
end