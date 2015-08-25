  module SessionHelpers

  def token_generator
  	(0..20).map { (65 + rand(26)).chr }.join
  end
end