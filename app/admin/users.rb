ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name, :birth_date, :gender, :image, :about, :cover_image, :deleted_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :first_name, :last_name, :birth_date, :gender, :image, :about, :cover_image, :deleted_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :birth_date
    column :gender
    actions
  end

  show do |user|
    attributes_table do
      row :id
      row :first_name
      row :last_name
      row :email
      row :birth_date
      row :status
    end
    panel "Posts" do
      table_for(user.posts.order(created_at: :desc)) do |post|
        column :caption
        column :created_at
        column do link_to "View", admin_post_path end
        # column :permalink
        # column :is_visible
      end
    end
    # active_admin_comments
    # panel "List of Posts By User :" do
    #   div do
    #     Post.where(user_id: params[:id]).order(created_at: :desc).map do |post|
    #       columns do
    #         column do
    #          link_to(post.id, admin_post_path(post))
    #         end
    #         column do
    #          post.caption
    #         end
    #       end
    #     end
    #   end
    # end
  end
  
end
