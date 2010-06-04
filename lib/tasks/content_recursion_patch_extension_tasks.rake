namespace :radiant do
  namespace :extensions do
    namespace :content_recursion_patch do
      
      desc "Runs the migration of the Content Recursion Patch extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          ContentRecursionPatchExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          ContentRecursionPatchExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Content Recursion Patch to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from ContentRecursionPatchExtension"
        Dir[ContentRecursionPatchExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(ContentRecursionPatchExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory, :verbose => false
          cp file, RAILS_ROOT + path, :verbose => false
        end
      end  
    end
  end
end
