require File.dirname(__FILE__) + '/../../spec_helper'
require File.dirname(__FILE__) + '/fixtures/classes'
require File.dirname(__FILE__) + '/key_spec'

describe "Hash#include?" do
  it_behaves_like(@hash_key_p, :include?)
end
