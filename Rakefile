SRC_DIR = File.join(File.dirname(__FILE__), 'src')
TEST_DIR = File.join(File.dirname(__FILE__), 'test')

task :default => :test_parrot

desc "Test parrot proyect"
task :test_parrot do
    cd 'test'
    sh "ruby -I #{SRC_DIR} -I #{TEST_DIR} 'test_parrot.rb'"
end

desc "Run parrot bot"
task :run_parrot do
    cd 'src'
    ruby 'parrot.rb'
end

