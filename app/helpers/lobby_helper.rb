module LobbyHelper

  def department_checkbox(form,department)
    content_tag :div, :class => "well span5 checkbox" do
      form.radio_button( :department_id, department.id) + 
      form.label( "department_id_#{department.id}", department.name)
    end    
  end

end
