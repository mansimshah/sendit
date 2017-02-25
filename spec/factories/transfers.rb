FactoryGirl.define do
  factory :transfer do
    email_to   { FFaker::Internet.email }
    email_from   { FFaker::Internet.email }
    attachment { File.new("#{Rails.root}/spec/support/fixtures/ruby.png") }
  end
end