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

desc "generate art file"
task :art do
  File.open 'art.tex', 'w+' do |f|
    f.puts "\\input{art-pre}\n\n"
    Dir['art/*.png'].each do |fn|
      mv fn, fn.gsub(' ', '_') if fn =~ / /
      f.puts '\includegraphics[width=0.2\textwidth]{%s}' % fn.gsub(' ', '_')
    end    
  end
end
