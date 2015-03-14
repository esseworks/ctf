namespace :ctf do

  desc "Compare Translation Files"
  task :compare, [:lang_file_1, :lang_file_2] => :environment do |t, args|
    Ctf::Comparer.compare(args.lang_file_1, args.lang_file_2)
  end

end
