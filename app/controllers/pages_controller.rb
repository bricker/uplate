class PagesController < ApplicationController  
  def home
    @promo_header = Content.find_by_title("promo_header").try(:content)
    @promo_video_embed_code = Content.find_by_title("promo_video_embed_code").try(:content)
    @promo_about = Content.find_by_title("promo_about").try(:content)
  end
  
  def tickets
    @tickets_content = Content.find_by_title("tickets").try(:content)
  end
end
