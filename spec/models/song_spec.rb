require "./spec/spec_helper"

describe Song do
  let(:song) {
    build(:song)
  }

  describe ".build_from_hash" do
    let(:song){
      Song.build_from_hash(
        "id"     => "S001",
        "name"   => "Everlong",
        "artist" => "Foo Fighters",
        "album"  => "The Colour and the Shape",
        "genre"  => "Rock",
        "price"  => 2.5
      )
    }

    it "should have name" do
      expect(song.name).to eql("Everlong")
    end

    it "should have album" do
      expect(song.album).to eql("The Colour and the Shape")
    end

    it "should have artist" do
      expect(song.artist).to eql("Foo Fighters")
    end

    it "should have genre" do
      expect(song.genre).to eql("Rock")
    end
  end

  describe "#as_hash" do
    it "returns the Song instance represented as a hash with all its instance variables as keys" do
      expected_keys = ["id", "name", "album", "artist", "genre", "length", "year", "price"]
      expect(song.as_hash.keys).to match_array(expected_keys)
    end

    it "returns the Song instance represented as a hash with all its instance variables' values as values" do
      song_as_hash = song.as_hash

      expect(song_as_hash["name"]).to match(/AmazingSong/i)
      expect(song_as_hash["album"]).to match(/AmazingAlbum/i)
      expect(song_as_hash["artist"]).to match(/AmazingArtist/i)
    end
  end
end

