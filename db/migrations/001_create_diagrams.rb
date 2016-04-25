Sequel.migration do
  change do
    create_table(:diagrams) do
      primary_key :id
      String :title
      String :text
      String :theme
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
