class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :payout_rate, :email

  def email
    object.user.email
  end
end
