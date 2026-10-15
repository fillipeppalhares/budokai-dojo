# Local-preview shim only (GitHub's build runs an older Ruby and never loads this).
# Liquid 4.0.3, pinned by the github-pages gem, calls String#tainted?, which was
# removed in Ruby 3.2.
class Object
  def tainted?
    false
  end
end
