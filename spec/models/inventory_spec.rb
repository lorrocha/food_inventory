require 'spec_helper'

describe Inventory do
  it {should have_valid(:title).when('12312313', 'sdcwe')}
  it {should_not have_valid(:title).when(nil, '')}

  it {should have_valid(:description).when('12312313', 'sdcwe')}
  it {should_not have_valid(:description).when(nil, '')}

  it {should have_valid(:quantity).when('12312313', 23)}
  it {should_not have_valid(:quantity).when(nil, '', 'bazinga')}
end
