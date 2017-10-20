class Ad < ActiveRecord::Base

  #Callback
  before_save :md_to_html

  #associações
  belongs_to :category, counter_cache: true
  belongs_to :member

  #validates
  validates :title, :description_md, :description_short, :category, :price, :picture, :finish_date, presence:true
  validates :price, numericality: { greater_than: 0 }


  # scopo
  scope  :descending_order, -> (quantity = 10) { order(created_at: :desc).limit(quantity) }
  scope  :to_the, -> (member) { where(member: member) }
  scope  :by_category, -> (id) { where(category: id) }

  #PaperClip
  has_attached_file :picture, styles: { medium: "320x150#", thumb: "100x100>", large: "800x300#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/

  #gem money rails
  monetize :price_cents

  private

  #função que converte o markdown em html passando ass opções 
    def md_to_html
      
      options = {
        filter_html: true,
        link_attributes: {
          rel: "nofollow",
          target: "_blank"
        }
      }

      extensions = {
        space_after_headers: true,
        autolink: true
      }

      renderer = Redcarpet::Render::HTML.new(options)
      markdown = Redcarpet::Markdown.new(renderer, extensions)

      self.description = markdown.render(self.description_md)

    end
end