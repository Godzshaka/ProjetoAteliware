class Repository < ApplicationRecord

  def self.update_trending_topics
    Repository.delete_all

    url = 'https://api.github.com/search/repositories?q=language:python&sort=stars&order=desc&per_page=10'
    request = RestClient.get(url)
    @get_github_python=JSON.parse(request.body).with_indifferent_access[:items]

    #getting ruby trendings
    url = 'https://api.github.com/search/repositories?q=language:ruby&sort=stars&order=desc&per_page=10'
    request = RestClient.get(url)
    @get_github_ruby=JSON.parse(request.body).with_indifferent_access[:items]

    #getting assembly trendings
    url = 'https://api.github.com/search/repositories?q=language:assembly&sort=stars&order=desc&per_page=10'
    request = RestClient.get(url)
    @get_github_assembly= JSON.parse(request.body).with_indifferent_access[:items]

    #getting java trendings
    url = 'https://api.github.com/search/repositories?q=language:java&sort=stars&order=desc&per_page=10'
    request = RestClient.get(url)
    @get_github_java=JSON.parse(request.body).with_indifferent_access[:items]

    #getting php trendings
    url = 'https://api.github.com/search/repositories?q=language:php&sort=stars&order=desc&per_page=10'
    request = RestClient.get(url)
    @get_github_php= JSON.parse(request.body).with_indifferent_access[:items]

    @get_github_ruby.each do |subhash|
      repository = Repository.create(
        external_id: subhash[:id],
        name: subhash[:name],
        language: subhash[:language],
        owner_name: subhash[:owner][:login]
       )
    end

    @get_github_php.each do |subhash|
      repository = Repository.create(
        external_id: subhash[:id],
        name: subhash[:name],
        language: subhash[:language],
        owner_name: subhash[:owner][:login]
      )
    end

    @get_github_java.each do |subhash|
      repository = Repository.create(
        external_id: subhash[:id],
        name: subhash[:name],
        language: subhash[:language],
        owner_name: subhash[:owner][:login]
      )
    end

    @get_github_python.each do |subhash|
      repository = Repository.create(
        external_id: subhash[:id],
        name: subhash[:name],
        language: subhash[:language],
        owner_name: subhash[:owner][:login]
      )
    end

    @get_github_assembly.each do |subhash|
      repository = Repository.create(
        external_id: subhash[:id],
        name: subhash[:name],
        language: subhash[:language],
        owner_name: subhash[:owner][:login]
      )
    end
  end
end