class Admin::NeedsController < ApplicationController
  def new
    @organization = Organization.find(params[:organization_id])
    @need = @organization.needs.new
  end

  def create
    @organization = Organization.find(params[:organization_id])
    @need = @organization.needs.new(need_params)

    if @need.save
      redirect_to [:admin, @organization]
    else
      render :new
    end
  end

  def enable
    @need = Need.find(params[:need_id])

    @need.update!(enabled: true)

    render 'replace_button'
  end

  def disable
    @need = Need.find(params[:need_id])

    @need.update!(enabled: false)

    render 'replace_button'
  end

  private

  def need_params
    params.require(:need).permit(:item, :comment)
  end
end
