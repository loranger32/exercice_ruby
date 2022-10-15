class Blob
  def initialize(name)
    @name = name

    self.class.define_method(name.to_sym) { puts name }
  end
end

roger = Blob.new("roger")
roger.roger

alphonse = Blob.new("alphonse")
alphonse.alphonse
alphonse.roger