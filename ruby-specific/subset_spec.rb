require File.expand_path('../spec_helper', __FILE__)
Solution.subset

describe "subset?" do

  it "should return true for an empty set" do
    needles  = []
    haystack = [a, b, c]
    subset?(needles, haystack).should == true
  end

  it "should return true if in haystack" do
    needles  = [a]
    haystack = [a]
    subset?(needles, haystack).should == true
  end

  it "should return false if not in haystack" do
    needles  = [a]
    haystack = [b]
    subset?(needles, haystack).should == false
  end

  it "should return true if in different order" do
    needles  = [a, b, c]
    haystack = [b, a, c]
    subset?(needles, haystack).should == true
  end

  it "should return false if haystack smaller" do
    needles  = [a, b, c]
    haystack = [a, b]
    subset?(needles, haystack).should == false
  end

  it "should return true if extra values" do
    needles  = [a, b, c]
    haystack = [b, q, r, n, a, c]
    subset?(needles, haystack).should == true
  end

  it "should return false if missing one value" do
    needles  = [a, b, c]
    haystack = [q, r, n, a, c]
    subset?(needles, haystack).should == false
  end

  it "should return false if not enough of the multiple value" do
    needles  = [a, a, b, c]
    haystack = [b, q, r, n, a, c]
    subset?(needles, haystack).should == false
  end

  it "should return true if more of multiple value" do
    needles  = [a, a, b, c]
    haystack = [b, a, a, a, c]
    subset?(needles, haystack).should == true
  end

end
