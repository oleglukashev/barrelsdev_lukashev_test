<% if @item.save %>
  $('.items-list').append "<%= j(render @item) %>"
<% else %>
  console.log "<%= j(@item.to_json)%>"
<% end %>