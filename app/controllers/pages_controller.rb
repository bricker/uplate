class PagesController < ApplicationController  
  def home
    @homepage_header          = Content.find_by_title('homepage_header').try(:content).to_s
    @promo_header             = Content.find_by_title("promo_header").try(:content).to_s
    @promo_video_embed_code   = Content.find_by_title("promo_video_embed_code").try(:content).to_s
    @promo_about              = Content.find_by_title("promo_about").try(:content).to_s
  end
  
  def tickets
    @tickets_content = Content.find_by_title("tickets").try(:content).to_s
  end
end
