class ReferralsController < ApplicationController
  before_action :set_contact
  before_action :set_referral, only: [:show, :update, :destroy]

  def index
    json_response(@contact.referrals)
  end

  def show
    json_response(@referral)
  end

  def create
    @referral = @contact.referrals.create!(referral_params)
    json_response(@referral, :created)
  end

  def update
    @referral.update(referral_params)
    head :no_content
  end

  def destroy
    @referral.destroy
    head :no_content
  end

  private

  def set_contact
    @contact = Contact.find(params[:contact_id])
  end

  def set_referral
    @referral = @contact.referrals.find_by!(id: params[:id]) if @contact
  end

  def referral_params
    params.permit(:name, :email)
  end
end
