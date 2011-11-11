<% broadcast "/messages/new" do %>
    box = $("#<%= department.id %>-box table")
    box.find('.wait_num span.num').html("<%= department.active_guests.count %>")

    skip = box.find('.skip_num span.num')
    skip.empty()

    <% department.pass_guests.each do |guest| %>
      skip.append("<%= guest.accept_number %> ")
    <% end %>

    <% if section %>
      section_box = $("#<%= department.id %>-<%= section.id %>-box")

      <% if guest %>
        section_box.find('span.num').html("<%= guest.accept_number %>")
        sounds = sound_list([
          <% sound_paths( guest.accept_number, department.name, section.name ).each do |path| %>
            '<%= path %>',
          <% end%>
        ])
      <% else %>
        section_box.find('span.num').html("")
      <% end %>
    <% end %>

    box.effect('highlight').effect('highlight').effect('highlight')
<% end %>