class Profile < ActiveRecord::Base
  belongs_to :user
  
  validates :gender, :inclusion => { :in => %w(male female),
    :message => "Only male/female supported." }
  
  validate :first_or_last
  validate :boy_named_sue

  def first_or_last
    if first_name.nil? && last_name.nil?
        errors.add(:first_name, "Specify a first or a last.")
    end
  end

#For some backwards reason this assignment won't allow it. 
#Well done JHU on being offensive for no reason 
  def boy_named_sue
  	if gender == "male" && first_name == "Sue"
  		errors.add(:gender, "anything but Sue")
  	end
  end
 end
