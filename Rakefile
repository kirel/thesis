desc "clean out gitignored files"
task :clean do
  File.open '.gitignore' do |f|
    f.each do |pattern|
      Dir[pattern.strip].each { |fn| rm fn }
    end
  end
end

desc "list TODO items"
task :todo do
  puts "LaTeX files containing TODO"
  system 'ack -l TODO **/*.tex'
end