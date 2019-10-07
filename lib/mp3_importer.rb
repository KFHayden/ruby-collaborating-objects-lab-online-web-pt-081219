class MP3Importer
  
  attr_accessor :path
 
  def initialize(path)
    @path = path
    @path = []
    @path << self
  end
  
  def files
    files = []
    Dir.new(self.path).each{|file| files << file if file.length > 4}
    files
  end
  
  def import
    self.files.each{|filename| Song.new_by_filename(filename)}
    Dir.new(self.path)
  end
  
end