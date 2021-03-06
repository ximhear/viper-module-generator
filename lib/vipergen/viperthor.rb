require 'thor'
require 'vipergen'

module Vipergen
  class ViperThor < Thor
	desc "generate MODULE", "Generate a VIPER module"
	option :language, :required => false, :default => 'swift', :type => :string, :desc => "The language of the generated module (swift, objc)"
	option :template, :required => false, :default => 'default', :type => :string , :desc => "Template for the generation"
	option :path, :required => false, :default => './', :type => :string , :desc => "Path where the output module is going to be saved"
	option :author, :required => false, :default => 'AuthorXXX', :type => :string , :desc => "Author to be specified on the file's header. Otherwise VIPER will be used"
	option :company, :required => false, :default => 'CompanyXXX', :type => :string, :desc => "Company to be specified on the file's header. Otherwise Company will be used"
	option :project, :required => false, :default => 'ProjectXXX', :type => :string, :desc => "Project to be specified on the file's header. Otherwise Project will be used"
	option :base, :required => false, :default => 'UIViewController', :type => :string, :desc => "View Controller의 베이스 클래스 이름"
	def generate(name)
	   Vipergen::Generator.generate_viper(options[:template], options[:language], name, options[:path], options[:author], options[:company], options[:project], options[:base])
	end

	desc "g MODULE", "Generate a VIPER module"
	option :language, :required => false, :default => 'swift', :type => :string, :desc => "The language of the generated module (swift, objc)"
	option :template, :required => false, :default => 'default', :type => :string , :desc => "Template for the generation"
	option :path, :required => false, :default => './', :type => :string , :desc => "Path where the output module is going to be saved"
	option :author, :required => false, :default => 'AuthorXXX', :type => :string , :desc => "Author to be specified on the file's header. Otherwise VIPER will be used"
	option :company, :required => false, :default => 'CompanyXXX', :type => :string, :desc => "Company to be specified on the file's header. Otherwise Company will be used"
	option :project, :required => false, :default => 'ProjectXXX', :type => :string, :desc => "Project to be specified on the file's header. Otherwise Project will be used"
	option :base, :required => false, :default => 'UIViewController', :type => :string, :desc => "View Controller의 베이스 클래스 이름"
	def g(name)
		Vipergen::Generator.generate_viper(options[:template], options[:language], name, options[:path], options[:author], options[:company], options[:project], options[:base])
	end

	desc "templates", "Get a list of available templates"
	def templates()
		puts Vipergen::TemplateManager.templates_description()
	end
  end
end
