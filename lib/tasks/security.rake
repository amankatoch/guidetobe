task :rails_best_practices do
  path = File.expand_path("../../../", __FILE__)
  sh "bundle exec rails_best_practices #{path}"
end

task :brakeman do
  sh "brakeman -q -z"
end

task :check do
  Rake::Task['spec'].invoke
  Rake::Task['cucumber'].invoke
  Rake::Task['brakeman'].invoke
end

task :deploy do
  Rake::Task['check'].invoke
  sh 'git push'
  sh "git push heroku master"
end