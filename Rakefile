desc "clean out gitignored files"
task :clean do
  File.open '.gitignore' do |f|
    f.each do |pattern|
      Dir[pattern.strip].each { |fn| rm fn }
    end
  end
end