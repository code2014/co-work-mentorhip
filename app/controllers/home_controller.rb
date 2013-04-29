class HomeController < ApplicationController
  def index
    @providers = User.find(:all,:conditions => "details_type = 'Company' OR details_type = 'Individual'");
    @users = User.all;
    @promoted = @providers.pop;
    @nonprofit = @providers.pop;
    @popular = @providers.pop(2);
    @recommended = @providers.pop(4);
    @rec = @providers.pop(4);
    @featured = @providers.pop(3);
  end
  
  def team
  end
  
  def patrick
  end
  
  def julian
  end

  def terms
  end
  def privacy
  end
  
end