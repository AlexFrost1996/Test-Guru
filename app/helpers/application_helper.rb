module ApplicationHelper

  def github_url(author, repo)
    link_to 'TestGuru Project', "https://github.com/#{author}/#{repo}", target: "_blank"
  end
  
  def current_year
    DateTime.now.year
  end

end
