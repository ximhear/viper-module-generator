module Vipergen
	# Cosntants
	class Generator
		# Constants
		LANGUAGES = ["swift", "objc"]
		REPLACEMENT_KEY = "VIPER"
		AUTHOR_REPLACEMENT_KEY = "___FULLUSERNAME___"
		YEAR_REPLACEMENT_KEY = "___YEAR___"
		COMPANY_REPLACEMENT_KEY = "___ORGANIZATIONNAME___"
		PROJECT_REPLACEMENT_KEY = "___PROJECTNAME___"
		FILE_REPLACEMENT_KEY= "___FILENAME___"
		DATE_REPLACEMENT_KEY= "___DATE___"
		BASE_VC_REPLACEMENT_KEY= "_BASE_VIEW_CONTROLLER_"
		BASE_VC_IMPORT_REPLACE_KEY = '#import "_BASE_VIEW_CONTROLLER_.h"'

		# Main method that generate the VIPER files structure
		def self.generate_viper(template, language, name, path, author, company, project, baseviewcontroller)
			puts "Generating VIPER-Module"
			puts "Template: #{template}"
			puts "Language: #{language}"
			puts "Name: #{name}"
			puts "Path: #{path}"
			puts "Author: #{author}"
            puts "Company: #{company}"
            puts "Project: #{project}"
			puts "BaseViewController : #{baseviewcontroller}"
			path_from = Vipergen::FileManager.path_from(template, language)
			path_to = Vipergen::FileManager.destination_viper_path(path, name)
			Vipergen::FileManager.copy(path_from, path_to)
			files = Vipergen::FileManager.files_in_path(path_to)
			rename_files(files, name, author, company, project, baseviewcontroller)
		end

		# Rename all the files in the files array
		# - It renames the name of the file 
		# - It renames the content of the file
		def self.rename_files(files, name, author, company, project, baseviewcontroller)
			files.each do |file|
				raise SyntaxError unless file.include? (Vipergen::Generator::REPLACEMENT_KEY)
				rename_file(file, name, author, company, project, baseviewcontroller)
			end
		end

		# Rename a given file
		# - It renames the name of the file
		# - It renames the content of the file
		def self.rename_file(file, name, author, company, project, baseviewcontroller)
			new_path = file.gsub((Vipergen::Generator::REPLACEMENT_KEY), name)
			Vipergen::FileManager.move(file, new_path)
			rename_file_content(new_path, name, author, company, project, baseviewcontroller)
		end

		# Rename the file content
		# @return: An String with the every VIPER replaced by 'name'
		def self.rename_file_content(filename, name, author, company, project, baseviewcontroller)
			# Reading content
			file = File.open(filename, "rb")
			content = file.read
			file.close

			# Replacing content
			content = content.gsub((Vipergen::Generator::REPLACEMENT_KEY), name)
			content = content.gsub((Vipergen::Generator::AUTHOR_REPLACEMENT_KEY), author)
			content = content.gsub((Vipergen::Generator::YEAR_REPLACEMENT_KEY), "#{Time.new.year}")
			content = content.gsub((Vipergen::Generator::COMPANY_REPLACEMENT_KEY), company)
			content = content.gsub((Vipergen::Generator::PROJECT_REPLACEMENT_KEY), project)
			content = content.gsub((Vipergen::Generator::FILE_REPLACEMENT_KEY), File.basename(filename,File.extname(filename)))
			str = '%02d/%02d/%02d' % [Time.new.day, Time.new.month, Time.new.year%100]
			content = content.gsub((Vipergen::Generator::DATE_REPLACEMENT_KEY), str)
			if baseviewcontroller == 'UIViewController' then
				content = content.gsub((Vipergen::Generator::BASE_VC_IMPORT_REPLACE_KEY), '')
			end
			content = content.gsub((Vipergen::Generator::BASE_VC_REPLACEMENT_KEY), baseviewcontroller)

			# Saving content with replaced string
			File.open(filename, "w+") do |file|
				file.write(content)
			end
		end
	end
end
