class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  #===| STEP 4. Optional, in this case, it is not required |============
  # def devise_mailer # optional
  #   UserConfirmationMailer
  # end
end
