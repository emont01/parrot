SRC_DIR = File.join(File.dirname(__FILE__), 'src')
TEST_DIR = File.join(File.dirname(__FILE__), 'test')

require 'rake/testtask'

task :default => :run_parrot

desc "Test parrot proyect"
Rake::TestTask.new do |t|
    t.libs << ['src', 'test']
    t.test_files = FileList['test/test*.rb']
    t.verbose = true
end

desc "Run parrot bot"
task :run_parrot do
    cd 'src'
    sh "ruby -I #{SRC_DIR} 'parrot.rb'"
end

