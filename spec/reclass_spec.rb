require("spec_helper")

RSpec.describe(Reclass) do
  class Foo
    def initialize(x)
      @x = x
    end
  end

  class Bar
    attr_reader(:x)

    def initialize(x)
      @x = x
    end
  end

  it("has a version number") do
    expect(Reclass::VERSION).not_to be nil
  end

  it("fails is the parameter is not a class") do
    expect { 1.reclass("") }.to(raise_error(TypeError, /expected Class/))
  end

  it("changes the class of an object") do
    obj = Foo.new("lol")
    obj.reclass(Bar)
    expect(obj).to(be_a(Bar))
  end

  it("preserves ivars") do
    # The Bar class needs to be primed for the VM to see it's ivars
    Bar.new("wat")
    expect(Foo.new("lol").reclass(Bar).x).to(eq("lol"))
  end
end
