Viper Module Generator G version
======================
[![Code Climate](https://codeclimate.com/github/teambox/viper-module-generator/badges/gpa.svg)](https://codeclimate.com/github/teambox/viper-module-generator)
[![Build Status](https://travis-ci.org/teambox/viper-module-generator.svg?branch=master)](https://travis-ci.org/teambox/viper-module-generator)
[![Test Coverage](https://codeclimate.com/github/teambox/viper-module-generator/badges/coverage.svg)](https://codeclimate.com/github/teambox/viper-module-generator)
[![Dependency Status](https://gemnasium.com/teambox/viper-module-generator.svg)](https://gemnasium.com/teambox/viper-module-generator)


![image](http://www.objc.io/images/issue-13/2014-06-07-viper-intro.jpg)

Gem to generate VIPER modules to use them in your Swift projects
The implementation scheme returned by this generator is hardly inspired in the example and post of Objc.io, http://www.objc.io/issue-13/viper.html .

- [Features](#features)
  - [Changelog](#changelog-0.1)
  - [Expected in version 0.2](#expected-in-version-0.2)
- [Viper files structure](#viper-files-structure)
- [How to install vipergen](#how-to-install-vipergen)
- [How to generate a VIPER module with a given name?](#how-to-generate-viper-module-with-a-given-name?)
- [Developer tips](#developer-tips)
  - [Update the gem](#update-the-gem)
  - [Add a new template](#add-a-new-template)
- [Resources](#resources)

## Features
- Generates the module in Swift
- Ready to be installed as a gem https://rubygems.org/gems/vipergeng

### Changelog 0.2.23
- 날짜 포맷을 바꿈.

### Changelog 1.0.1
- g command 추가.
- generate or g 사용시 --path 인자를 지정하지 않으면 현재 폴더에 생성하도록 수정

### Changelog 1.0.2
- g/generate command에 --base 추가. base에는 ViewController의 base class를 지정한다. 디폴트값은 UIViewController이다.
- ViewController 소스에 viewWill/DidAppear, viewWill/DidDisappear 추가

### Changelog 1.0.6
- Swift/Objc 템플릿 코드 수정.
- ViewController 코드에 코멘트로 샘플 코드 추가.

## Viper files structure
```bash
.swift
+-- DataManager
|   +-- VIPERDataManager.swift
+-- Interactor
|   +-- VIPERInteractor.swift
+-- Presenter
|   +-- VIPERPresenter.swift
+-- ViewController
|   +-- VIPERViewController.swift
+-- WireFrame
|   +-- VIPERWireFrame.swift
+-- Protocols
|   +-- VIPERProtocols.swift
```
## How to install vipergeng ?
You can install it easily as using the gem. With ruby installed in your OSX execute:
```bash
sudo gem install vipergeng
```
If everything were right, you should have now the vipergeng command available in your system console

## How to generate a VIPER module with a given name?
You have just to execute the following command

--path 지정을 하지 않으면 현재 폴더에 생성.
```bash
vipergeng generate MyFirstViperModule --path=~/myproject/shared
```
or
```bash
vipergeng g MyFirstViperModule
```
Another example:
```bash
vipergeng generate MySecondViperModule --path=~/myproject/shared --author='My Name' --company='My Company' --project='project name --base=MyBaseViewController'
```

And then the files structure will be automatically created. Don't forget to add this folder to your project dragging it into the XCode/Appcode inspector

## Developer tips
### Update the gem 
When the gem is updated it has to be reported to the gem repository. I followed this tutorial http://amaras-tech.co.uk/article/43/Creating_executable_gems that basically says that once you have your gem ready execute:
```bash
gem build vipergeng.gemspec
gem install vipergeng-0.1.gem
gem push vipergeng-0.1.gem
```
Then you'll be asked for your credentials in order to make the update in the repo (http://guides.rubygems.org/publishing/)
``
### Add a new template
Are you interested in VIPER and you would like to contribute with this gem adding new templates? Feel free to do it. It's pretty easy. You've just to:
- Create a folder inside `templates` with the name of your template
- You'll have to create inside the templates in Swift (get inspired from existing templates)
- Use the word VIPER where you want the name to be replaced in.
- Remember to add the file viperspec.yml with the description of your template as below:
```yaml
author: pepi
author_email: pepibumur@gmail.com
template_description: Default template with the simplest structure using VIPER
updated_at: 2014-08-24
```
- Report it as a PR in this repo updating the gem version in Gemspec.

## VIPER 참조 사이트
- https://www.objc.io/issues/13-architecture/viper/
- https://swifting.io/blog/2016/03/07/8-viper-to-be-or-not-to-be/

## Resources
- Rspec documentation: http://rubydoc.info/gems/rspec-expectations/frames
- XCode Plugins: http://nshipster.com/xcode-plugins/
- XCodeProj gem (to modify project groups structure): https://github.com/CocoaPods/Xcodeproj
- Thor, powerful Ruby library for command line: http://whatisthor.com/
- Cocoa Design Patterns: https://developer.apple.com/legacy/library/documentation/Cocoa/Conceptual/CocoaFundamentals/CocoaDesignPatterns/CocoaDesignPatterns.html

## Contact
If you have any doubt about the gem or even if you want to make any suggestion you can do it directly to my email address, pedro@redbooth.com . You can use the issues Github page too
