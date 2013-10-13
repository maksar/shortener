class Browser
  attr_reader :name, :abbreviation

  def initialize name, abbreviation
    @name = name
    @abbreviation = abbreviation
  end

  def self.all
    [
      Browser.new("Firefox", :firefox),
      Browser.new("Opera", :opera),
      Browser.new("Chrome", :chrome),
      Browser.new("Internet Explorer", :ie),
      Browser.new("Safari", :safari)
    ]
  end

  def self.by_name name
    all.detect do |browser|
      browser.name == name
    end
  end

end