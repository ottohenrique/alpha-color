task populate: :environment do
  Integer(ENV['TIMES'] || 10_000).times do
    Vote.random.save
  end
end
