module ApplicationHelper
  def check_for_errors(object, options={})
    render partial: 'shared/form_errors', locals: options.merge!(object: object) if object.errors.any?
  end
  
  def no_records_check(records, name, options = {})
    options[:message] ||= "There are no #{name} to list."
    content_tag :div, options[:message], class: 'empty-list' if records.blank?
  end
  
  def edit_link(path)
    content_tag :span, class: "manage" do
      link_to "edit", path, class: 'edit-link'
    end if logged_in?
  end
  
  def create_link(object, path)
    content_tag :div, class: "manage" do
      link_to "new #{object}", path, class: 'create-link'
    end if logged_in?
  end
  
  def delete_link(object)
    content_tag :div, class: "manage" do
      link_to "delete #{object.class.to_s.downcase}", object, class: 'delete-link', method: 'delete', confirm: 'Are you sure?'
    end if logged_in?
  end
end
