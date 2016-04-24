Sequel.migration do
  change do
    create_table(:diagrams) do
      primary_key :id
      String :title
      String :text
      DateTime :created_at
      DateTime :updated_at
    end
  end
end
