require 'sinatra'
require 'sinatra/activerecord'

set :bind, '0.0.0.0'
set :port, 4000
set :database, "sqlite3:../db/development.sqlite3"

get '/' do
  @dbtables = ActiveRecord::Base.connection.tables
  @dbtables.delete_if { |t| t == "schema_migrations" }
  erb :dblist, :layout => :layout
end

__END__


@@layout
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>AdminRB</title>
  <style>
    table, th, td {
      border: 1px solid black;
      padding: 2px;
    }

    th {
      background-color: #444;
      color: #fff;
    }

    .shadebg {
      background-color: #ccc;
    }
  </style>
</head>
<body>
  <h2><a href="http://github.com/ATMartin/AdminRB">AdminRB</a></h2>
  <hr>
  <%= yield %>
  <br />
  <hr>
  Crafted by <a href="http://twitter.com/ADotMartin">@ADotMartin</a>!
</body>
</html>


@@dblist
<% @dbtables.each do |table_name| %>
  <h3>Table Name: "<%= table_name %>"</h3>
  <table>
    <tr>
      <% ActiveRecord::Base.connection.columns(table_name).each do |column_name| %>
        <th><%= column_name.name %></th>
      <% end %>
    </tr>
    <% row_iterator = 1 %>
    <% ActiveRecord::Base.connection.select_all("SELECT * FROM #{table_name}").each do |row_content| %>
      <%= row_iterator % 2 == 0 ? "<tr class='shadebg'>" : "<tr>" %>
        <% row_content.each do |object_attribute| %>
          <td><%= object_attribute[1] %></td>
        <% end %>
      </tr>
      <% row_iterator += 1 %>
    <% end %>
  </table>
<% end %>
