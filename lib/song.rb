class Song

    @@all = []

    def self.all
        @@all
    end

    def self.new_by_filename(file)
        files_array = file.split(" - ")
        song = Song.new(files_array[1])
        artist = Artist.find_or_create_by_name(files_array[0])
        artist.add_song(song)
        song
    end

    attr_accessor :name, :artist

    def initialize(name)
        @name = name
        self.save
    end

    def save
        self.class.all << self
    end

    def artist_name=(artist)
        self.artist = Artist.find_or_create_by_name(artist)
    end

end