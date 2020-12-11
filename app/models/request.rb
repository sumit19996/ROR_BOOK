class Request < ApplicationRecord
	 enum status: [:pending, :accepted, :rejected]
end