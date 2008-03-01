require File.dirname(__FILE__) + '/../spec_helper'

describe Photo, 'when selected' do
  
  fixtures :photos
  
  before do
    @photo3 = Photo.find 9
    @photo2 = Photo.find 5
    @photo1 = Photo.find 1
  end
  
  it 'should be able to determine the next photo' do
    @photo3.next.should == @photo2
    @photo2.next.should == @photo1
    @photo1.next.should be_nil
  end
  
  it 'should be able to determine the previous photo' do
    @photo3.previous.should be_nil
    @photo2.previous.should == @photo3
    @photo1.previous.should == @photo2
  end

end