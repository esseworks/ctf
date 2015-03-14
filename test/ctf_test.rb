require 'minitest/autorun'
require 'ctf'

class CtfTest < Minitest::Test
  def test_comparer_require_files
    assert_raises(TypeError) { Ctf::Comparer.compare(nil, nil) } # TODO should raise another runtime/custom error
  end
end