require "./spec/spec_helper"

describe Playlist do

  describe "#select_random_song" do
    it "returns a Song instance" do
      songs_collection = build_list(:song, 25)
      playlist = Playlist.new(songs_collection)

      result = playlist.select_random_song
      expect(result).to be_instance_of Song
    end

    it "returns nil when there are not available songs" do
      playlist = Playlist.new([])

      result = playlist.select_random_song
      expect(result).to be_nil
    end
  end

  context "selecting songs by attributes" do
    before :each do
      @songs = build_list(:song, 25)
    end

    describe "#select_random_song_by_artist" do
      it "returns a song with the specified artist" do
        song = build(:song, :artist => "Johnny Cash")
        song_collection = @songs + [ song ]

        playlist = Playlist.new(song_collection)
        result   = playlist.select_random_song_by_artist("Johnny Cash")

        expect(result).to eql song
      end

      it "doesn't return any song if there isn't any song for the specified artist" do
        playlist = Playlist.new(@songs)

        result = playlist.select_random_song_by_artist("Johnny Cash")
        expect(result).to be_nil
      end
    end

    describe "#select_random_song_by_year" do
      it "returns a song with the specified year" do
        song = build(:song, :year => 1995)
        song_collection = @songs + [ song ]

        playlist = Playlist.new(song_collection)
        result   = playlist.select_random_song_by_year(1995)

        expect(result).to eql song
      end

      it "doesn't return any song if there isn't any song for the specified year" do
        playlist = Playlist.new(@songs)

        result = playlist.select_random_song_by_year(9999)
        expect(result).to be_nil
      end
    end

    describe "#select_random_song_by_genre" do
      it "returns a song with the specified genre" do
        song = build(:song, :genre => "Blues")
        song_collection = @songs + [ song ]

        playlist = Playlist.new(song_collection)
        result   = playlist.select_random_song_by_genre("Blues")

        expect(result).to eql song
      end

      it "doesn't return any song if there isn't any song for the specified genre" do
        playlist = Playlist.new(@songs)

        result = playlist.select_random_song_by_genre("This genre does not exist")
        expect(result).to be_nil
      end
    end
  end
end